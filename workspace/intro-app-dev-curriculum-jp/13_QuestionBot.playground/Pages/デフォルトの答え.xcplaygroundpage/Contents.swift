/*:
 ## デフォルトの答え
 ここまでに記述した関数では、`if`文のいずれの条件にも一致しない場合にデフォルトの答えが返されます。この演習では、質問文の長さに応じて異なるデフォルトの答えを返すようにしてみましょう。
 */
/*:
 文字列の長さは、次のように取得できます。
*/
"hello".characters.count
/*:
 */
//: 2種類のデフォルトの回答のうちどちらか一方を選ぶには、剰余演算子を使って2で割った余りを取得します。
/*:
 */
"a".characters.count % 2
"ab".characters.count % 2
"abc".characters.count % 2
"abcd".characters.count % 2
/*:
 */
//: こうすると、あらゆる文字列を`0`か`1`に変換できるので、その結果を使って回答を決めることができます。
/*:
 */
func responseTo(question: String) -> String {
    
    let lowerQuestion = question.lowercased()
    
    if lowerQuestion == "where are the cookies?" {
        return "In the cookie jar!"
    } else if lowerQuestion.hasPrefix("where") {
        return "To the North!"
    } else {
        
        let defaultNumber = question.characters.count % 2
        
        if defaultNumber == 0 {
            return "That really depends"
        } else {
            return "Ask me again tomorrow"
        }
        
    }
}
responseTo(question: "Where are the cookies?")
responseTo(question: "Can I have a cookie?")
responseTo(question: "PLEASE can I have a cookie?")
/*:
 */
/*:
 - callout(演習): 上の関数を修正し、2種類ではなく3種類のデフォルト回答からいずれか1つを選ぶようにしてください。
 */
/*:
ヒント：`question.characters.count % 3`を使うと、`0`、`1`、または`2`の結果が得られます。
*/
//:[前ヘ](@previous)  |  5／7ページ  |  [次は「すべてを組み合わせる」です。](@next)
