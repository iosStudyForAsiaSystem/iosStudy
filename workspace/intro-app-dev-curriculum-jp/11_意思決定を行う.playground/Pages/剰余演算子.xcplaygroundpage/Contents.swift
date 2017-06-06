/*:
 ## 剰余演算子
 
 あなたはバンドメンバーを増やしてツアーに出発しましたが、問題が発生しました。
*/
/*:
メンバーの要求は、控室に毎晩ボウル一杯のキャンディが用意されていること。さらに、各メンバーにキャンディをぴったり分けられなければ、バンドをやめるというのです。 
*/
/*:
 「剰余演算子」を使うと、ある数が割り切れるかどうかわかります。剰余演算子`%`は、割り算の余りを出します。
*/
//: 4÷2は2で余りがないので、この行はゼロです。
4 % 2
//: 5÷2は2で余りが1なので、この行は1です。
5 % 2
//: バンドのメンバーがキャンディを平等に分けることができるか調べるには、余りがゼロになるかどうかチェックする必要があります。
let bandMemberCount = 6
let candyCount = 79
if candyCount % bandMemberCount == 0 {
    "Rock on."
} else {
    "Everyone quits! This is unacceptable!"
}
/*:
*/
//: コードを読んでも、何が起こっているのかよくわかりません。`%`と`== 0`は、コードの質問からそれています。関数の中にコードを入れるとわかりやすくなります。
func isCandyAmountAcceptable(bandMemberCount: Int, candyCount: Int) -> Bool {
    return candyCount % bandMemberCount == 0
}
/*:
*/
//: 前の例のように、このアプローチによって関数で行われている複雑な内容を隠せます。その後、以下のコードを記述します。
if isCandyAmountAcceptable(bandMemberCount: bandMemberCount, candyCount: candyCount) {
    "Rock on."
} else {
    "Everyone quits! This is unacceptable!"
}
/*:
 */
//: > (注意): 別のプログラム言語では`%`をモジュロ演算子と呼ぶ場合があります。モジュロ演算子は負の数に対する動作が異なります。
/*:
 */
//: では、学習したことをまとめましょう。
/*:
 */
//: [前ヘ](@previous)  |  9／13ページ  |  [次は「まとめ」です。](@next)
