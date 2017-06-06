/*:
 ## 関数と判断
 
 条件文を使うと、より有用な関数を記述できます。判断を伴うコードがいくつか含まれていて読みにくい場合や複雑に見える場合は、関数にまとめれば質問のように見えます。
*/
/*:
 例えば、5人のバンドで演奏する場合を考えます。機材の重さは600ポンドです。メンバーはそれぞれ一度に50ポンド運べますが、3回以上移動しなければならなくなる人が出ると、その人はそこでやめてしまいます。計算が必要ですね。
*/
let bandMemberCount = 5
let gearWeight = 600
let weightPerPerson = 50
let maximumTripCount = 2

if gearWeight < bandMemberCount * weightPerPerson * maximumTripCount {
    "Rock on."
} else {
    "Everyone quits! Looks like you've got a solo show."
}
/*:
*/
//: このコードで正しい答えが出ますが、何が起こっているのかよくわかりません。ほかの人は、コードを何度も読まないと、なぜ全員がやめてしまうのか理解できないかもしれません。コードの論理が関数の中に入っていれば、関数名から計算ロジックが何を表しているか知ることができます。
func bandCanCarryGear(bandMemberCount: Int, gearWeight: Int) -> Bool {
    let maximumTripCount = 2
    let weightPerPerson = 50
    let carryingCapacity = bandMemberCount * weightPerPerson * maximumTripCount
    
    return gearWeight < carryingCapacity
}
/*:
*/
//: このアプローチにより、関数の中で起こっている複雑な部分を隠すことができます。次のように、if文の中で、`bool`値を返す関数を直接使うことができます。
if bandCanCarryGear(bandMemberCount: 5, gearWeight: 600) {
    "Rock on."
} else {
    "Everyone quits! Looks like you've got a solo show"
}
/*:
*/
//: こうすると、コードを読んだ人はだれでも何が起こっているかわかるはずです。（もう一人ドラマーを呼ぶか、スピーカーを置いていく必要があるようです）
/*:
*/
//: 次のページでもバンドの旅を続けましょう。
/*:
 */
//: [前ヘ](@previous)  |  8／13ページ  |  [次は「剰余演算子」です。](@next)
