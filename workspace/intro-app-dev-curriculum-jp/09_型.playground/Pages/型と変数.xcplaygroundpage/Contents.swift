/*:
 ## 型と変数
 
 変数に初めて値を代入すると、変数の型は自動的にその値の型になります。
 */
/*:
 それ以降、Swiftはその変数の型を追跡し、誤って別の型の値が代入されないようにします。
 */
/*: 
 下の行をコメント解除し、`favoriteThing`の値を`42`に設定します。
*/
var favoriteThing = "Whiskers on kittens"
//favoriteThing = 42
/*: 
 「`Cannot assign value of type 'Int' to type 'String'`」（String型にInt型の値を代入することはできません）というエラーが表示されます。ここは重要です。変数の「値」を変えることはできますが、「型」を替えることはできません。
 */
/*: 
 このルールは、コード内のミスや混乱を避けるのに役立ちます。 
 */
/*: 
 - callout(演習): 上のエラーのある行をアップデートし、変数をアップデートできるようにします。`Int`ではなく`String`を記述するにはどうすればよいでしょうか？ 
 */
/*: 
 次は、ユーザーが型を安全に使えるようにする、Swiftのそのほかの機能について学習します。
 */
/*: 
[前ヘ](@previous)  |  4／13ページ  |  [次は「型安全」です。](@next)
*/

