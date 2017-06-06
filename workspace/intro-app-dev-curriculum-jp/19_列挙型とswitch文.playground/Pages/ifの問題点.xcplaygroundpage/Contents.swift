/*:
 ## ifの問題点
 
 チェックすべき条件が1つならif文は便利なのですが、`else if`を使って複数の条件をチェックする場合は手に負えなくなる可能性があります。 
 */
/*:
 新しい情報のないテキストがいくつも繰り返され、コードの見た目が「煩雑に」なります。
 */
/*:
 下のアニメーションは、enumを伴うif文の例です。たくさんのテキストが繰り返され、enumのcaseがコードの中に埋もれてしまっています。
 */
/*:
 ![If statement removing the visual noise. Original code:\n```
 if choice == .pasta {
     return "🍝"
 } else if choice == .burger {
     return "🍔"
 } else {
     return "🍲"
 }```
 New code: ```
 .pasta
     return "🍝"
 .burger
     return "🍔"
 else
     return "🍲"
 }```](IfNoise.gif)
 */
/*:
 このアニメーションではif文に別の問題があることもわかります。最後の選択肢は「else」（その他）ではなくsoup（スープ）のはずです。 _enum_ の最後のcaseを知らずにこのコードを読む人は、推測しなければなりません。
 */
/*: 
 具体的な各caseを使って関数を書き直しても、あまり状況は改善しません。
*/
enum LunchChoice {
    case pasta, burger, soup
}

func cookLunch(_ choice: LunchChoice) -> String {
    if choice == .pasta {
        return "🍝"
    } else if choice == .burger {
        return "🍔"
    } else if choice == .soup {
        return "🍲"
    }
    return "Erm... how did we get here?"
}
cookLunch(.soup)
/*: 
 */
/*:
 どうしても最後の`return`文が必要です。そうしないと、関数はif文の中の可能性のあるすべてのcaseをカバーしたと確信できないため、エラーになります。
 */
/*: 
 - experiment:(実験): 最後の`return`文をコメント化し、エラーが表示されることを確認します。もう一度コメント解除し、`cookLunch`に渡される値を変更して、最後の`else`文が呼び出されるようにしてください。\
_（ヒント：if文のいずれにも一致しないenum値を得るにはどうすればよいでしょうか？）_
 */
/*: 
 どうやら、if文はenumを扱うには適していないようです。では、何が適しているのでしょう？
 */
/*:
[前ヘ](@previous)  |  8／21ページ  |  [次は「switch」です。](@next)
*/
