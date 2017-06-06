/*:
 ## 列挙型以外にも
 
 ここまで、enumとそれを扱うswitch文の使い方を学習してきました。switch文はほかの値にも使うことができます。
 */
/*:
 例えば、switch文は文字列や数字でも機能します。文字列や数字の取りうる値をすべて網羅することはできないので、これらの型を使うswitch文にはデフォルトケース（default case）が必要です。
*/
let animal = "cat"

func soundFor(animal: String) -> String {
    switch animal {
        case "cat":
            return "Meow!"
        case "dog":
            return "Woof!"
        case "cow":
            return "Moo!"
        case "chicken":
            return "Cluck!"
        default:
            return "I don't know that animal!"
    }
}
soundFor(animal: animal)

/*:
 */
/*:
- callout(演習): `soundFor(animal:)`関数を何度か呼び出してください。わかっている動物、わからない動物を入れてみてください。\
\
switch文にanimalのcaseをいくつか追加し、関数を呼び出して新しいcaseをテストしてください。
*/





/*:
次に、もう一度カフェテリアに行ってswitch文を使ってみましょう。
 */
/*:
[前ヘ](@previous)  |  13／21ページ  |  [次は「カフェテリアに戻って」です。](@next)
*/
