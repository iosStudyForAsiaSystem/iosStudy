/*:
 ## メソッドやプロパティを使う理由
 
 このレッスンでは、コードの記述に役立つ繊細かつパワフルな概念について学習しました。
 */
/*: 
 メソッドとプロパティを使うことで、特定の型の各インスタンスには、アクセス可能な値のセットと、使用可能な動作のセットができます。
 */
/*: 
 メソッドとプロパティは、関連する情報（プロパティ）と実行すべき処理（メソッド）を単一の自己完結型パッケージ（インスタンス）にまとめることによって、大きなプログラムの複雑さを分解するのに役立ちます。
 */
/*: 
 例えば`String`では、`hasPrefix()`関数を記述する場合、型の外側で、テストする文字列と、チェックする接頭辞を持つもう一つの文字列を取るものを記述できます。
 */
/*: 
 `func hasPrefix(fullString: String, prefixString: String)`
 */
/*: 
このような関数は、ほかの何にも含まれていないのでトップレベルの関数と呼ばれます。ここまでに皆さんが記述してきた関数は、すべてトップレベルの関数です。
 */
/*: 
しかし、トップレベルの関数や変数にメソッドやプロパティを使うと非常に大きなメリットがあります。
 */
/*: 
 - 型の機能を型自体とまとめることによって、コードが理解しやすくなります。
     
     
 - オートコンプリート機能がより適切に機能します。オートコンプリート機能では、入力している時点で適用可能なメソッドのみが候補として表示されます。すべてのメソッドがトップレベルの関数だったら、入力し始めるとシステム内のすべての関数が表示されることになります。
    
    
 - マニュアルを整理すると、目的のものを見つけやすくなります。文字列または数値に対して何らかの処理を行うトップレベルの関数すべてを、どのように分類すればよいでしょうか？文字列と数値の両方を扱う関数ではどうでしょう？どうやって適切なマニュアルを探せばよいでしょうか？
 
 */
/*:
 このコースで学習したように、関数は複雑さを隠すことができ、特に目的が明らかになるような名前があると使いやすいものです。メソッドとプロパティを持つインスタンスは、その考え方をさらに拡大したものです。`String`の各インスタンスは「空である」かどうかを表したり、渡された文字列を「接頭辞として持つ」かどうかを表すということは、知っていますね。インスタンスの背後にある、答えを出すための複雑な部分は見えません。文字列を使う時に必要なのは、処理をさせるためにメソッドとプロパティを呼び出すだけです。あとは`String`型に任せておけば処理してくれます。
 */
/*:
[前ヘ](@previous)  |  13／17ページ  |  [次は「まとめ」です。](@next)
*/


