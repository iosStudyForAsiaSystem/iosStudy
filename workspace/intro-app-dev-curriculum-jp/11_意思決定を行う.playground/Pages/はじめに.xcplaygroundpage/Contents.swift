/*:
 ## 判断する
 
 ここまでに皆さんが記述したコードは、すべてPlaygroundで実行されました。1行目から最後の行まで順番に実行されました。コードにどのような値を渡しても、コードは同じように処理します。
 */
/*: 
 以前、文字列補間について学習しました。計算を実行し、次のような文字列に結果を表示しました。
*/


let videoLength = 3
let videoLengthTooShortReaction = "If I blinked, I'd miss it!"
let videoReasonableLengthReaction = "That was lovely."
let videoMessage = "Your video is \(videoLength) seconds long. \(videoLengthTooShortReaction)"
 
/*:
 `videoLength`が3なら、これは問題なく機能します。
 */
/*:  
 `Your video is 3 seconds long. If I blinked, I'd miss it!`（ビデオの長さは3秒。瞬きをしているうちに終わってしまうよ！）
 */
/*: 
 ビデオの長さを2857013857のような大きな値にするとどうでしょうか。`videoMessage`が状況に合わなくなります。
 */
/*:  
 `Your video is 2857013857 seconds long. If I blinked, I'd miss it!`（ビデオの長さは2857013857秒。瞬きをしているうちに終わってしまうよ！）

 */
/*:  
 コードに、値によって異なる処理をしてもらいたいですよね。コードに判断をしてもらう必要があります。
 */
/*:  
 Swiftで判断をする場合に使う型について学習しましょう。
 */
/*:  
1／13ページ  |  [次は「真か偽か」です。](@next)
*/
