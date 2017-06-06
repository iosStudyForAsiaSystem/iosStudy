/*:
 ## もっと値を渡す
 
 関数に複数の値を持たせたい時はどうすればよいでしょうか？問題ありません。パラメータをカンマで区切って括弧の中に並べるだけです。
*/
func hello(firstName: String, lastName: String) {
    print("Hello \(firstName) \(lastName)")
}
/*:
 このようなパラメータリストをスムーズに読むには少し練習が必要かもしれません。各パラメータは名前と型のペアであり、それぞれカンマで区切られています。このパラメータリストを次のように表すこともできます。
 */
/*: 
 `firstName: String,`

 
 `lastName: String`
 */
/*:
 関数の中の`firstName`と`lastName`はどちらも定数文字列として使用できます。この関数を呼び出すには、次のようにします。
*/
hello(firstName: "Johnny", lastName: "Appleseed")
hello(firstName: "John", lastName: "Snow")
/*:
*/
//: - experiment:(実験): 著名人の名前を使って、何度か関数を呼び出します。オートコンプリート機能によって2つのパラメータがどのように表示されるか、Tabキーを使って次の引数にどのように移動できるかを確認してください。




//: 次のページでは、このような関数をもう少し練習します。
/*:
*/
//: [前ヘ](@previous)  |  4／17ページ  |  [次は「その他のお気に入り」です。](@next)
