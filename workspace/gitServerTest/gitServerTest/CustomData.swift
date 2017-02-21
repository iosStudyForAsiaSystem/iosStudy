//
//  CustomData.swift
//  gitServerTest
//
//  Created by snowman on 2017/02/16.
//  Copyright © 2017年 snowman. All rights reserved.
//

import UIKit

class CustomData: NSObject {

    static let sharedInstance = CustomData()

    static let InputCompleteNotifyKey: NSNotification.Name
        = NSNotification.Name(rawValue: "CheckCompeleteInput")

    var  currentNum: Int = 0

    func setCurrentNum (num: Int) {

        self.currentNum = num

        currentList.sort {$0 < $1 }

        currentList.removeFirst()

    }

     private  var  currentList: Array<Int> = Array()

     func makeSamplingData(itemCount: Int = 9, randomLimit: UInt32 = 100) {
        //var array : Array<Int> = Array()
        currentList.removeAll()

        var index = 0

        repeat {

            let data: Int = Int(arc4random_uniform(randomLimit) + 1)

            if !currentList.contains(data) {

                index += 1
                currentList.append(data)
            }

        } while (index < itemCount)

    }

    func minimumNumber () -> Int {
       print ("minimumNumber:")
       print ( (currentList.min() ?? ""))
       return  currentList.min()!
    }

    func maximumNumber () -> Int {
        return  currentList.max()!
    }

    func findNumberItemFromIndex(index: Int) -> Int {
        if currentList.count < index {
            return 0
        }
        return currentList[index]
    }

    func isClickedAllButton() -> Bool {
      return  self.currentList.count == 0
    }

}
