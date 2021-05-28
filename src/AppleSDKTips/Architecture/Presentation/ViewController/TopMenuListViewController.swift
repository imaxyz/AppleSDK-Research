//
//  TopMenuViewController.swift
//  AppleSDKTips
//

import UIKit

class TopMenuListViewController: UIViewController {

    //---------------------------------------------
    // MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    /** plistマスターデータのデータを供給するモデルコントローラー */
    var menuList: TopMenuList?

    /** テーブル・ビューのデータソース */
    var dataSource: TopMenuListTableViewDataSource?
    
    
    /// 例外
    enum TopMenuListError: Error {
        case menuNotFoundError  //表示するメニューが無い
    }
    
    //---------------------------------------------
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createMenuList()
        
        do {
            try setupTableView()
        } catch let error as NSError {
            assert(true, error.description)
        }
    }

    //---------------------------------------------
    // MARK: - Public
    
    @IBAction func backToTop(_ sender: UIStoryboardSegue) {
        
    }

    
    //---------------------------------------------
    // MARK: - Private
    
    private func createMenuList(){
        menuList = TopMenuList(plistName: plistPathString())
    }
    
    
    /// TableViewを初期化する
    /// - Throws: メニューが無かった場合、エラーを発行する
    private func setupTableView() throws {
        guard let sourceObject = menuList else {
            throw TopMenuListError.menuNotFoundError
        }
        dataSource = TopMenuListTableViewDataSource(source: sourceObject)
        tableView.dataSource = dataSource
    }
    
    private func plistPathString() -> String {
        
        let testBundle = Bundle(for: type(of: self))
        let path = testBundle.path(forResource: "topMenu", ofType: "plist")
        
        guard let plistPath = path else {
            return String()
        }
        
        return plistPath
    }
    
}
