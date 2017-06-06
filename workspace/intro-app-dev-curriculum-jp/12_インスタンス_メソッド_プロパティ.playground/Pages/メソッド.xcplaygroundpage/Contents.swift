/*:
 ## メソッド
 
 関数は、型の一部として定義できます。これらの関数を「インスタンスメソッド」または単に「メソッド」と呼びます。`String`には、一般的な演算に使用される多くのインスタンスメソッドがあります。
*/
/*:
 ここに2つのStringインスタンスがあります。
*/
let introduction = "It was a dark and stormy night"
let alternateIntroduction = "Once upon a time"
/*:
 ある文字列が別の文字列で始まるかどうか知りたい場合があります。メソッド`hasPrefix()`を使うとわかります。
*/
/*:
 次のようにメソッドを宣言します。\
 `func hasPrefix(_ prefix: String) -> Bool`
*/
/*:
 メソッド`hasPrefix()`は、テストしたい接頭語である`String`パラメータを持ち、`Bool`を返します。
 */
/*:
 インスタンスメソッドを呼び出すには、インスタンスの後にピリオド（`.`）を使い、メソッド呼び出しを続けます。
*/
introduction.hasPrefix("It was")

introduction.hasPrefix("It wasn't")

alternateIntroduction.hasPrefix("It was")
alternateIntroduction.hasPrefix("It wasn't")

/*:
 この操作を「インスタンスでメソッドを呼び出す」と言います。`introduction`で`hasPrefix()`を呼び出したことになります。
 */
/*:
 結果サイドバーを見ると、メソッド`hasPrefix()`が引数の値とインスタンスの値に応じて異なる答えを返していることがわかります。このメソッドは、`String`の任意のインスタンスで呼び出すことができ、正しい答えが得られます。なぜかというと、すべての文字列インスタンスは答えの見つけ方を知っているからです。`String`のすべてのインスタンスには、この機能が使えるように組み込まれています。
 */
/*:
>(注意): `introduction`の値を渡す必要はありません。`introduction`にインスタンスが代入されることでこのメソッドが実行されるので、メソッドはすでに値を利用できます。これについては後述します。
 */
/*:
 次に、Swiftではどのようにしてインスタンスメソッドを安全に使うことができるのか見ていきます。
 */
/*:
[前ヘ](@previous)  |  4／17ページ  |  [次は「メソッドと型安全」です。](@next)
*/
