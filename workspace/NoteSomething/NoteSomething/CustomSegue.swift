//
//  CustomSegue.swift
//  NoteSomething
//
//  Created by snowman on 2017/03/13.
//  Copyright © 2017年 snowman. All rights reserved.
//

import UIKit

class CustomSegue: UIStoryboardSegue {
    
    override func perform() {
        
        let sourceViewController = self.source
        //let destinationController = self.destination
        let navigationController = sourceViewController.navigationController
        
        // Pop to root view controller (not animated) before pushing
        if self.identifier == "showWordListSegue"{
            //単語リスト画面遷移
            let controller = (self.destination as! UINavigationController).topViewController as! WordTableViewController
            navigationController?.pushViewController(controller, animated: true)
        } else if self.identifier == "showDetailSegue"
            || self.identifier == "showWordDetailSegue"
            || self.identifier == "showImageDetailSegue" {
            
            //各データの詳細画面遷移（ナビゲーション）
            let controller = (self.destination as! UINavigationController).topViewController as! DetailViewController
            navigationController?.pushViewController(controller, animated: true)
        } else if self.identifier == "showImgListSegue" {
            //イメージリスト画面遷移
            let controller = (self.destination as! UINavigationController).topViewController as! ImageCollectionViewController
            navigationController?.pushViewController(controller, animated: true)
        } else if self.identifier == "" {
            
        }
    }
}
