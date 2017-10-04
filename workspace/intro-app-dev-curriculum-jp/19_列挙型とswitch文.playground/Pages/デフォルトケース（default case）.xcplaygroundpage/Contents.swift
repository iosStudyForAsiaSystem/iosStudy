/*:
 ## デフォルトケース（default case）

 次のenumは、何かの品質を表すために使われます。
*/
enum Quality {
    case bad, poor, acceptable, good, great
}

let quality = Quality.good

/*:
 */
//: 次のswitch文は、これまでに見てきたものと少し違います。
switch quality {
case .bad:
    print("That really won't do")
case .poor:
    print("That's not good enough")
default:
    print("OK, I'll take it")
}
/*:
*/
/*:
このswitch文には、enumのすべての値に対してcaseがあるわけではありません。代わりに`default`キーワードがあり、ほかのいずれにも一致しなかった場合に使用されます。これは、if文を使う時の最後の`else`節に似ています。
 */
/*: 

 - experiment:(実験): `quality`の値を変更し、default caseが使われる場合と特定のcaseが使われる場合をテストしてください。\
\
switch文にcaseを追加してみてください。`default`のcaseは、switch文の中で最後のcaseにする必要があります。\
\
enumにcaseを追加してみてください。
 */
/*:
 switch文にdefault caseを追加すると、enumに新しいcaseを追加してもエラーになりません。これによって予期しないエラーが発生する場合を思いつきますか？
 */
/*:
 次のページでは、複数のcaseを一致させる別の方法を見ていきます。 
 */
/*:
[前ヘ](@previous)  |  11／21ページ  |  [次は「複数のcase」です。](@next)
*/
