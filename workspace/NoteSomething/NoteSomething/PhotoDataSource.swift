//
//  PhotoDataSource.swift
//  NoteSomething
//
//  Created by snowman on 2017/03/15.
//  Copyright © 2017年 snowman. All rights reserved.
//

import Foundation
import UIKit

struct Photo {
    var caption = ""
    var comment = ""
    var imageNm = ""
    var image: UIImage?
    
    init() {
        self.caption = ""
        self.comment = ""
        self.imageNm = ""
        self.image = nil
    }
   
    init(_ caption:String, comment:String = "", imageNm:String = "") {
        self.caption = caption
        self.comment = comment
        self.imageNm = imageNm
        if !self.imageNm.isEmpty {
           self.image =  UIImage(named:imageNm)
        }
    }
    
    func heightForCaption(_ font: UIFont, width: CGFloat) -> CGFloat {
        
        let rect = NSString(string: caption).boundingRect(
            with: CGSize(width: width, height: CGFloat(MAXFLOAT)),
            options: .usesLineFragmentOrigin,
            attributes: [NSFontAttributeName: font], context: nil)
        
        return ceil(rect.height)
    }
    
    func heightForComment(_ font: UIFont, width: CGFloat) -> CGFloat {
        
        let rect = NSString(string: comment).boundingRect(
            with: CGSize(width: width, height: CGFloat(MAXFLOAT)),
            options: .usesLineFragmentOrigin,
            attributes: [NSFontAttributeName: font], context: nil)
        
        return ceil(rect.height)
    }
}

final class PhotoDataSource {
    
    static let fileName = "photos"
    static let fileType = "plist"
    
    static func plist() -> [Photo] {
        
        var result = [Photo]()
        
        guard let filePath =  Bundle.main.path(forResource: fileName, ofType: fileType) else {
            return result
        }
        
        guard let contentsOfFile = NSDictionary(contentsOfFile: filePath) else {
            return result
        }
        
        let photos = contentsOfFile.object(forKey: "photos") as! NSArray
        
        photos.forEach {
            
            guard let dic = $0 as? NSDictionary else {
                return
            }
            
            var photo = Photo()
            photo.caption = dic.object(forKey: "caption") as? String ?? ""
            photo.comment = dic.object(forKey: "comment") as? String ?? ""
            photo.imageNm = dic.object(forKey: "image"  ) as? String ?? ""
            photo.image = UIImage(named: dic.object(forKey: "image") as? String ?? "")
            result.append(photo)
        }
        return result
    }
}
