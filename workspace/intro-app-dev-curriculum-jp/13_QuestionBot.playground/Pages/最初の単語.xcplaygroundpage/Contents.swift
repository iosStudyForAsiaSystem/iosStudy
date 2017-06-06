/*:
 ## 最初の単語
 この演習では、質問の最初の単語に応じて異なる答えを返す関数を作ります。`hasPrefix()`メソッドで、文字列がある別の文字列で始まるかどうかを判定します。
*/
"swift programming".hasPrefix("swift")
"swift programming".hasPrefix("programming")
/*:
*/
//: - callout(演習): 関数を修正し、様々な最初の単語に対する答えを確認してください。Who、What、Why、Howの質問に対する答えを追加するには、どうすればよいでしょうか？
func responseTo(question: String) -> String {
    
    if question.hasPrefix("hello") {
        return "Why, hello there"
    } else if question.hasPrefix("where") {
        return "To the North!"
    } else {
        return "That really depends"
    }
}

responseTo(question: "hello there!")
responseTo(question: "where should I go on holiday?")
responseTo(question: "what is the capital of France?")
/*:
 */
//: お気づきかもしれませんが、`where`だと機能するのに`Where`や`WHERE`では機能しません。これについては次のページで説明します。
/*:
 */
//:[前ヘ](@previous)  |  2／7ページ  |  [次は「大文字／小文字の扱い」です。](@next)
