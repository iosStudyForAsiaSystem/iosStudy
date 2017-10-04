/*:
 ## Count
 
 次の配列は、あなたがしなければならない家事のリストです。
*/
let chores = ["Vacuuming", "Dusting", "Laundry", "Feed the dragons"]
//: それぞれの家事を完了するのに10分かかります。
let minutesPerChore = 10
//: すべての家事を終えるのにかかる時間を調べるには、どうすればよいでしょうか？リストにいくつの家事があるか知る必要があります。配列内のアイテム数を調べるには、`count`プロパティを使います。このプロパティは`Int`型です。
let numberOfChores = chores.count
let choresTime = numberOfChores * minutesPerChore
//: 次は、Swiftの型システムが配列をどのように扱うかを学習します。
/*:
*/
//: [前ヘ](@previous)  |  4／17ページ  |  [次は「型」です。](@next)
