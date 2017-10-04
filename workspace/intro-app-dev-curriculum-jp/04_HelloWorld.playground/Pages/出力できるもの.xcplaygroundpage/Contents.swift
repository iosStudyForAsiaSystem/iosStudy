/*:
 ## 出力できるもの
 
 結果サイドバーに表示されるものは、何でもコンソールに`print`できます。
 */
/*: 
 結果サイドバーを開き、例をチェックして確認してください。
 */
/*: 
>(注意): print文の結果サイドバーに`\n`が表示されるのは、`print`によって文字列の最後に新しい行が追加されるためです。改行しないと、すべてが同じ行に出力されてしまいます。
 */
/*: 
 文字列を出力できます。
*/
"Hello, world!"
print("Hello, world!")
  
/*:
//: 数字および計算：
*/
 8
print(8)
7 + 11
print(7 + 11)
/*:
//: 文字列式：
 */
"Have you seen" + "..." + "nevermind."
print("Have you seen" + "..." + "nevermind.")
/*:
//: 定数：
*/
let authorName = "Beatrix Potter"
print(authorName)
let bookTitle = "Jemima Puddleduck"
print(bookTitle)
/*:
 括弧内の結果は、何でもコンソールに表示されます。
 */
/*:  
 - callout(実験): 結果サイドバーで以下の文を探し、例のようにそれぞれの文をコンソールに出力してください。\
 \
前：\
`authorName`\
後：\
`print(authorName)`
*/
authorName
"authorName"
"Did you know that \(bookTitle) was written by \(authorName)?"

//:次に、コンソールの一般的な使い方を見ていきます。 \
//:\
//: [前ヘ](@previous)  |  7／11ページ  |  [次は「ログへの記録」です。](@next)
