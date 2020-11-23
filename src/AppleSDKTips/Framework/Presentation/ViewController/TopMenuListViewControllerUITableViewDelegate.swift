//
//  TopMenuTableViewDelegate.swift
//  AppleSDKTips
//

import UIKit

// MARK: - UITableViewDelegate

extension TopMenuListViewController:  UITableViewDelegate
{
    
    /// テーブルセルを選択した
    /// - Parameters:
    ///   - tableView: メニューリストtableViewのインスタンス
    ///   - indexPath: 選択した行の情報
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        /* 選択解除効果を実行 */
        tableView.deselectRow(at: indexPath, animated: true)
        
        // メニュー情報があるか判定する
        guard let modelRef = menuList else {
            return
        }

        // 選択した行に相当するメニュー情報を取得する
        let sectionName = modelRef.sectionNameString(with: indexPath.section)
        let entity = modelRef.item(forSection: sectionName, index: indexPath.row)

        guard let entityRef = entity else {
            return
        }
        
        // メニュー情報からViewControllerの名称を取得する
        guard let vcName = entityRef.viewControllerNameString else {
            return
        }
        
        if vcName.utf8.count == 0 {
            return
        }

        // ViewControllerに対応するStoryboardの存在チェック
        guard let _ = Bundle.main.path(forResource: vcName, ofType: "storyboardc") else {
            return
        }
        
        // ViewControllerと同名を持つストーリーボードオブジェクトを生成する
        let storyboard = UIStoryboard(name: vcName, bundle: nil)
        
        // Storyboardから、ViewControllerオブジェクトを取得する
        guard let viewController = storyboard.instantiateInitialViewController() else {
            return
        }
        
        // ViewControllerに、メニューのタイトルを設定する
        viewController.title = entityRef.titleString
        
        // ViewControllerを表示する
        self.present(viewController, animated: true, completion: {})
        
    }
    
}
