/*:
 ## 演習問題：うるう年
 
 ある年がうるう年（Leap Year）かどうか判定するには、いくつかの判断を行う必要があります。
 
 - その年は4で割り切れますか？
    - もしそうなら、その年は100で割り切れますか？
        - そうでなければ、うるう年です。
        - もしそうなら、その年は400で割り切れますか？
            - そうでなければ、**うるう年ではありません。**
            - もしそうなら、うるう年です。
*/
/*:
 これらの判断を関数の中で行うことができます。
*/
/*:
 `number(_:, isDivisibleBy:)`関数は、このPlaygroundの演習を簡単にするために構築されています。以下は、ある年がうるう年かどうか判定する関数の一部です。
*/
func isLeapYear(_ year: Int) -> Bool {
    if number(year, isDivisibleBy: 4) {
        // このコードを完成させてください。
        return true
    } else {
        return false
    }
}
// Should be true
isLeapYear(2000)
// Should be false
isLeapYear(1900)
// Should be true
isLeapYear(2012)
// Should be false
isLeapYear(2017)
/*:
*/
//: - callout(演習): 上の関数を完成させ、すべてのルールに従い、例が正しい答えになるようにしてください。
/*:

_Copyright (C) 2017 Apple Inc. All Rights Reserved._\
_このサンプルのライセンス情報については、LICENSE.txtを参照してください。_

*/
/*:
[前ヘ](@previous)  |  13／13ページ
*/
