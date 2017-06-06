/*:
 ## 複数のcase
 
 前のページでは、default case（デフォルトケース）を使って、次のenumの中の3つの値を照合しました。
*/
enum Quality {
    case bad, poor, acceptable, good, great
}

let quality = Quality.good
/*:
 */
/*: 
 ただし、enumに新しいcaseを追加すると、後で問題が生じる場合があります。switch文は新しい値にdefault caseを使いますが、それは意図しないことかもしれません。 
 */
/*:
 代わりに、同じcase内で複数の値を照合できます。
*/
switch quality {
case .bad:
    print("That really won't do")
case .poor:
    print("That's not good enough")
case .acceptable, .good, .great:
    print("OK, I'll take it")
}
/*:
 */
/*: 
 - callout(演習): enumに新しいcase、「`terrible`」（ひどい）を追加します。 
 */
/*:
 default caseを使っていたら、不適切な回答になったでしょう。各caseを指定すると、新しいcaseを追加するたびに、caseを適切に扱えるようにswitch文をアップデートする必要が生じます。
 */
/*:
次に、switch文の別の使い方を学習します。
 */
/*:
[前ヘ](@previous)  |  12／21ページ  |  [次は「列挙型以外にも」です。](@next)
*/
