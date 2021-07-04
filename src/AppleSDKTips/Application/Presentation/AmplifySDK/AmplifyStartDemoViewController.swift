//
//  AmplifyStartDemoViewController.swift
//
//  Created on 2021/05/18
//  Copyright © 2021 imaxyz. All rights reserved.
//

import UIKit
import Amplify

class AmplifyStartDemoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var todo_list_table_view: UITableView!
    
    var todo_list = [Todo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        query_data_store()
    }
    
    // MARK: - Button Actions
    
    @IBAction func did_tap_create_todo_button(_ sender: Any) {

        // 現在時刻を取得
        let current_time = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yMMMdHms", options: 0, locale: Locale(identifier: "ja_JP"))
        let current_time_string = dateFormatter.string(from: current_time)

        // GraphQLのモデル: Todoを生成
        let item = Todo(name: "todo model: \(current_time_string)",
                        priority: .high,
                        description: "description: \(current_time_string)")

        // Todoモデルを永続化
        Amplify.DataStore.save(item) { result in
           switch(result) {
           
           case .success(let savedItem):
               print("Saved item: \(savedItem.name)")
            
           case .failure(let error):
               print("Could not save item to DataStore: \(error)")
            
           }
        }
        
        // 内部メモリにTodoモデルを再読み込み
        query_data_store()
        
        // テーブルを再読み込み
        todo_list_table_view.reloadData()
    }
    
    // Todoモデルを問い合わせる
    @IBAction func query_data_store() {
        
        let query_sort = QuerySortInput([QuerySortBy.descending(Todo.keys.description)])
        Amplify.DataStore.query(Todo.self,
                                // クエリの条件を付加
                                where: Todo.keys.priority.eq(Priority.high),
                                sort: query_sort)
        { result in
            
            switch(result) {
            case .success(let todos):
                print("todo count: \(todos.count)")
              
                // todo リストの内部メモリを初期化
                todo_list.removeAll()
                
                for todo in todos {
                    print("==== Todo ====")
                    print("Name: \(todo.name)")
                    if let priority = todo.priority {
                        print("Priority: \(priority)")
                    }
                    if let description = todo.description {
                        print("Description: \(description)")
                    }
                    
                    // todoリストにモデルを追加
                    todo_list.append(todo)
                }
                
                // テーブルを再読み込み
                todo_list_table_view.reloadData()

              case .failure(let error):
                  print("Could not query DataStore: \(error)")
              }
        }
    }
    
    /// Todo Updateボタンをタップ
    /// - Parameter sender: ボタンオブジェクト
    @IBAction func did_tap_update_todo_button(_ sender: UIButton) {
        print("did tap update todo button.")
        
        // アプリに、所定の条件のTodoデータを、問い合わせる
        Amplify.DataStore.query(Todo.self,
                                where: Todo.keys.name.eq("todo model: 2021年6月23日 8:33:01"))
        { result in
            
            switch(result) {
            case .success(let todos):
                
                //
                guard todos.count >= 1, var updatedTodo = todos.first else {
                    print("Did not find exactly one todo, bailing")
                    return
                }
                
                updatedTodo.name = "Updated Todo model"
                
                Amplify.DataStore.save(updatedTodo) { result in
                    
                    switch(result) {
                    case .success(let savedTodo):
                        print("Updated item: \(savedTodo.name)")
                        
                        let mainQueue = DispatchQueue.main
                        let time = DispatchTime.now() + Double(Int64(0.5 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
                        mainQueue.asyncAfter(deadline: time) {
                            // テーブルを再読み込み
                            self.query_data_store()
                        }
                        
                    case .failure(let error):
                        print("Could not update data in DataStore: \(error)")
                    }
                }
                
            case .failure(let error):
                print("Could not query DataStore: \(error)")
            }
        }
    }
    
    /// Todo Deleteボタンをタップ
    /// - Parameter sender: ボタンオブジェクト
    @IBAction func did_tap_delete_todo_button(_ sender: UIButton) {
        print("did tap delete todo button.")

        Amplify.DataStore.query(Todo.self,
                                where: Todo.keys.name.eq("Updated Todo model")) { result in
            switch(result) {
            case .success(let todos):
                
                guard todos.count >= 1, let toDeleteTodo = todos.first else {
                    print("Did not find exactly one todo, bailing")
                    return
                }
                
                Amplify.DataStore.delete(toDeleteTodo) { result in
                    switch(result) {
                    
                    case .success:
                        print("Deleted item: \(toDeleteTodo.name)")
                        
                        let mainQueue = DispatchQueue.main
                        let time = DispatchTime.now() + Double(Int64(0.5 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
                        mainQueue.asyncAfter(deadline: time) {
                            // テーブルを再読み込み
                            self.query_data_store()
                        }

                    
                    case .failure(let error):
                        print("Could not update data in DataStore: \(error)")
                    }
                }
            case .failure(let error):
                print("Could not query DataStore: \(error)")
            }
       }
    }
    
    
    
    // MARK: - UITableView

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var result_count = 0
        
        Amplify.DataStore.query(Todo.self,
                                // クエリの条件を付加
                                where: Todo.keys.priority.eq(Priority.high))
        { result in
            
            switch(result) {
            case .success(let todos):
                result_count = todos.count
            case .failure(let error):
                print("Could not query DataStore: \(error)")
            }
        }

        return result_count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let rowNo = indexPath.row

        let todo = todo_list[rowNo]
        
        let cell_identifier = "sample-cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cell_identifier)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: cell_identifier)
        }

        guard let cellRef: UITableViewCell = cell else {
            return UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: TopMenuListTableViewCell.cellIdentifier())
        }
        cellRef.textLabel?.text = todo.name

        return cellRef

    }
    

}
