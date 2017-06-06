/*:
 ## 列挙型と関数
 
 列挙型（enum）の値は、ほかの型と同じように関数のパラメータや戻り値として使うことができます。 
*/
/*:
 以下は、これまで取り上げてきた`LunchChoice`のenumです。
*/
enum LunchChoice {
    case pasta, burger, soup
}
/*:
 */
//: 以前の`cookLunch`関数を次のように書き直すことができます。
func cookLunch(_ choice: LunchChoice) -> String {
    
    if choice == .pasta {
        return "🍝"
    } else if choice == .burger {
        return "🍔"
    } else {
        return "🍲"
    }
}

cookLunch(.burger)
/*:
 */
//: - experiment:(実験): 何度か関数を呼び出し、異なるメニューを渡します。



/*:
 文字列の代わりに`LunchChoice`のenumを使うことによって、`String`の値を取った場合にこの関数で生じる問題を解決することができます。以前の関数では、メニューに何があるかわかりませんでした。
 */
/*: 
 関数を呼び出す時、`LunchChoice`で渡す必要があるものがわかります。オートコンプリート機能によって、具体的なオプションが表示されます。リストに載っていないものは渡せないので、期待しているものが必ず得られます。
 */
/*:
 でも、この関数はさらに改善できます。
 */
/*:
[前ヘ](@previous)  |  7／21ページ  |  [次は「ifの問題点」です。](@next)
*/
 
