/*:
 ## 演習問題：ニワトリを数える
 
 このPlaygroundには`Chicken`型が組み込まれています。`Chicken`には`breed`（品種）と`temper`（性質）のプロパティがあり、どちらもenumです。
 */
/*: 
 ここに、ニワトリの配列があります。
*/
chickens
/*:
*/
//:  ニワトリは卵からかえったばかりなので、安全に数えることができます。
var chickenOfInterestCount = 0
for chicken in chickens {
    chickenOfInterestCount += 1
}
chickenOfInterestCount
/*:
 */
//: - callout(演習): `for…in`ループの中のコードをアップデートし、`.hilarious` `.leghorn`（陽気なレグホン種）のように関心のあるニワトリだけを数えてください。オートコンプリートのポップアップで、各enumが取りうる値を確認してください。
/*:
 */
//: [前ヘ](@previous)  |  18／21ページ  |  [次は「演習問題：Boolを置換する」です。](@next)
