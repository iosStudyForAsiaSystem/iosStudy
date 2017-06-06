/*:
 ## インスタンスメソッド
 
 「インスタンス」のレッスンでインスタンスメソッドの使い方を学びました。独自の型を定義する時、インスタンスメソッドも定義できます。
*/
/*:
インスタンスメソッドは関数のように宣言しますが、型定義の本文の中に配置します。
*/
struct Rectangle {
    let width: Int
    let height: Int
    
    func biggerThan(_ rectangle: Rectangle) -> Bool {
        let areaOne = width * height
        let areaTwo = rectangle.width * rectangle.height
        return areaOne > areaTwo
    }
}
/*:
 */
//: メソッド定義の本文内で、ピリオドを使わずに構造体の`height`と`width`の値にアクセスできます。インスタンスメソッドは構造体定義の一部として記述されるので、インスタンス内のプロパティに直接アクセスできるのです。
/*:
*/
//: 搭載されている型のメソッドと同様に、自分で定義したメソッドはインスタンス名、ピリオド、メソッド名と引数を使って呼び出されます。
let rectangle = Rectangle(width: 10, height: 10)
let otherRectangle = Rectangle(width: 10, height: 20)

rectangle.biggerThan(otherRectangle)
otherRectangle.biggerThan(rectangle)


/*:
 */
//: - callout(演習): `biggerThan`メソッドをシンプルにします。長方形構造体について`area`という名前の計算プロパティを作成し、この計算プロパティを`biggerThan()`メソッドの中で使用します。
//:





//: 次は、学習したことをまとめましょう。
/*:
 */
//: [前ヘ](@previous)  |  7／9ページ  |  [次は「まとめ」です。](@next)
