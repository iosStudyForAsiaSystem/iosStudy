//
//  UIColor + Util.swift
//  
//
//  Created by snowman on 2017/02/14.
//
//

import UIKit

extension UIColor {
    
    
    class func rgb(fromHex: Int) -> UIColor {
        
        let red =   CGFloat((fromHex & 0xFF0000) >> 16) / 0xFF
        let green = CGFloat((fromHex & 0x00FF00) >> 8) / 0xFF
        let blue =  CGFloat(fromHex & 0x0000FF) / 0xFF
        let alpha = CGFloat(1.0)
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    
    convenience public init(rgba: Int64) {
        let r = CGFloat((rgba & 0xFF000000) >> 24) / 255.0
        let g = CGFloat((rgba & 0x00FF0000) >> 16) / 255.0
        let b = CGFloat((rgba & 0x0000FF00) >>  8) / 255.0
        let a = CGFloat( rgba & 0x000000FF)        / 255.0
        
        self.init(red: r, green: g, blue: b, alpha: a)
    }
    
    class var background: UIColor {
        return UIColor(rgba: 0x43BFFEFF)
    }
    
    class var title: UIColor {
        return UIColor(rgba: 0xFE99ACFF)
    }
}

