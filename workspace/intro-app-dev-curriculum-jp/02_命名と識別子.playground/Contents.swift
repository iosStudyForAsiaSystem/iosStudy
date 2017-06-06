//: プログラマは、あらゆる問題を解決するために、利用可能なツールなら何でも使います。（深刻な問題でなくてもかまいません。「暇だから面白いゲームをやりたい」というのも1つの問題です）
//:
//: このコースを進めながら、ものごとをやり遂げる方法、コードを使って問題を解決する方法、素晴らしいアプリケーションを構築する方法を学んでいきます。最初は基本を使った小規模でシンプルなものですが、手持ちのツールが増えるにつれて、知っていることを使ってより多くのことができるようになります。
//:
//: プログラマは、自分自身のために問題を解決したりアプリケーションを記述することもあるかもしれませんが、多くの場合はほかの人の問題解決をサポートします。コードの記述方法を学ぶだけでなく、様々な種類の問題を想像し、その解決方法を考えることが非常に重要です。
//:
//: #### ペットの問題
//: あなたの友達がペットショーを開こうとしているとします。友達は、来場者が連れてくる各種の動物の数を把握する必要があります。
//: また、来場する動物の合計数と哺乳類（mammals）の数も知る必要があります。
//:
//: あなたの手元にあるのは、Xcode Playgroundsがインストールされたラップトップだけです。これで友達を手伝うことができそうです。
//:
//: これまでに身につけた知識を使えば、次のようなコメントと数を使って各動物の数を把握できます。

// Number Of Dogs（犬の数）
5

// Number Of Cats（猫の数）
4

// Number Of Turtles（カメの数）
3

//: それらの数字をコピーすれば、次のようにPlaygroundが計算をしてくれます。

// Total Number Of Animals（動物の合計数）
5 + 4 + 3

// Total Number Of Mammals（哺乳類の合計数）
5 + 4

//: - experiment:(実験): 後日、来場者のペットについて情報が入りました。変更に応じて、上のコードをアップデートしてください。
//: 
//: 例えば、もう1人犬を連れてくる人がいる場合、この変更を追跡するには、「`Number Of Dogs`」を`5`から`6`に変更し、犬の数が出てくるすべての場所（「Total Number Of Animals」と「Total Number Of Mammals」）で`5`を`6`に変更します。
//: 
//: だれかが新しい種類の動物を連れてくる場合は、新しいコメント（`// Number Of Hamstersなど）を追加し、その下の行に数を追加して、合計をアップデートします。
//:
//: - さらにもう1人が犬を1匹連れてくる。
//: - 1匹のカメが病気で来られない。
//: - さらにもう1人が猫を1匹連れてくる。
//: - だれかがハムスター（哺乳類）を1匹連れてくる。
//: - だれかがイグアナ（哺乳類ではない）を1匹連れてくる。







