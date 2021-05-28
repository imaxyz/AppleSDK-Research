//
//  TopMenuListTableViewDataSource.swift
//  AppleSDKTips
//

import UIKit

/// TopMenu・テーブルビューのデータソース
class TopMenuListTableViewDataSource: NSObject, UITableViewDataSource {
    
    //---------------------------------------------
    // MARK: - Properties

    weak var topMenuListObject: TopMenuList?
    
    //---------------------------------------------
    // MARK: - Life Cycle
    
    init(source: TopMenuList) {
        
        topMenuListObject = source
    }
    
    //---------------------------------------------
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        guard let ref = topMenuListObject else {
            return 0
        }
        
        return ref.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let ref = topMenuListObject else {
            return 0
        }
        
        return ref.numberOfItem(forSection: ref.sectionNameString(with: section))
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        guard let ref = topMenuListObject else {
            return ""
        }
        
        return ref.sectionNameString(with: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        guard let ref = topMenuListObject else {
            return UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: TopMenuListTableViewCell.cellIdentifier())
        }

        let sectionNo = indexPath.section
        let rowNo = indexPath.row
        
        let sectionName = ref.sectionNameString(with: sectionNo)
        
        let topMenu = ref.item(forSection: sectionName, index: rowNo)

        var cell = tableView.dequeueReusableCell(withIdentifier: TopMenuListTableViewCell.cellIdentifier())
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: TopMenuListTableViewCell.cellIdentifier())
        }
        
        guard let cellRef: TopMenuListTableViewCell = cell as! TopMenuListTableViewCell? else {
            return UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: TopMenuListTableViewCell.cellIdentifier())
        }
        cellRef.titleLabel.text = topMenu?.titleString

        if TopMenuListTableViewDataSource.isValidTopMenu(entity: topMenu) {
            cellRef.titleLabel.textColor = UIColor.blue
        }else {
            cellRef.titleLabel.textColor = UIColor.lightGray
        }
        
        return cellRef
    }

    //---------------------------------------------
    // MARK: - Private

    
    /// 選択可能なTopMenuかを判定
    ///
    /// - Parameter entity: TopMenuインスタンス
    /// - Returns: true: 選択可能, false: 無効
    class func isValidTopMenu(entity: TopMenuEntity?) -> Bool {
        
        /* 名前があるか */
        guard let vcName = entity?.viewControllerNameString else {
            return false
        }
        
        /* 十分な長さか */
        if vcName.utf8.count == 0 {
            return false
        }
        
        /* ViewControllerに対応するStoryboardファイルがリソースに存在するか */
        guard let _ = Bundle.main.path(forResource: vcName, ofType: "storyboardc") else {
            return false
        }

        /* Storyboardから最初のViewControllerを作成することができるか */
        let storyboard = UIStoryboard(name: vcName, bundle: nil)
        guard storyboard.instantiateInitialViewController() != nil else {
            return false
        }
        
        return true
    }

}
