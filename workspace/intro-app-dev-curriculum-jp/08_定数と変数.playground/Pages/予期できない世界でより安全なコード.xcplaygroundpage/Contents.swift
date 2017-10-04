/*:
 ## 予期できない世界でより安全なコード

 値を変更する場合は、必ず意図的に行ってください。プログラムを記述する場合、それぞれのコードが何を行うためのものか明確にする必要があります。すべてを変数にすると、あなたやほかの人が誤って、または意図的に値を変更してしまう可能性があります。いずれにせよ、下の方の行で何か問題が発生する場合があります。
 */
/*: 
 ゲームのスコアを記録して計算するプログラムを考えてみます。
*/
// 各ターゲットのスコア
var scoreForGreen = 5
var scoreForRed = 10
var scoreForGold = 20

// プレイヤーのスコア
var scoreForGary = 0
var scoreForRob = 0

// ゲームイベント
scoreForGary += scoreForRed
scoreForGary += scoreForGreen
scoreForGary += scoreForGold

scoreForRob += scoreForRed
scoreForRed += scoreForGreen
scoreForRob += scoreForGold

scoreForGary += scoreForRed
scoreForGary += scoreForGreen
scoreForGary += scoreForGold

scoreForRob += scoreForRed
scoreForRob += scoreForGreen
scoreForRob += scoreForGold

scoreForRob
scoreForGary
/*: 
 */
/*:
 - callout(演習): 上のプログラムには問題があります。どのプレイヤーも同じターゲットに当てたのに、ゲーム終了時のポイントは、Robの方がGaryより少なくなっています。なぜだかわかりますか？\
ヒント：プログラムの最初で、ターゲットのスコアを`var`でなく`let`を使って定義してみてください。
*/




//: [前ヘ](@previous)  |  10／13ページ  |  [次は「まとめ」です。](@next)
