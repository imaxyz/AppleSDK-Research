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
//                    print("==== Todo ====")
//                    print("Name: \(todo.name)")
//                    if let priority = todo.priority {
//                        print("Priority: \(priority)")
//                    }
//                    if let description = todo.description {
//                        print("Description: \(description)")
//                    }
                    
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
