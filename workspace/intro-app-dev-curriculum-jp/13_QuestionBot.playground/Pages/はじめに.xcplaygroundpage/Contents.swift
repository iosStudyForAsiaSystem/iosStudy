/*:
 ## 質問に答える
 
 このPlaygroundでは、関数を処理してQuestionBotに質問に答えさせます。
*/
/*:
 Playgroundでアプリケーションの頭脳の部分を構築してからアプリケーションに追加します。こうすることで、今取り組んでいる部分に集中できます。
*/
/*: 
 QuestionBotの「頭脳」は関数`responseTo(question:)`です。この関数のいくつかのバージョンを試してみましょう。
 */
/*: 
 以下に例を挙げます。
 */
func responseTo(question: String) -> String {
    return "Sorry, what was that?"
}

/*:
//: それでは質問してみましょう。サイドバーの答えを確認してください。👉
*/

responseTo(question: "How are you?")
responseTo(question: "I said, how are you?")
responseTo(question: "Oh, never mind.")
/*: 
 */
/*:
 あまり楽しい会話ではありませんね。何を質問しても、この関数は同じ答えを返します。次は、もっと面白い例を紹介します。
*/

//:1／7ページ  |  [次は「最初の単語」です。](@next)
