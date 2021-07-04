//
//  TopMenuTableViewDelegate.swift
//  AppleSDKTips
//

import UIKit

// MARK: - UITableViewDelegate

extension TopMenuListViewController:  UITableViewDelegate
{
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        /* 選択解除効果を実行 */
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        guard let modelRef = menuList else {
            return
        }

        let sectionName = modelRef.sectionNameString(with: indexPath.section)
        let entity = modelRef.item(forSection: sectionName, index: indexPath.row)

        guard let entityRef = entity else {
            return
        }
        
        guard let vcName = entityRef.viewControllerNameString else {
            return
        }
        
        if vcName.utf8.count == 0 {
            return
        }

        guard let _ = Bundle.main.path(forResource: vcName, ofType: "storyboardc") else {
            return
        }
        
        let storyboard = UIStoryboard(name: vcName, bundle: nil)
        
        guard let viewController = storyboard.instantiateInitialViewController() else {
            return
        }
        
        viewController.title = entityRef.titleString
        self.present(viewController, animated: true, completion: {})
        
    }
    
}
