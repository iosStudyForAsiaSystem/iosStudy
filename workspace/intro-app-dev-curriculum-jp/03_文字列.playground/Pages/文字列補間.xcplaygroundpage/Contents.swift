//: ## 文字列補間
//: Swiftでは、値に置き換えられるプレースホルダを使用して文字列を定義できます。これは、前のページの空欄を埋める例と同様に機能します。\
//:\
//: “Hello _______, welcome to _______!”\
//:\
//: Swiftではプレースホルダとしてスペースは使用しません。`\(name)`を使用します。`name`の値がプレースホルダになります。\
//:\
//: 実際の例を次に示します。結果のサイドバーでは、firstNameとcityの値が埋め込まれて表示されます。
let firstName = "Tim"
let city = "Cupertino"

let welcomeString = "Hello \(firstName), welcome to \(city)"
//: - experiment:(実験): 自分の好きな食べ物を表す文字列を作成してください。\
//: “I like _____ because it is _____.”
//:
// 次の値を好きな食べ物に変更してください。
let favoriteFood = "pie"

// 次の値をその食べ物が好きな理由に変更してください。
let reason = "tasty"

// "I like ___ because it is ___."というパターンで以下に文字列を定義してください。


//: 次のページでは、文字列が長くなるとどうなるか考えます。\
//:\
//: [前ヘ](@previous)  |  7／16ページ  |  [次は、「Playgroundの結果の表示」です。](@next)
