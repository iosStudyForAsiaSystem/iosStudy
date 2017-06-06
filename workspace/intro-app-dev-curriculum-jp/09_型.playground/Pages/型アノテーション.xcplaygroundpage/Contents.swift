/*:
 ## 型アノテーション
  
 Swiftは、何かの型を判断できない場合、ユーザーにそのことを知らせます。
 */
/*:
 - experiment:(実験): 下のコード行をコメント解除し、エラーを確認します。確認したらもう一度コメント化します。
*/
// let mysteryConstant
/*: 
 「`Type annotation missing in pattern`」（型アノテーションがありません）というエラーは、Swiftが使用可能な情報から定数の型を推測できないという意味です。
 */
/*: 
 先ほど試した`Double`型と`Int`型の計算のように、ユーザーが意図したとおりの型にならない場合があるので、Swiftに型推論を使ってほしくない場合もあります。
 */
/*: 
 このような場合は、「型アノテーション」という追加情報を加えることで、Swiftにどの型を使ってほしいか具体的に伝えることができます。型アノテーションは名前の宣言の直後に入力し、コロンと型名を使います。
*/
let annotatedDouble: Double = 20
let inferredDouble = 0.5
let result = inferredDouble * annotatedDouble
result * 0.5
/*: 
 - `annotatedDouble`は、型アノテーションがあるので、小数点を含まなくても`Double`型です。
     
     
 - `inferredDouble`は小数点を使って記述されているので`Double`型です。
     
     
 - `Double * Double`は`Double`なので、`result`は`Double`型です。
 */
/*: 
 次は、これまで学習した型がどこからきたかを学習します。
 */
/*: 
[前ヘ](@previous)  |  8／13ページ  |  [次は「型はどこから？」です。 ](@next)
*/
