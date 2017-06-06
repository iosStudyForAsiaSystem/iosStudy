/*:
 ## 可能性を網羅する
 
 switch文には、「網羅的でなければならない」という性質があります。つまり、switch文は、チェック対象の値のあらゆる可能性を網羅する必要があります。enumでは、異なるcaseを使うことで、可能性のあるすべての値を扱うことができます。
*/
enum LunchChoice {
    case pasta
    case burger
    case soup
}

let choice = LunchChoice.burger

switch choice {
case .pasta:
    "🍝"
case .burger:
    "🍔"
case .soup:
    "🍲"
}
/*: 
 */
/*:
 - callout(演習): enumにもう1つのcase、`taco`（タコス）を追加してください。switch文はどうなりますか？
 */
/*:
 「`Switch must be exhaustive, consider adding a default clause`」（switch文は網羅的でなければなりません。default節の追加を検討してください）というエラーが表示されます。すべてのcaseをカバーしていないswitch文は、記述できないようになっています。
 */
/*:
 - callout(演習): switch文にもう1つcaseを追加して、エラーを修正してください。ほかのcaseを参考にしてください。Control + Command + スペースキーを同時に押して絵文字ピッカーを開くか、次の絵文字をコピーしてください。🌮
 */
/*:
 「switch文は網羅的でなければならない」ということは、テストしている値にいずれかのcaseが一致すると確信できるということです。この性質があるため、誤って値を見落とすことはありません。また、enumの定義をアップデートした時、それを使うswitch文をアップデートしないと警告が表示されます。
 */
/*:
 次に、エラーメッセージの中にあった「default clause」（default節）について学習します。
 */
/*:
[前ヘ](@previous)  |  10／21ページ  |  [次は「default case」（デフォルトケース）です。](@next)
*/
