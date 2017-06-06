/*:
 ## 判断する、ふたたび
 
 前のページで扱ったランチの選択肢について考えます。カフェテリアをモデル化する関数を記述するなら、次のようになります。
*/
func cookLunch(choice: String) -> String {
    if choice == "pasta" {
        return "🍝"
    } else if choice == "burger" {
        return "🍔"
    } else {
        return "🍲"
    }
}
cookLunch(choice: "pasta")
/*:
*/
//: - experiment:(実験): `cookLunch(choice:)`を何度か呼び出して、様々な料理を頼みます。思いつくものを何でも頼んでください。どのような結果になりますか？




/*:
 この関数には次の欠点があります。
 
 - `"pasta"`または`"burger"`と正確に頼んだ場合を除き、スープになります。
 - 何を頼むことができるかわかりません。関数の本文を見なければ、`String`を取ることしかわからず、予期されている文字列はわかりません。

*/ 
/*:
 このような状況には、もっと適した方法があります。
 */
/*:
[前ヘ](@previous)  |  2／21ページ  |  [次は「列挙型」です。](@next)
*/
