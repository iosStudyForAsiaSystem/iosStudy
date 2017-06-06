/*:
 ## 列挙型を比較する
 
 enumを使って判断するには、1つの値を別の値と比較できる必要があります。 
 */
/*:
 以下は、前に扱った`LunchChoice`のenumです。
*/
enum LunchChoice {
    case pasta, burger, soup
}
/*:
 enumの値は、`String`型や`Int`型の値と同じように、`==`を使って比較できます。
*/
let myLunch = LunchChoice.burger
let yourLunch = LunchChoice.burger

if myLunch == yourLunch {
    "We're having the same for lunch!"
} else {
    "Can I try your lunch?"
}
/*:
 */
//: - callout(演習): `myLunch`を別の選択肢に変更し、結果サイドバーに表示される値を確認してください。
/*:
*/
//: 次に、enumを使って`cookLunch`関数の改良版を作成します。
/*:
*/
//: [前ヘ](@previous)  |  6／21ページ  |  [次は「列挙型と関数」です。](@next)
