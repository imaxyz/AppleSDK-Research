//
//  TopMenuListTableViewDataSource.swift
//  AppleSDKTips
//

import UIKit

/** TopMenu・テーブルビューのデータソース */
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
    // MARK: - TableView DataSource Delegate
    
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
            return UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: TopMenuListTableViewCell.cellIdentifier())
        }

        let sectionNo = indexPath.section
        let rowNo = indexPath.row
        
        let sectionName = ref.sectionNameString(with: sectionNo)
        
        let cellObject = ref.item(forSection: sectionName, index: rowNo)

        var cell = tableView.dequeueReusableCell(withIdentifier: TopMenuListTableViewCell.cellIdentifier())
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: TopMenuListTableViewCell.cellIdentifier())
        }
        
        guard let cellRef: TopMenuListTableViewCell = cell as! TopMenuListTableViewCell? else {
            return UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: TopMenuListTableViewCell.cellIdentifier())
        }
        cellRef.titleLabel.text = cellObject?.titleString

        return cellRef
    }

}
