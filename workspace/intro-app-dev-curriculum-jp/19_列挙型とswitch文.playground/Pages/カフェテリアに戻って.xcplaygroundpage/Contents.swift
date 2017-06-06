/*:
 ## カフェテリアに戻って
 
 switch文は、enumを引数に取る関数を記述する場合に非常に便利です。switch文は網羅的でなければならないので、入力される可能性のあるものすべてを確実に扱うことができます。以下の`cookLunch`関数は、switch文を使って以前の関数を書き直したものです。
*/
enum LunchChoice {
    case pasta, burger, soup
}

func cookLunch(_ choice: LunchChoice) -> String {
    switch choice {
    case .pasta:
        return "🍝"
    case .burger:
        return "🍔"
    case .soup:
        return "🍲"
    }
}

cookLunch(.burger)
/*: 
 */
/*:
 以前に文字列とif文を使って作成したものよりも、この関数の方がずっとよくなっています。
 */
/*:
 enumを使うことで入力可能な値が明らかになるので、プログラマがコードを読んだり、理解したり、関数を使ったりしやすくなります。
 */
/*:
 関数の中でプログラムの流れがはっきりしているので、予期しない入力を処理する「万が一のための」コードは必要ありません。
 */
/*:
 enumの定義が変更された場合は、それに応じてswitch文をアップデートするまでプログラムを実行できません。
 */
/*:
 
 
では、enumに機能を追加する方法を見てみましょう。 
 */
/*:
[前ヘ](@previous)  |  14／21ページ  |  [次は「列挙型のメソッドとプロパティ」です。](@next)
*/
