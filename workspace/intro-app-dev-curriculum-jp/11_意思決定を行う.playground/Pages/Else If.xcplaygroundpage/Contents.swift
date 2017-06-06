/*:
 ## Else If
 
 ビデオが長すぎる時に別のメッセージを表示するには、どうすればよいでしょうか？
 */
/*:
 `if`と`else`でできることが、あと1つあります。次のようになります。
*/
let videoLength = 120

if videoLength < 5 {
    "If I blinked, I'd miss it."
} else if videoLength > 500 {
    "Don't worry, I know a good editor."
} else {
    "That was lovely."
}
/*:
 `else if`を使うと、もう1つ条件式を追加できます。この条件式は、最初の条件式で`false`だった場合にのみチェックされます。`else if`の条件式も`false`の場合は、最後の`else`の後ろのコードが実行されます。
*/
/*:
 - experiment:(実験): `videoLength`の値を変更し、条件式を通るコードの流れを追ってください。
 */
/*:
複数の`else if`文を追加できますが、最初に`true`と判断されたものが「勝者」となります。
*/
let anotherVideoLength = 75000
if anotherVideoLength < 5 {
    "If I blinked, I'd miss it."
} else if anotherVideoLength > 50000 {
    "This is too long for anyone."
} else if anotherVideoLength > 500 {
    "Don't worry, I know a good editor."
} else {
    "That was lovely."
}
//: 最後の`else if`文は、`true`であっても実行されません。条件が一度`true`になると、その後の条件式はチェックされません。コードの順番が非常に重要なのです。
/*:
*/
//: 次のページでは、関数を使って複雑な判断をシンプルにする方法を説明します。 
/*:
 */
//: [前ヘ](@previous)  |  7／13ページ  |  [次は「関数と判断」です。](@next)
