/*:
 ## 計算プロパティ
 
 `Song`には曲の長さを秒単位で表す`duration`プロパティがあります。でも、曲の長さを「何分何秒」という文字列の形で表してもらうと役に立つかもしれません。
 */
/*:
 `minutes`と`seconds`の2つのプロパティを使えばできそうですが、全体の長さを調べるには計算を実行する必要が生じます。別の方法として`minutes`、`seconds`、`duration`の3つのプロパティを使うこともできますが、「何分何秒」単位で表した値（minutesとseconds）とそれを秒単位のみで表した値（duration）が一致しない構造体を作成してしまう可能性が生じます。
 */
/*:
 ここでは、長さの値（duration）からフォーマットされた文字列（何分何秒）を計算するアプローチの方が適しています。
 */
/*:
 必要に応じて計算可能なプロパティについては、次のように構造体に「計算プロパティ」を追加できます。
*/
struct Song {
    let title: String
    let artist: String
    let duration: Int
    
    var formattedDuration: String {
        let minutes = duration / 60
        // モジュロ演算子（%）は余りを求めます
        let seconds = duration % 60
        return "\(minutes)m \(seconds)s"
    }
}
let song = Song(title: "No, no, no", artist: "Fizz", duration: 150)
song.formattedDuration
/*:
 */
/*:
みなさんはすでに、`Array`の`count`で計算プロパティに出会っています。
 */
/*:
 計算プロパティは構造体の残りの部分に応じて変わる可能性があるので`var`として宣言されます。宣言の残りの部分は、名前、型アノテーション、中括弧に入ったコードで構成され、適切な型の値を返します。計算プロパティへは、ほかのプロパティと同じようにアクセスできます。
 */
/*:
 `formattedDuration`の定義の中では、ドット構文（ピリオド）を使わずにプロパティ`duration`にアクセスしています。構造体のコードの中では、名前を使って自身のプロパティに直接アクセスできます。ドットを使う必要はありません。
*/
/*:
 - callout(演習): `Song`に、`formattedTitle`という名前の計算プロパティを追加します。このプロパティは`String`を提供します。上の曲の場合、フォーマットされた曲名は「No, no, no by Fizz」です。
 */
/*:
 次は、定義した型を関数で使用する方法を見ていきます。
 */
/*:
[前ヘ](@previous)  |  5／9ページ  |  [次は「関数」です。](@next)
*/
