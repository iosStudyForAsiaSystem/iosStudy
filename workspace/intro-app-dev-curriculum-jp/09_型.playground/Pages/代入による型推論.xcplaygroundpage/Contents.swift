/*:
 ## 代入による型推論
 
 新しい定数や変数を作成する方法は、リテラルだけではありません。  
*/
/*:
 代入文には左辺（代入の対象）と右辺（代入される値）があります。
*/
/*:
 ```
 (例):  let leftHandSide = rightHandSide
 ```
 */
/*:
 右辺の値はすでに存在するので、型を持つことになります。`leftHandSide`は同じ型を持つと推論されます。
*/
let string = "42"
let anotherString = string
/*:
 この例で、`string`はリテラルから作成されているので`String`型です。そして、`anotherString`も`String`から作成されているので`String`型です。
 */
/*: 
 - experiment:(実験): `"42"`を`42`に変更します。こうすると、`anotherString`の型は何になるでしょうか？\
（ヒント：`Option`キーを押しながら`anotherString`定数をクリックすると型を確認できます）
 */
/*:
次は、型推論が機能しない場合にどうするかを見ていきます。 
 */
/*: 
[前ヘ](@previous)  |  7／13ページ  |  [次は「型アノテーション」です。](@next)
*/
