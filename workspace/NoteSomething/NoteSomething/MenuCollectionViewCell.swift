//
//  MenuCollectionViewCell.swift
//  NoteSomething
//
//  Created by snowman on 2017/03/13.
//  Copyright © 2017年 snowman. All rights reserved.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    func dipsplayCell (_ data:(name:String, type:DataType)) {
        
        self.button.setTitle(data.name, for: .normal)
        self.button.setTitleColor(.black, for: .normal)
        self.button.backgroundColor = .yellow
        self.button.tag = data.type.rawValue
        
        switch data.type {
        case .groupType:
                self.imageView.image = UIImage(named: "groupImg")
                break
        case .wordType:
                self.imageView.image = UIImage(named: "wordImg")
                break
        case .imageType:
            self.imageView.image = UIImage(named: "flower")
            break
        case .allType:
                self.imageView.image = UIImage(named: "easy_input")
            break
        default:
            break
        }
    }
}
