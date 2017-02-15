//
//  Dispatch+Util.swift
//  
//
//  Created by snowman on 2017/02/14.
//
//


// use sample
//        DispatchQueue.once(token: "com.vectorform.test") {
//            print( "Do This Once!" )
//        }
//        or using a UUID
//
//        private let _onceToken = NSUUID().uuidString
//
//        DispatchQueue.once(token: _onceToken) {
//            print( "Do This Once!" )
//        }

public extension DispatchQueue {
    
    private static var _onceTracker = [String]()
    
    /**
     Executes a block of code, associated with a unique token, only once.  The code is thread safe and will
     only execute the code once even in the presence of multithreaded calls.
     
     - parameter token: A unique reverse DNS style name such as com.vectorform.<name> or a GUID
     - parameter block: Block to execute once
     */
    public class func once(token: String, block:(Void)->Void) {
        objc_sync_enter(self);
        defer { objc_sync_exit(self) }
        
        if _onceTracker.contains(token) {
            return
        }
        
        _onceTracker.append(token)
        block()
    }
    
    
    public class func once(file: String = #file, function: String = #function, line: Int = #line, block:(Void)->Void) {
        let token = file + ":" + function + ":" + String(line)
        once(token: token, block: block)
    }
    

//   DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//       block()
//   }
    
    
    
    
    
    
}

