//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//#0 check optional variable sample
func checkOptinalVariableSampe () {
    
    let msg:String?  = "Hello"
    
    let msg2  = msg! + "world"
    
    
    var count:Int?
    var price:Int

        
    price = 250 * (count ?? 2 )
    
    
    print (price, msg2)
    
    var sum = 0
    let dic:[String:Int?] = ["1ban":23, "2ban":33, "3ban":44 , "4ban":nil]
    
    for (_, val) in dic {
        if let num = val {
            sum += num
        }
    }
    
    print(sum )
    
    
    var balls:[(size:Int , color:String)] = []
    var ballSize = balls.first?.size
    
    balls = [(size:2, color:"red"), (size:4, color:"green")]
    ballSize = balls.first?.size
    
    print(ballSize ?? "")
    
}

checkOptinalVariableSampe()

//#1 class definition sample
class SampleClass {
    
    var msg:String = ""
    private var name:String = ""
    var radius:Double = 1.0
    
    static var length = 0.0
    
    convenience init(msg:String = "hello") {
        self.init(msg:msg , name: "gues", radius : 1.0, area:1.0)
    }
    
    init(msg:String, name:String,radius:Double, area: Double) {
        self.msg = msg
        self.name = name
        self.radius = radius
        self.area = area
    }
    
    var area:Double {
        get {
            return radius * radius * M_PI
        }
        set (menseki){
            radius = sqrt(menseki*M_PI)
        }
//        willSet{
//            print(area)
//        }
//        
//        didSet{
//            print(area)
//        }
    }
    
    class var crossLength:Double {
        get {
            return length * length * 2
        }
        set (len){
            length = len*M_PI
        }
    }
    
    class func calcAreaA(name:String ) -> Double {
        print(name)
        return self.length * 100
    }
    
    func displayArea() {
        print(self.area)
    }
}

SampleClass.crossLength = 10



//#2 extension class sample

extension SampleClass {
    
    //var tempture :String  -> error 
    
    var triangleArea:String {
        get {
            return String((self.radius + self.radius) * 4.0 )
        }
        set(param){
            self.radius = (param as NSString ).doubleValue

            print(radius)
        }
    }
    
}
let sClass = SampleClass(msg: "test1")

sClass.area = 4
print(sClass.area)

print(SampleClass.calcAreaA(name: "name1"))

sClass.displayArea()

sClass.triangleArea = "199.0"

print(sClass.triangleArea)


//sClass.name = "test" -> error: private member

//#3 protocol sample

protocol test1Protocol {
    var gamePoint:Int {get }
    func hit()
    func miss ()
}

class testModel:test1Protocol {
    private var total = 0
    
    var gamePoint: Int {
        get {
            return total
        }
    }
    
    func hit() {
        total += 10
    }
    func miss () {
        total -= 5
    }
}


//#4 enum sample 

enum PColor:String {
    case red = "aka"
    case green = "green"
    case yellow = "yellow"
    case white = "white"
    
}

enum Pattern {
    case Mono(_:PColor)
    case Border(color1:PColor, color2:PColor)
    case Dots(base:PColor, dot1:PColor, dot2:PColor)
}

let shirt1 = Pattern.Mono(.red)
print(shirt1)

//#5 struct sample

struct ColorBox {
    var width :Int
    var height:Int
    var color:String
    static var alpha:Double = 1.0
}


struct WhiteBox {
    var width :Int = 1
    var height:Int = 1
    var color:String = "white"
    
}

let theBox1 = WhiteBox()

let theBox2 = ColorBox(width: 10, height: 10, color: "yellow")

ColorBox.alpha = 0.9






