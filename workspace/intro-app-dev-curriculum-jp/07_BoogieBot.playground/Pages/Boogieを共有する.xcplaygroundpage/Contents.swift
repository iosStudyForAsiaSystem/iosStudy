/*:
 ## Boogieを共有する
 
 BoogieBotの機能はあと1つだけあります。
 */
/*:
 アシスタントエディタでBoogieBotの動作を見られるだけでなく、作品をアニメーションGIFに保存して友達と簡単に共有できます。
*/
/*:
 そのためには、ロボットの開始直後に`startRecording()`を追加します。
*/
startBot()
startRecording()
/*: 
 それから、以下のルーチンを追加します。BoogieBotがダンスを終えると、「Save」ボタンが表示されます。このボタンをクリックすると、ダンスルーチンがアニメーションGIFとして保存されます。
 */
/*:
 BoogieBotは、ルーチンの最後まで到達すると停止することを覚えておいてください。「Editor」>「Execute Playground」を使うと、もう一度動作を見ることができます。さあ、楽しみましょう！
*/
// 送信する時は、署名してください。
setBotTitle("The next dance craze")
setBotSubtitle("You saw it here first!")
// ダンス開始です！
fabulize()
leftArmUp()
rightArmUp()

leftLegUp()
rightLegUp()
leftLegDown()
rightLegDown()
shakeItLeft()
shakeItRight()
shakeItCenter()
jumpUp()
jumpDown()

leftArmDown()
rightArmDown()
defabulize()
/*:
 */
//: 次は、これまで行ってきたことを表す新しい用語を学びます。 \
//:\
//:[前ヘ](@previous)  |  7／13ページ  |  [次は「アルゴリズム」です。](@next)
