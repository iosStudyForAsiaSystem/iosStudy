/*:
 ## 演習問題：引数のラベルを使わない場合
 
 一部の関数名は見ただけで内容がわかるため、引数にラベルを付ける必要はありません。引数だけで呼び出せる関数を記述する時は、通常は引数のラベルを指定する場所にアンダースコア`_`を使います。
/*:
*/
 以下の関数には、呼び出す時に不要な引数ラベルがあります。
*/
func holler(phrase: String) -> String {
    return "⚡️\(phrase)!!⚡️"
}

holler(phrase: "Thank you, this is very nice.")
holler(phrase: "I'm not sure that was necessary.")
/*:
*/
/*:

 - callout(演習): 関数を次のように呼び出せるよう、定義をアップデートしてください。\
 `holler("That's a little surprising!")`
 */
/*:
 _Copyright (C) 2017 Apple Inc. All Rights Reserved._\
 _このサンプルのライセンス情報については、LICENSE.txtを参照してください。_
 */
/*:
[前ヘ](@previous)  |  17／17ページ
*/
