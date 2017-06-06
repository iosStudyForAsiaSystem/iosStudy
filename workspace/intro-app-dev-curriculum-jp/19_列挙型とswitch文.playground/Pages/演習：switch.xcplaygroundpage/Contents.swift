/*:
 ## 演習：switch
 
 次のenumは、ゲームでプレーヤーが当てる的を表しています。
*/
enum Target {
    case red, green, blue, gold
}
/*:
*/
//: 次の関数は、特定の的の得点を返します。
func score(target: Target) -> Int {
    return 0
}
/*:
 */
//: - callout(演習): `score(target:)`関数をアップデートし、switch文を使ってそれぞれの的の得点を返すようにしてください。以下の文はそれぞれの値です。
score(target: .red)    // これを10にする
score(target: .green)  // これを15にする
score(target: .blue)   // これを25にする
score(target: .gold)   // これを50にする

/*:
 _Copyright (C) 2017 Apple Inc. All Rights Reserved._\
 _このサンプルのライセンス情報については、LICENSE.txtを参照してください。_
*/
/*:
[前ヘ](@previous)  |  21／21ページ
*/
