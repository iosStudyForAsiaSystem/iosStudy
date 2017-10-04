/*:
 ## ダンススクール
 
 BoogieBotにダンスの準備をさせるには、次のコード行を使います。
*/
startBot()
/*:
 */
/*:
 BoogieBotは以下の動作をすることができます。
 */
/*:
 - `leftArmUp()`、`leftArmDown()`、`rightArmUp()`、`rightArmDown()`
 - `leftLegUp()`、`leftLegDown()`、`rightLegUp()`、`rightLegDown()`
 - `shakeItLeft()`、`shakeItRight()`、`shakeItCenter()`
 - `jumpUp()`、`jumpDown()`
 - `fabulize()`、`defabulize()`
 */
/*:

 `fabulize()`と`defabulize()`以外の動作は、わかると思います。「`fabulize()`」は、BoogieBotを驚くような色にします。「`defabulize()`」は、BoogieBotを元のロボットらしいグレイに戻します。
 */
/*:
 BoogieBotに対して、次のように動作を指示します。
 */
/*:
``` 
(例):
fabulize()
shakeItLeft()
shakeItRight()
shakeItCenter()
```
 */
/*:
 BoogieBotは、ルーチンの最後まで到達すると停止します。「Editor」>「Execute Playground」を使うと、もう一度動作を見ることができます。ルーチンを変更すると、もう一度最初から動き始めます。
*/
fabulize()
fabulize()
fabulize()
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

jumpUp()
jumpDown()

jumpUp()
jumpDown()

leftArmDown()
rightArmDown()
defabulize()

//: - experiment:(実験): 上のコード行を並べ替え、新しいダンスのルーチンを作ります。BoogieBotは、Playgroundに表示される順番に動作を実行します。\
//:ダンスルーチンの途中に「fabulize」や「defabulize」を入れるとどうなるでしょうか？
//:
//: \
//: これらのダンス関数は、どこから来ているのでしょうか？次のページで確認しましょう。\
//:\
//:[前ヘ](@previous)  |  3／13ページ  |  [次は「API」です。](@next)
