/*:
## 関数の中の関数
 
関数の宣言では、コード行をグループ化してそのグループに名前を付けます。 
 */
/*: 
そうすると単一の行でその関数を呼び出すことができます。さらにその関数行を、別のグループの中の1行にすることができます。つまり、ほかの関数を呼び出す関数を記述することができます。
 */
/*: 
以下は、先ほどの童謡の1番を別の方法で記述したものです。
*/
func rowTheBoat() {
    print("Row, row, row your boat")
    print("Gently down the stream")
}

func merrilyDream() {
    print("Merrily, merrily, merrily, merrily")
    print("Life is but a dream")
}

func verseOne() {
    rowTheBoat()
    merrilyDream()
}

verseOne()


/*: 
  - callout(演習): 以下の笑う潜水艦（laughing submarine）の関数を使って2番の歌詞を替えてみましょう。
*/
func laughingSubmarine() {
    print("Ha! Ha! Fooled you all")
    print("I’m a submarine")
}

// 下に2番の関数を記述します。


//: 次のページでは、関数の中で関数を使う時に注意すべきことについて学びます。\
//:\
//: [前ヘ](@previous)  |  6／12ページ  |  [次は「無限ループ」です。](@next)
