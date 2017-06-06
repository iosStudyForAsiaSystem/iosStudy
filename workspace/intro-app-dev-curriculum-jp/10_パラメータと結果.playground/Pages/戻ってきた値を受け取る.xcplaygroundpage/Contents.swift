/*:
 ## 戻ってきた値を受け取る
 
 関数は、ユーザーが渡した値を使うだけでなく、処理結果の値をユーザーに返すことができます。
 */
/*: 
 関数の処理が完了した時に値を渡すことを、値を「返す」と言います。値を返す関数を宣言するには、コードに以下の2つを追加する必要があります。
 */
/*: 
 パラメータのリストの後にテキスト矢印`->`を追加し、返す値の型を追加します。例えば、
 `-> String`は、関数が`String`を返すことを意味します。
 */
/*: 
 次に、その型の値を返すreturn文で関数の本文を終える必要があります。
 */
/*: 
 以下の関数は、いくつかの数値を取り、処理を行って、文字列を返します。
*/
func spaceAvailableMessage(eachVideoDuration: Int, numberOfVideos: Int) -> String {
    let currentSpace = 10000
    let megabytesPerVideoSecond = 3
    let spaceAvailable = currentSpace - eachVideoDuration * numberOfVideos * megabytesPerVideoSecond
    
    return "If your \(numberOfVideos) videos are \(eachVideoDuration) seconds each, you'll have \(spaceAvailable) MBs remaining"
}
spaceAvailableMessage(eachVideoDuration: 10, numberOfVideos: 50)
/*:
*/
//: > (注意): 関数には複数のパラメータを使用できますが、返せる値は**1つ**です。
/*:
 */
//: 関数が返す値は、ほかの値と同じように扱われます。変数や定数に代入したり、ほかの処理に使ったりできます。変数や定数を引数として使うこともできます。
let desiredVideoDuration = 40
let holidayVideoCount = 100
let videoMessage = spaceAvailableMessage(eachVideoDuration: desiredVideoDuration, numberOfVideos: holidayVideoCount)
let namedVideoMessage = "Hey Micah! \(videoMessage)"


//: 値を返す関数を作ってみてください。
/*:
*/
//: [前ヘ](@previous)  |  6／17ページ  |  [次は「戻ってきた値を渡す」です。](@next)
