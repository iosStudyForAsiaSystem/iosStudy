/*:
 ## 変動する世界でより安全なコード
 変数が使えるなら、わざわざ定数を使わなくてもよいのではないでしょうか。いつでも変更できる変数の方が便利ではありませんか？
 */
/*:
そんなことはありません。
 */
/*:
世界が一定であることを期待してコードを記述することがあります。あなたは友達に何を飲みたいか尋ね、それを届けるためにとても頑張ったとします。*/
var friendBeverageChoice = "コーヒー"

driveAcrossTown()
buyACoffeeMaker()
/*:
 あなたが時間をかけて戻ってくるまでの間に、知らないうちに友達の気が変わっているかもしれません。
 */
friendBeverageChoice = "紅茶"

findCoffeeGrinder()

friendBeverageChoice = "水"
friendBeverageChoice = "炭酸水"
friendBeverageChoice = "普通の水"

findCoffeeBeans()
driveHome()
setUpCoffeeGrinder()

friendBeverageChoice = "なし 😴"

grindBeans()
makeFriendDrinkCoffee()
/*:
 午前3時に友達の家のドアをノックしたとします。コーヒーを飲みたがっていた友達が喜んで起きてくるはずだと思ったのに、起こされた友達が不機嫌になっているのを見て、あなたはがっかりすることでしょう。コーヒーを飲みたいという友達の気持ちは変数なので、あなたはそれが定数であるかのように受け取って行動することはできません。
 */
/*:
 コードの中の変数にも、まったく同じ問題があります。一度だけ値をチェックし、その値が同じままだとして多くの作業を行った結果、その作業は不要だった、または明らかに間違っている、という結果になることがあります。
 */
/*:
 - callout(実験): `friendBeverageChoice`を`var`から`let`定数に変えるとページにエラーが表示されます。このコードを修正する方法は2つあります。\
`friendBeverageChoice`は`let`定数のままにして、それを変更する代入の行をすべて削除します。\
または、`friendBeverageChoice`を`var`変数にして、`setUpCoffeeGrinder()`など、絶対に必要と確信できない行はすべて削除します。\
2番目の方法では、あまり有用なプログラムになりません。
 */
/*: 
 どうすれば定数と変数を混ぜることができるでしょうか？
 */
/*: 
[前ヘ](@previous)  |  9／13ページ  |  [次は「予期できない世界でより安全なコード」です。](@next)
*/

