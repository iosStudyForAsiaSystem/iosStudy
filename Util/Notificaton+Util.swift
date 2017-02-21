//
//  Notificaton+Util.swift
//  gitServerTest
//
//  Created by snowman on 2017/02/21.
//  Copyright © 2017年 snowman. All rights reserved.
//

import UIKit

extension Notificaton.Name : ExpressibleByStringLiteral {

    public init(unicodeScalarLiteral value:String) {
        self.init(rawValue :value)
    }
    
    public init(extendedGraphemeClusterLiteral value:String) {
        self.init(rawValue :value)
    }
    
    public init(stringLiteral value:String) {
        self.init(rawValue: value)
    }
}
