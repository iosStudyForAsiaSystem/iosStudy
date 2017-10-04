/*:
 ## すべてを組み合わせる
 - callout(演習): この最後の演習では、ここまで数ページで学習した内容を組み合わせます。この`responseToQuestion`関数をアップデートし、下の回答を返すようにしてください。前のページに戻ってコードを確認してもかまいません。
*/
func responseTo(question: String) -> String {
    return "?"
}
//: 👇これらの質問の答えが“Why, hello there!”になるようにします。
responseTo(question: "Hello there")
responseTo(question: "hello there")
//: 👇これらの質問の答えが“To the North!”になるようにします。
responseTo(question: "Where should I go on holiday?")
responseTo(question: "where can I find the North Pole?")
//: 👇この質問の答えが“In the cookie jar!”になるようにします。
responseTo(question: "Where are the cookies?")
/*: 
 その他の質問に対する答えは自由に考えてください。新しいルールや条件を作り、別の質問に対して別の答えを返すようにしてもいいですね。
 */
/*:
 👇 以下は最後にテストする質問の例です。テストの質問を追加したり変更したりしてもかまいません。
*/
responseTo(question: "Can I have a cookie?")
responseTo(question: "CAN I HAVE A COOKIE?!?")
responseTo(question: "Should I go?")

/*:
 - note:(注意):
 上の`responseToQuestion`関数の本文を切り取ってペーストします。関数本文は異なっていますが、コピーするためにハイライトすると、次のようになります。\
 ![](copy-paste-example.png)
*/
/*:
*/
//:[前ヘ](@previous)  |  6／7ページ  |  [次は「まとめ」です。](@next)
