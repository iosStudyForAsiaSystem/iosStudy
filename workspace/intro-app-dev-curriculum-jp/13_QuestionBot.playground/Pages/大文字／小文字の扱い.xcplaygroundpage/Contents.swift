/*:
 ## 大文字／小文字の扱い
 前のページで、可能性のあるもののリストに対して文字列の最初が一致するかどうか調べる関数を記述しましたが、文字列の大文字／小文字が同じ場合にしか機能しません。サイドバーの結果を確認してください。
*/
"where" == "where"
"Where" == "where"
"WHERE" == "where"
/*:
*/
/*:
 大文字／小文字のあらゆる組み合わせをリストすればよいかもしれませんが、大変です。
 */
/*:
```
 (例):
 if question.hasPrefix("where")...
 if question.hasPrefix("Where")...
 if question.hasPrefix("WHere")...
 if question.hasPrefix("WHEre")...
 ```
*/
/*:
 その代わりに、一致するかどうか調べる前に`lowercased`メソッドを使ってテキストの大文字／小文字を変更しましょう。
*/
let question = "WHERE ARE THE COOKIES?"
let lowerQuestion = question.lowercased()
lowerQuestion.hasPrefix("where")
/*:
*/
//: - callout(演習): 以下の関数を書き直し、質問文が大文字／小文字のどのような組み合わせであっても正しい答えが得られるようにしてください。
func responseTo(question: String) -> String {
    
    if question.hasPrefix("hello") {
        return "Why, hello there"
    } else {
        return "That really depends"
    }
}

responseTo(question: "Hello!")
/*:
 */
//:[前ヘ](@previous)  |  3／7ページ  |  [次は「具体的な質問」です。](@next)
