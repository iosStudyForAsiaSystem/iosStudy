//: ## Playgroundの結果の表示
//: 長い文字列をPlaygroundで定義するとどうなるでしょうか。結果を表示するサイドバーでは、長い文字列が途中で切れていることに気付くでしょう。 👉
//:
let spelledOutNumber = "six"
let meal = "breakfast"
let aliceQuotation = "Why, sometimes I’ve believed as many as \(spelledOutNumber) impossible things before \(meal)!"
//: 結果のサイドバーのWhy, sometimes I’ve believed…で始まる行にカーソルを移動します。そうすると、その結果がハイライトされ、2つのコントロールが表示されます。\
//:\
//: ![サイドバーのコントロール](SidebarControls.png)\
//:\
//: 目のように見えるコントロールをクリックしてください。これがQuickLookコントロールです。ポップオーバーに文字列全体の値が表示されます。\
//: \
//: 空の円のようなコントロールの上にカーソルを動かすと、プラス記号が表示されます。これが「結果を表示」ボタンです。プラス記号をクリックすると、そのコード行の結果がコードの下に直接追加されます。この時コントロールは「X」のように見えますが、これをもう一度クリックすると結果が非表示になります。\
//:\
//: ここでは、長い文字列の結果は表示させておきます。spelledOutNumberとmealの値を変更します。Playgroundのインラインで結果がどのように変わるか確認できます。\
//:\
//: 次のページでは、これらの文字列をさらに詳しく学習します。\
//:\
//: [前ヘ](@previous)  |  8／16ページ  |  [次は「文字列の追加機能」です。](@next)
