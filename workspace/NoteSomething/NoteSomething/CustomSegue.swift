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
        if self.identifier == "showWordList"{
            
            let controller = (self.destination as! UINavigationController).topViewController as! WordTableViewController
            navigationController?.pushViewController(controller, animated: true)
        } else if self.identifier == "showDetail"  || self.identifier == "showWordDetail" {
            
            let controller = (self.destination as! UINavigationController).topViewController as! DetailViewController
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}
