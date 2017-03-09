//
//  UINavigationController + Util.swift
//
//
//  Created by snowman on 2017/02/14.
//
//

import UIKit

//Same function as "popViewController", but allow us to know when this function ends

extension UINavigationController {
    
    func popViewControllerWithHandler(completion: @escaping ()->()) {
        
        self.popViewController(true , completion )
        
    }
    
    func popViewControllerWithHandler(animated: Bool , completion: @escaping ()->()) {
        
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        self.popViewController(animated: animated)
        CATransaction.commit()
    }
    
    func pushViewController(viewController: UIViewController, completion: @escaping ()->()) {
     
        self.pushViewController(viewController, true, completion)
    }
    
    func pushViewController(viewController: UIViewController,animated:Bool , completion: @escaping ()->()) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        self.pushViewController(viewController, animated: animated)
        CATransaction.commit()
    }
    
    
    func popToRootViewControllerWithHandler(completion: @escaping ()->()) {
        self.popToRootViewControllerWithHandler(true, completion)
    }
    
    func popToRootViewControllerWithHandler(animated: Bool ,completion: @escaping ()->()) {
        
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        self.popToRootViewController(animated: animated)
        CATransaction.commit()
    }
}
