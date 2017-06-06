/*:
 ## 関数
 
 独自の型は、最初から搭載されている型と同じように関数に渡したり関数から取り出したりできます。（実際には、搭載されている型を使える場所ならどこででも独自の型を使えます）
 */
/*:
 この構造体は、長方形の面積を定義します。
*/
struct Rectangle {
    let width: Int
    let height: Int
}
/*:
*/
//: ある長方形が別の長方形より大きいかどうか調べるには、次のように関数を定義できます。
func isRectangle(_ rectangle: Rectangle, biggerThan rectangle2: Rectangle) -> Bool {
    let areaOne = rectangle.height * rectangle.width
    let areaTwo = rectangle2.height * rectangle2.width
    return areaOne > areaTwo
}
/*:
 */
//: すると、この関数を使って2つの長方形を比較できます。
let rectangle = Rectangle(width: 10, height: 10)
let anotherRectangle = Rectangle(width: 10, height: 30)

isRectangle(rectangle, biggerThan: anotherRectangle)
/*:
*/
/*:
//: このコードは機能しますが、いくつかの問題があります。
//: - 関数に2つの引数があり、1行で多くのコードを読む必要があるため、わかりにくい。
//: - 関数はプログラム内のどこででも使えるが、必要なのは長方形を扱う時のみである。
//: - `isRectangle()`関数があることを知らなければ、オートコンプリートを使って見つけることは難しい。
 */
//:  次に、`Rectangle`型のこのような関数部分の作り方を見ていきます。
/*:
 */
//: [前ヘ](@previous)  |  6／9ページ  |  [次は「インスタンスメソッド」です。](@next)
