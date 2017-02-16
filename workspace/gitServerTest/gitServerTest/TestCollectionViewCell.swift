//
//  TestCollectionViewCell.swift
//  gitServerTest
//
//  Created by snowman on 2017/02/16.
//  Copyright © 2017年 snowman. All rights reserved.
//

import UIKit


class TestCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var numButton: UIButton!
    
    @IBAction func onNumClicked(_ sender: UIButton) {

        let clickedNum:Int = Int(sender.title(for: UIControlState.normal)!)!
        
    
        if (clickedNum == CustomData.sharedInstance.minimumNumber()) {
        
            CustomData.sharedInstance.setCurrentNum( num: clickedNum )
            
            
            sender.isEnabled = false;
            sender.backgroundColor = UIColor.gray
        } else {
            sender.isSelected = false
        }
    }
}
