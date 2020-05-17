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
    
    
    //---------------------------------------------
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createMenuList()
        setupTableView()
    }

    //---------------------------------------------
    // MARK: - Private
    
    private func createMenuList(){
        menuList = TopMenuList(plistName: plistPathString())
    }
    
    private func setupTableView() {
        guard let sourceObject = menuList else {
            assert(false, "TopMenuListが作成できません")
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
