//
//  FirstViewController.swift
//  gitServerTest
//
//  Created by snowman on 2017/02/09.
//  Copyright © 2017年 snowman. All rights reserved.
//

import UIKit


class FirstViewController: UIViewController ,


                            UICollectionViewDelegate,
                            UICollectionViewDataSource
{
    @IBOutlet weak var restartBtn: UIButton!
 
    @IBOutlet weak var numPadView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        clearCustomData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: UICollectionViewDelegate
    //MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TestCell", for: indexPath) as! TestCollectionViewCell
        
        configureCell(cell: cell, forItemAt: indexPath as NSIndexPath)

        return cell
    }
    
    func configureCell(cell: TestCollectionViewCell, forItemAt indexPath: NSIndexPath) {
        
        //let titleString = String( arc4random_uniform(100) + 1)
        
        let titleString = String(indexPath.row + 1)
        
        cell.numButton.setTitle(titleString, for: UIControlState.normal)
        cell.numButton.setTitle(titleString, for: UIControlState.selected)
        cell.numButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        cell.numButton.setTitleColor(UIColor.gray, for: UIControlState.selected)
        if cell.numButton.isSelected {
            cell.numButton.backgroundColor = UIColor.black
        } else {
            cell.numButton.backgroundColor = UIColor.blue
        }
        cell.numButton.layer.cornerRadius = 5
        
    }
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        let view =  collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "TestCell", for: indexPath) as UIView
//        return view as! UICollectionReusableView
//    }
//    
    //MARK: UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
    }
    
    @IBAction func onClickRestart(_ sender: UIButton) {
        
        clearCustomData()
        self.numPadView.reloadData()
    }
    
    func clearCustomData() {
        
        CustomData.sharedInstance.currentNum = 0;
    }
}

