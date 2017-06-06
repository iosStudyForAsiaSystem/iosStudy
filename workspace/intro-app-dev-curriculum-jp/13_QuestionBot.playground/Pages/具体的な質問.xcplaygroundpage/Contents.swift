/*: 
 ## 具体的な質問
 Who、What、Whereの質問に対する一般的な答えだけでなく、具体的な質問に具体的に答えることもできます。
*/
/*:
*/
func responseTo(question: String) -> String {
    
    let lowerQuestion = question.lowercased()
    
    if lowerQuestion.hasPrefix("where") {
        return "To the North!"
    } else if lowerQuestion == "where are the cookies?" {
        return "In the cookie jar!"
    } else {
        return "That really depends"
    }
}
responseTo(question: "Where are the cookies?")
/*:
 */
/*:
 - callout(演習): 上の関数は機能しません。最初の`if`文は、質問が"where"で始まるかどうかを判断します。whereで始まっていますね。そのため、以降の文についての判断は行われません。上の関数を変更し、"Where are the cookies?"という質問に"In the cookie jar!"と答えるようにしてください。
*/
/*:
*/
//:[前ヘ](@previous)  |  4／7ページ  |  [次は「デフォルトの答え」です。](@next)
