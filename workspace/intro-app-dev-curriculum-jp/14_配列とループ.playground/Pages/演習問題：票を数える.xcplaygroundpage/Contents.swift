/*:
 ## 演習問題：票を数える
 
 あなたは今、クラスの投票アプリケーションを開発しています。賛成／反対で答える基本的な質問の集計から始めます。最初に戻ってきた回答を以下の配列にパースしました。
 */
/*:
 データがたくさんありますね。でも、配列が長くなっても心配いりません。ループ処理を行う場合は、アイテム数が2つでも2,000でもコードの記述方法はまったく同じです。
*/
let shouldMascotChangeVotes: [Bool] = [false, false, false, true, false, true, true, true, false, true, true, true, true, false, true, true, false, true, true, true, false, true, true, true, true, true, true, true, false, true, false, true, false, true, true, false, false, true, true, false, false, true, true, true, false, true, false, true, true, false, true, true, false, true, false, false, true, false, true, true, false, false, true, false, true, true, true, false, true, true, false, false, true, false, true, true, false, false, false, true, false, true, true, false, true, true, true, true, true, true, true, false, true, false, true, false, true, true, true, true, true, true, true, false, true, true, false, true, true, true, true, true, true, true, false, true, true, false, true, true, false, true, true, true, true, true, false, false, false, false, true, true, true, false, true, true, false, false, true, false, false, true, true, true, true, false, true, true, true, true, false, true, true, false, true, false, false, true, true, false, true, false, false, false, true, false, false, false, true, false, true, true, false, true, true, false, true, true, true, false, false, false, true, false, true, false, true, true, true, true, false, true, false, false, true, true, true, true, true, false]

let shouldInstallCoffeeVendingMachineVotes: [Bool] = [true, true, false, false, false, true, true, false, true, true, true, true, false, true, false, false, true, false, true, false, true, true, false, false, false, false, false, true, true, true, false, false, true, true, false, true, true, true, true, false, true, false, true, true, false, false, false, false, false, false, true, false, true, true, false, true, true, true, true, false, false, true, true, false, false, false, false, true, true, false, false, true, true, true, true, false, false, true, true, false, true, false, true, false, true, true, true, false, true, true, true, false, false, false, false, false, false, false, false, false, false, false, true, false, true, false, false, true, true, false, true, false, true, true, true, false, false, false, false, false, false, true, true, false, false, true, true, true, true, true, true, false, false, false, true, true, true, true, false, false, false, true, true, false, true, true, true, false, false, true, false, true, false, true, false, false, true, false, true, true, true, true, true, true, true, false, true, false, true, true, false, false, true, false, false, true, false, false, false, true, false, true, true, true, false, false, false, false, false, false, true, false, true, false, true, true, false, false, false, true]

let shouldHaveMorePollOptionsVotes: [Bool] = [false, false, true, true, false, true, false, false, false, false, false, false, true, false, true, true, false, true, true, false, false, true, true, false, false, false, false, false, false, false, true, false, false, false, false, true, false, false, false, false, false, false, true, true, false, true, true, false, true, false, true, true, false, false, false, false, true, false, true, true, false, false, false, false, true, true, true, true, false, true, false, false, true, true, false, false, false, false, false, false, true, true, false, false, false, false, false, true, true, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true, false, false, true, false, true, false, false, false, true, false, true, true, true, true, true, true, true, false, false, false, false, true, false, false, false, false, false, true, false, false, true, false, false, true, false, false, true, false, false, true, false, false, true, false, false, false, false, false, true, false, false, false, false, false, false, true, true, true, false, true, false, false, false, false, false, false, false, false, true, true, true, true, false, true, true, false, false, true, false, true, true, false, false, true, true, false, true, false, false, false, true, true, false, false]

//:票数が多くて手作業で集計するのは大変なので、コードを記述して集計しましょう。
/*:
 */
//: - note:(注意):
//: Swiftで型推論を使って配列の種類を判断するには票数が多いので、上の配列リテラルでは型アノテーションを記述してSwiftに配列の型を知らせています。このようにすることで、Playgroundの動作が遅くならないようにします。
/*:
 */
//: - callout(演習): `yes`の票を数える変数と`no`の票を数える変数の2つを作成します。それぞれ値はゼロから始まるようにします。
/*:
 */

//: - callout(演習): `for…in`ループを作成し、票のコレクションを1つずつ取って値をチェックさせます。票が`true`なら、ループは`yes`の変数に1票を追加します。票が`false`なら、`no`の変数に1票を追加します。
/*:
 */



//: - callout(演習): ループが完了した後に2つの値を比較する`if`文を記述し、可決と否決の場合で異なるメッセージを出力するようにします。
/*:
 */


//: - callout(演習): それぞれの票のコレクションで`for…in`ループを呼び出してコードをテストします。\
//:可決されたのはどの案件でしたか？




/*:
 ### 拡張：
 `for…in`ループを簡単に再使用できると、もっとパワフルになります。コードを再使用する一番簡単な方法は、関数にすることです。
*/
/*:
 - callout(演習): 投票対象の問題を説明する文字列と、問題の`bool`票の配列の2つの引数を取る関数を記述します。`for…in`ループと`if`文を関数の中に移動し、特定の問題の引数を使って関数を呼び出すと結果が出力されるようにします。次のように関数を呼び出せるはずです。
 */
/*:
 ```
 (例):
 printResults(forIssue: "Should we change the mascot?", withVotes:shouldMascotChangeVotes)
 ```
*/
/*:
 コンソールに次のようなメッセージが出力されます。\
 `Should we change the mascot? 54 yes, 23 no`（マスコットを変えるべきか？賛成54、反対23）
*/
/*:
 */
// ここに票処理の関数を追加してください。






//: [前ヘ](@previous)  |  15／17ページ  |  [次は「演習問題：目標」です。](@next)
