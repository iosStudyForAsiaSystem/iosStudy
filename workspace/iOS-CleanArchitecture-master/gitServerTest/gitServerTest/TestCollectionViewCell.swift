//
//  TestCollectionViewCell.swift
//  gitServerTest
//
//  Created by snowman on 2017/02/16.
//  Copyright © 2017年 snowman. All rights reserved.
//

import UIKit

class TestCollectionViewCell: UICollectionViewCell ,UICollectionViewDelegate,
UICollectionViewDataSource {
    @IBOutlet weak var numButton: UIButton!

    @IBOutlet weak var subCollectionView: UICollectionView!
    
    @IBAction func onNumClicked(_ sender: UIButton) {

        let clickedNum: Int = Int(sender.title(for: UIControlState.normal)!)!

        if (clickedNum == CustomData.sharedInstance.minimumNumber()) {

            CustomData.sharedInstance.setCurrentNum( num: clickedNum )

            sender.isEnabled = false
            sender.backgroundColor = UIColor.gray

            NotificationCenter.default.post(name: CustomData.InputCompleteNotifyKey, object: nil)
        } else {
            sender.isSelected = false
        }
    }
    
    
    // MARK: UICollectionViewDelegate
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubCell", for: indexPath) as! TestCollectionViewSubCell
        
        configureCell(cell: cell, forItemAt: indexPath as NSIndexPath)
        
        return cell
    }
    
    func configureCell(cell: TestCollectionViewSubCell, forItemAt indexPath: NSIndexPath) {
        


        
    }
    
    //    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    //        let view =  collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "TestCell", for: indexPath) as UIView
    //        return view as! UICollectionReusableView
    //    }
    //
    // MARK: UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("TestCollectionViewSubCell didSelectItem ")
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
    }
}
