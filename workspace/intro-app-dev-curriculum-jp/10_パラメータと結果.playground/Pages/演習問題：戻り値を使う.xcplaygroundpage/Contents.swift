/*:
 ## 演習問題：戻り値を使う
 
 関数はプログラムの構成要素であることは学習しましたが、これまでは使う関数はたいてい1つでした。この演習では、1つの関数の結果を使ってほかの関数の処理に影響を与えます。
 */
/*:
 関数`impossibleBeliefsCount`は、ありそうもない出来事の報告件数を取ります。次に、ありそうもない出来事の件数を出力します。
*/
func impossibleBeliefsCount(pigsFlying: Int, frogsBecomingPrinces: Int, multipleLightningStrikes: Int) {
    let total = pigsFlying + frogsBecomingPrinces + multipleLightningStrikes
    print(total)
}
/*:
*/
//: - callout(演習): `impossibleBeliefsCount`関数をアップデートし、値を出力する代わりに`Int`として返すようにしてください。
/*:
*/
//: `impossibleThingsPhrase`（ありそうもない出来事のフレーズ）は、文字列補間を使ってフレーズを作ります。
func impossibleThingsPhrase() -> String {
    let numberOfImpossibleThings = 10
    let meal = "teatime"
    return "Why, I've believed as many as \(numberOfImpossibleThings) before \(meal)"
}
/*:
 */
//: - callout(演習): `impossibleThingsPhrase`関数をアップデートし、関数内に2つの定数を使う代わりに2つの引数、`numberOfImpossibleThings`（`Int`型）および`meal`（`String`型）を取るようにします。
/*:
 */
//: これで、パラメータを取る関数と値を返す関数の2つができます。
/*:
 */
//: - callout(演習): `impossibleBeliefsCount`を呼び出し、結果を定数に保存します。\
//:`impossibleThingsPhrase`を呼び出し、`impossibleBeliefsCount`の結果を引数の1つとして渡します。






//: [前ヘ](@previous)  |  15／17ページ  |  [次は「演習問題：引数のラベル」です。](@next)
