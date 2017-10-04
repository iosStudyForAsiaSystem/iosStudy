/*:
 ## ループ
 
 Swiftには、配列内の各アイテムに対してコードを実行する方法が組み込まれています。これを配列の「ループ」処理と呼びます。
 */
/*:
 ジェットコースターを思い浮かべてください。待ち行列が配列です。車両が到着すると、最前列の人が乗り込み、ループを回ってから降ります。その後、列の次の人が順番に乗り込みます。🎢
*/
/*:
 配列をループ処理する場合、まず1つのアイテムを取り、そのアイテムを使ってコードを実行してから、次のアイテムを取ります。 
 */
/*:
 ![コードのループを表すグラフィック](loop.png)
 */
/*:
コレクション内のすべてのアイテムについてコードを実行するとループは自動的に止まり、コードは続けてプログラムの残りの部分を実行します。
 */
/*:
 配列内の各アイテムに対してコードを実行するには、「for…in」ループを使います。以下は、`friends`の配列をループで処理するコードです。
*/
let friends = ["Name", "Name2", "Name3", "Name4", "Name5"]

for friend in friends {
    let sparklyFriend = "✨\(friend)✨"
    print("Hey, \(sparklyFriend), please come to my party on Friday!")
}
print("Done, all friends have been invited.")
/*:
 */
//: 最初の行では、2つの重要な情報を使ってループを設定しています。
//: 1. 処理の対象となるコレクション（ここでは`friends`）。
//:
//:
//: 2. 処理するアイテムの呼び名（ここでは`friend`）。英文で表すと"For every friend in the friends collection..."（friendsコレクションのすべてのfriendについて...）となります。
/*:
 */
//: 中括弧の間のすべてのコードがループの「本文」です。これは、コレクションの各アイテムに対して実行される手順のリストです。最初にループを処理する時の`friend`の値は`Name`、2回目に処理する値は`Name2`、というようにコレクション全体がループを通るまで順番に処理されます。
/*:
 */
//: - experiment:(実験): `friend`定数は`for`ループの一部として定義されました。以下の行をコメント解除するとどうなると思いますか？結果は、ループが最後に使用した名前になるでしょうか？それともエラーが返されるでしょうか？
//friend
//: 次は、変更可能な配列を作成します。
/*:
 */
//: [前ヘ](@previous)  |  7／17ページ  |  [次は「可変の配列」です。](@next)
