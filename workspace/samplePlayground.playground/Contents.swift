//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


var goukei = 0

for num in 1...10 {
    goukei = goukei + num

    
}

for kakudo in 0..<360 {
    let radian = Double(kakudo) * M_PI/180
    let y1 = sin (radian)
    
    let y2 = sin (radian*3)
    let y3 = cos (radian*3)
}
//#1 print sample
func debugPrint () {
    
    let msg = "こんにちは"
    let boy = 12
    let girl = 10
    let array = ["a", "b", "c"]
    
    
    
    // 出力する
    print(msg)
    print(boy, girl) // 複数の値をカンマで区切る
    print("男子 \(boy)、女子 \(girl)", terminator: " ---- ") // 改行しない
    print("合計 \(boy + girl)人")
    print(array) // 配列
}

debugPrint()

//#2 var sample
func debugVar () {
    var kokugo:Int
    var sansu:Int
    var goukei:Int
    kokugo = 56
    sansu = 67
    goukei = kokugo + sansu
    print(goukei)
}

debugVar ()

//#3 separator sample
func separator() {
    let msg1 = "こんにちは"
    let msg2 = "ありがとう"
    let msg3 = "さようなら"
    print(msg1, msg2, msg3, separator:"／")
}

separator()

// #4 if sample
func kuji() {
    // 1〜10の乱数を作る
    let num = arc4random_uniform(10)+1
    // numの値で処理を分岐する
    if num>=7 {
        // numが7以上の時
        let msg = "あたり"
        print(num, msg)
    } else {
        // numが7未満の時
        let msg = "はずれ"
        print(num, msg)
    }
}

kuji()

//　#5 tuple sample
func tupleType () {
    
    var product:( String, Int)
    product    = ("Swift", 2014)
    
    var guest:(String, String, Int)
    guest = ("大重", "おおしげ", 1234)
    
    print(guest, product)
}



func tupleItem() {
    
    
    // タプルの値を取り出す
    let data = (1000, 80)
    let (price, tax) = data
    let kingaku = price + tax
    print(kingaku)
    
}

func tupleIndex () {
    
    // インデックス番号で変更する
    var user = ("鈴木", 29)
    user.1 = 30
    print(user)
    
}

func tupleLabel () {
    
    // ラベルと型を指定したタプル
    
    var user:(name:String, age:Int, isPass:Bool)
    user.name = "高田"
    user.age = 23
    user.isPass = true
    print(user)
    print(user.age)
}
tupleType ()
tupleItem()
tupleIndex()
tupleLabel()


//#6 range sample
func rangeOperation() {
    
    // 整数の範囲
    let rangeInt = -5..<5
    print(rangeInt.contains(-8))
    print(rangeInt.contains(-3))
    print(rangeInt.contains(2))
    print(rangeInt.contains(5))
    print(rangeInt.contains(7))
    print("-------------------------")
    // 実数の範囲
    let rangeDouble = 0.0...1.0
    print(rangeDouble.contains(0.1))
    print(rangeDouble.contains(1.0))
    print(rangeDouble.contains(1.5))
    
}

rangeOperation()

//#7 switch-String sample
func switchString() {
    
    // theColor Listの値によって処理を分岐する
    let theColor = "green"
    switch theColor {
    case "red","yellow":
        print("赤と黄色は注意")
    case "green":
        print("緑は快適")
    case "gray":
        print("グレーは停止中")
    default:
        print("その他は順調")
    }
    print(theColor)
    
}

switchString()

//#8 switch-tuple sample

func switchTuple () {
    
    // タプルを使った振り分け
    let size = (6, 11)
    switch size {
    case (0, 0):
        print("幅高さともに0 です")
    case (5...10, 5...10):
        print("規定サイズです")
    case (_, 5...10):
        print("幅\(size.0) が規格外です")
    case (5...10, _):
        print("高さ\(size.1) が規格外です")
    default:
        print("幅高さともに規定外です")
    }
}

switchTuple()

//#9 switch-where sample
func switchWhere( ) {
    
    
    // 条件付きの振り分け
    let size = (70, 80  , 100)
    switch size {
    case let (width, height, _) where (width<=60)||(height<=60):
        print("規定外：幅高さのどちらかが60以下")
    case let (_, _, weight) where (weight>=80):
        print("規定外：重さ80以上")
    case let (_,height,_) where (height > 120):
        print("規定外：高さ120未上")
    default:
        print("規定サイズ内")
    }
    
    
}

typealias HumanSizeType = (width:Int, height:Int, weight:Int)

//func switchWhere2(width:Int , height:Int , weight:Int ) {
func switchWhere2(size:HumanSizeType) {

    // 条件付きの振り分け
    switch size {
    case let (w,h,_) where (w<=60)||(h<=60):
        print("規定外：幅高さのどちらかが60以下")

    case  let (_,_,w) where (w>=80):
        print("規定外：重さ80以上")
 
        
    case let (_,h,_) where (h > 120):
        print("規定外：高さ120未上")

    default:
        print("規定サイズ内")
    }
    
    
}
switchWhere()
//switchWhere2(width: 40 ,height: 70, weight: 100)
switchWhere2(size:(40,70,100))


//#10 for- stride sample 

func forLoopStrideSample() {
    
    
    // 10から30まで3ずつ増える数値を取り出す
    for num in stride(from: 10, to: 30, by: 3) {
        print(num, terminator: ",")
    }
}

forLoopStrideSample()


//#11 for-char sample
func forLoopChar () {

    // ストリングから1文字ずつ取り出す
    
    let message = "おもてなし"
    for char in message.characters {
        print(char)
    }
    
}

forLoopChar()

//#12 repeat while loop sample
func repeatWhileLoopSample() {

    
    // 合計が21 になるList 3個の数値（1～ 13）の組み合わせを探す
    var a:UInt32, b:UInt32, c:UInt32
    var total:UInt32
    repeat {
        a = arc4random_uniform(13)+1 //1 ～ 13 の乱数
        b = arc4random_uniform(13)+1
        c = arc4random_uniform(13)+1
        total = a+b+c
        
    
    } while (total != 21)
    
    print("\(a),\(b),\(c)")
    
}

repeatWhileLoopSample()

