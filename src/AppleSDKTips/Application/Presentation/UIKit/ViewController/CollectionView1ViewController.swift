//
//  CollectionView1ViewController.swift
//  AppleSDKTips
//

import UIKit


/// コレクションビューサンプル - 1
class CollectionView1ViewController: UIViewController {
    
    //---------------------------------------------
    // MARK: Properties
    
    @IBOutlet weak var collectionView: UICollectionView!
    

    //---------------------------------------------
    // MARK: Override
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //---------------------------------------------
    // MARK: Button Action
    
    @IBAction func didSelectBackButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: {})
    }

}

extension CollectionView1ViewController: UICollectionViewDataSource {
 
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 39
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: CollectionView1Cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionView1Cell", for: indexPath) as! CollectionView1Cell

        cell.setText(message: "\(indexPath.row)")
        
        return cell
    }

}

extension CollectionView1ViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }

}
