//
//  AmplifyStartDemoViewController.swift
//
//  Created on 2021/05/18
//  Copyright © 2021 imaxyz. All rights reserved.
//

import UIKit
import Amplify

class AmplifyStartDemoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        query_data_store()
    }
    
    // Todoモデルを問い合わせる
    @IBAction func query_data_store() {
        
        Amplify.DataStore.query(Todo.self,
                                // クエリの条件を付加
                                where: Todo.keys.priority.eq(Priority.high))
        { result in
            
            switch(result) {
            case .success(let todos):
              print("todo count: \(todos.count)")
              
              for todo in todos {
                  print("==== Todo ====")
                  print("Name: \(todo.name)")
                  if let priority = todo.priority {
                      print("Priority: \(priority)")
                  }
                  if let description = todo.description {
                      print("Description: \(description)")
                  }
              }
            case .failure(let error):
                print("Could not query DataStore: \(error)")
            }
        }
    }

    @IBAction func didTapCreateTodoButton(_ sender: Any) {

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
    }
    
    

}
