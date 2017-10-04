/*:
 ## 1回変更すればよい
 
 関数を使っていれば、簡単に変更を行うことができます。コードを変更するのは、一か所だけでよいからです。関数がどのように機能して何をするのか理解しているので、どこを変更すればよいかわかりますね。
 */
/*: 
 このページでは、関数`merrilyDream()`、`crocodileScream()`、`repetitiveTheme()`、および`breatheBetweenVerses()`がすでに定義されています。
 */
/*: 
 その他の関数を以下で宣言します。
*/
func rowTheBoat() {
    print("Row, row, row your boat")
    print("Gently down the stream")
}

func verseOne() {
    rowTheBoat()
    merrilyDream()
}

func verseTwo() {
    rowTheBoat()
    crocodileScream()
}

func verseThree() {
    rowTheBoat()
    repetitiveTheme()
}

verseOne()
breatheBetweenVerses()
verseTwo()
breatheBetweenVerses()
verseThree()
/*: 
 - callout(演習): 童謡の内容がボートではなくなることになりました。\
 `rowTheBoat()`のprint文をアップデートし、曲のパターンはそのままで、内容を変更します。\
 パターンは以下のとおりです。\
 _動詞、動詞、動詞、 “your” 名詞_\
 _la la la la rhyme_（メロディに合う適当な歌詞）\
 例えば、「_Ride, ride, ride your bike」、「With your cycling team_」のようにします。\
 \
 2行だけコードを修正すれば、この関数が呼び出されるすべての場所で変更が反映されます。
 */
/*: 
 次は、学んだ内容を振り返りましょう。
 */
/*: 
 [前ヘ](@previous)  |  9／12ページ  |  [次は「まとめ」です。](@next)
*/
