/*:
 ## アイテムを削除する
 
 可変配列からアイテムを削除する方法もいくつかあります。各メソッドは配列をアップデートし、メソッドの多くは削除されたアイテムを返します。
*/
var numbers = [0,1,2,3,4]
/*: 
 インデックスを使ってアイテムを削除できます。（繰り返しになりますが、配列内にインデックスが指定されている必要があります）
*/
/*:
 `remove(at:)`メソッドは、削除したアイテムを返します。
*/
let someNumber = numbers.remove(at: 2)
numbers
//: `removeFirst()`を使って最初のアイテムを削除できます。
let firstNumber = numbers.removeFirst()
numbers
//: `removeLast()`を使って最後のアイテムを削除できます。
let lastNumber = numbers.removeLast()
numbers
/*:
 */
//: > (注意): 空の配列で`removeFirst()`や`removeLast()`を使うとエラーになります。
//: `removeAll()`を使うとすべてのアイテムを削除できます。戻り値はありません。
numbers.removeAll()
numbers

//: 次は、可変配列でのアイテムの置換について学習します。
/*:
*/
//: [前ヘ](@previous)  |  10／17ページ  |  [次は「アイテムを置換する」です。](@next)
