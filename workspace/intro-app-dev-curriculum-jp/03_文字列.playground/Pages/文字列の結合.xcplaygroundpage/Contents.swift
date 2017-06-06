//: ## 文字列の結合
//: プログラマは、文字列を1つにまとめる必要がある場合がよくあります。\
//:\
//: 例えば、ソーシャルメディアアプリケーションで _Chris likes your post_ のようなメッセージが表示されることがあります。\
//:\
//: Swiftでは、複数の文字列をつなげることによって、結合することができます。
//:
// 次の部分はそのつど変わります。
let username = "Chris"

// メッセージのこの部分は再利用されます。
let likesYourPostMessage = "likes your post"

// プラス記号を使用して文字列を結合します。
let finishedMessage = username + " " + likesYourPostMessage
//: 結果のサイドバーで文字列がどのように結合されたかを確認できます。 👉\
//:\
//: 2つの文字列の間に空白を追加しない場合、どうなるでしょうか。
//: - experiment:(実験): 名と姓に対応する文字列定数`firstName`と`lastName`を宣言します。\
//:それらを`fullName`定数に結合します。\
//:`firstName`と`likesYourPostMessage`を結合します。\
//:以下のそれぞれのコメントの下に、コードの行を入力してください。
// firstName定数を宣言します 


// lastName定数を宣言します 


// これらの文字列をfullName定数に結合します 


// 名とlikesYourPostMessageを結合します 


//: 次に、複数の文字列をつなげて文字列を作成すると非常に複雑になる場合があることを見ていきます。\
//:\
//: [前ヘ](@previous)  |  5／16ページ  |  [次は「空欄を埋める」です。](@next)
