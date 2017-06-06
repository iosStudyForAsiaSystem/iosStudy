/*:
 ## switch
 
 if文はenumの値をチェックするにはあまり適していないようでした。
 */
/*:
 コードの外観が煩雑になるだけでなく、enumでcaseのリストを提供しても、すべてのcaseをカバーしたかどうかわからない場合があります。
 */
/*:
 enumの値に基づいて異なるアクションを選べる、もっとよい方法はないでしょうか？
*/
enum LunchChoice {
    case pasta
    case burger
    case soup
}

let choice = LunchChoice.burger
/*:
 */
/*:
 _そこで登場するのが「switch」文です。_
*/
switch choice {
    case .pasta:
        "🍝"
    case .burger:
        "🍔"
    case .soup:
        "🍲"
}
/*:
 */
/*:
switch文は、上のenumの宣言ととてもよく似ています。それは、enumとうまく連係するように作られているからです。
 */
/*:
 switch文は、キーワード`switch`で始まり、チェックする値と左中括弧が続きます。
 */
/*:
 `switch choice {`
 */
/*:
 次に、チェックする一連のcaseを追加します。それぞれの`case`のキーワードには値とコロンを続けます。
 */
/*:
 `case .pasta:`
 */
/*:
 enumの型はわかっているので、ドット構文を使って型名を省略できます。
 */
/*:
 チェックされる値がcase文と一致する場合、一致したcaseと次のcaseの間にあるコードが実行されます。その後、switch文はif文と同じように終了します。
 */
/*:
 次に、switch文のその他の機能を見てみましょう。
 */
/*:
[前ヘ](@previous)  |  9／21ページ  |  [次は「可能性を網羅する」です。](@next)
*/
