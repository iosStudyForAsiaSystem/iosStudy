//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// #1 defer+guard sample 

func half(num:Double) {
    // 最後に必ず実行する
    defer {
        print("計算終了")
    }
    // 中断処理
    guard num>=10 else {
        // numが10以上でないとき関数から抜ける
        return
    }
    // 値を半分にして出力する
    let halfNum = num/2
    print("\(num)の半分は\(halfNum)")
}


    
    // 半分の値を出力する
    half(num: 25)
    half(num: 9)
    half(num: 12)

// #2 result return func sample

func testResult(kokugo:Int, sugaku:Int, eigo:Int) -> (total:Int, average:Double) {
    // 3科目合計
    let total = kokugo + sugaku + eigo
    // 3科目平均
    var ave = Double(total)/3
    // 小数点以下1位で四捨五入
    ave = round(ave*10)/10
    return (total, ave)
}


    // 3科目テスト結果
    let result = testResult(kokugo:80, sugaku: 68, eigo: 72)
    print("合計 \(result.total)")
    print("平均 \(result.average)")


// #3 default parameter sample
func greeting(who:String="Guest") -> String {
    
    return who+"greeting "
}

    greeting()
    greeting(who: "cal")


// 単価と人数を引数で指定して料金を計算する関数
func priceParam3(tanka:Int = 1, kosu:Int = 1, souryou:Int = 250) -> Int {
    let result = tanka * kosu + souryou
    return result
}


    // 例１：単価1000円の料金（個数と送料は省略して初期値で計算）
    let ex1 = priceParam3(tanka: 1000)
    print("\(ex1)円")
    
    // 例２：単価1000円、個数2 の料金（送料は省略して初期値で計算）
    let ex2 = priceParam3(tanka: 1000, kosu: 2)
    print("\(ex2)円")
    
    // 例３：単価2500、送料1500の料金を計算する（個数は省略して初期値で計算）
    let ex3 = priceParam3(tanka: 2500, souryou: 1500)
    print("\(ex3)円")
    
    // 例４：単価1200、個数5、送料0の料金を計算する
    let ex4 = priceParam3(tanka: 1200, kosu: 5, souryou: 0)
    print("\(ex4)円")
    // 例４：単価1、個数1、送料250の料金を計算する
    let ex5 = priceParam3()
    print("\(ex5)円")


//#4 generic parameter sample
func makeTuple<T>(value:T) -> (id:T, date:NSDate) {
    let now = NSDate()
    return (value, now)
}

print(makeTuple(value: 123))
print(makeTuple(value: "abc"))

//#5  param with method sample 
func message (user:String , msgFunc:(String) -> String) -> String
{
    let msg = msgFunc(user)
    return msg
}

message(user: "guest") { (user:String) -> String in
    return  user + "  go to destination"
}

func hello(user:String) -> String{
    return user + "hello"
}

func bye(user:String) -> String{
    return user + "bye"
}

message (user: "john", msgFunc: hello)
message (user: "sally", msgFunc: bye)

//#6 クロージャ sample1

func closureSample () {
    let closureFunc1 = {(param1:Int, param2:Int) ->Int in
        return param1 + param2
    }



    let answer1 = closureFunc1(1,2)

    print(answer1)

    let closureFunc2 = {
        (param1:String ) -> String in
        return param1  + " closureFunc2 result"
    }

    message (user:"ally", msgFunc: closureFunc2)
    
}

closureSample()

//#7　クロージャを引数で受け取る関数

func closureSample2() {
    
    let numbers = [4, 7, 2, 9]
    
    let array1 = numbers.map({(v:Int) -> Int in
        return v*2
    })
    
    print(array1)
    
    let array2 = numbers.map{(v:Int) -> Int in
        return v*2
    }
    
    
    print(array2)
    
    let array3 = numbers.map{v in v*2}
    
    print(array3)
    
    let array4 = numbers.map{$0*2}
    
    print (array4)
    
    let colors = ["red", "blue", "green"]
    
    let colors2 = colors.map{$0.uppercased()}
    
    print(colors2)
    
}

closureSample2()











