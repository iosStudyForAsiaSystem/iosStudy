//
//  ImgCollectionViewCell.swift
//  NoteSomething
//
//  Created by snowman on 2017/03/16.
//  Copyright © 2017年 snowman. All rights reserved.
//

import UIKit

class ImgCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var thumnailImageView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
 
    
    
    var photo: Photo? {
        
        didSet {
            
            self.displayInfo(photo)
        }
    }
    
    
    //    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
    //        super.apply(layoutAttributes)
    //
    //        if let attributes = layoutAttributes as? PinterestLayoutAttributes {
    //            imageViewHeightLayoutConstraint.constant = attributes.photoHeight
    //        }
    //    }
    
    
    func displayInfo(_ data:Photo?) {
        if let photo = data {
            thumnailImageView.image = photo.image
            captionLabel.text = photo.caption
            commentLabel.text = photo.comment
        }
    }
    
}
