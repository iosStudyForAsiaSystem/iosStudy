/*:
 ## 演習問題：引数のラベル

 関数とその引数は、呼び出される時にわかりやすいように、説明のような名前にする必要があります。これをより簡単にするため、パラメータに2つの名前を付けることができます。関数を呼び出す時に使う「引数のラベル」と、関数本文の中で使う「パラメータ名」です。
*/
func score(reds: Int, greens: Int, golds: Int) -> Int {
    let pointsPerRed = 5
    let pointsPerGreen = 10
    let pointsPerGold = 30
    
    let redScore = reds * pointsPerRed
    let greenScore = greens * pointsPerGreen
    let goldScore = golds * pointsPerGold
    
    return redScore + greenScore + goldScore
}
let finalScore = score(reds: 5, greens: 3, golds: 3)
/*:
*/
/*:
 - callout(演習): 関数の定義に引数のラベルを追加して、呼び出す時に次のようになるようにしてください。\
 `let finalScore = score(withReds: 5, greens: 3, golds: 3)`
*/





//: [前ヘ](@previous)  |  16／17ページ  |  [次は「演習問題：引数のラベルを使わない場合」です。](@next)
