/*:
 ## 分解する
 
 この童謡の節には、次のようなパターンがあります。
 
 
 - 最初の2行はどの節も同じ。
     
    
 - 次の2行は節によって変わる。
     
     
 - 節と節の間で一呼吸する。
*/
/*:
プログラマは、最初の童謡の出力のように長いタスクリストがあると、多くの場合、1つの長いリストを複数の小さなリストに分けます。これを「分解」と呼びます。リストの分解方法を選ぶ場合、意味を持つ最も小さな仕事を見つけると役に立ちます。例えば、1つの節を複数の意味のある関数に分割するには、次のようにします。
*/
func rowTheBoat() {
    print("Row, row, row your boat")
    print("Gently down the stream")
}

func merrilyDream() {
    print("Merrily, merrily, merrily, merrily")
    print("Life is but a dream")
}

func breatheBetweenVerses() {
    print("        ~        ")
}
//: これらの関数を使うと、以下のように1番、および2番の前半を出力できます。
rowTheBoat()
merrilyDream()
breatheBetweenVerses()
rowTheBoat()
/*:
*/
//: - callout(演習): 2番の後半の2行について`crocodileScream()`という関数を記述し、これを呼び出してコンソールで曲を完成させてください。











//: 次は、より大きな仕事のグループを作ることについて学習します。\
//:\
//: [前ヘ](@previous)  |  5／12ページ  |  [次は「関数の中の関数」です。](@next)
