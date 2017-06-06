//: ## 空欄を埋める
//: 文字列をつなげて結合することは、非常に有用です。ただし、忘れずに単語の間に空白を追加しなければなりません。そうしないと、単語がすべてつながってしまいます。
// 名と姓の間に忘れずに空白を追加してください。
let fullName = "Johnny" + "Appleseed"
//:
//: ある都市に初めて到着した時にユーザーを歓迎するアプリケーションを考えます。次のような文字列にしたいと思います。\
//:\
//: _Hello Tara, welcome to Paris!_\
//:\
//: いくつかの文字列をつなげてその文字列を作成できますが、少し複雑になります。
//:
let firstName = "Tara"
let city = "Paris"
let welcomeString = "Hello " + firstName + ", welcome to " + city + "!"
//:
//: このような、より複雑な文字列を作成する場合、空欄を埋める文字列を定義する方法が役立ちます。次のような文字列になります。\
//:\
//: “Hello _______, welcome to _______!”\
//:\
//: Swiftでは、このような文字列を定義する方法があります。この方法の正式な名称は「文字列補間」といいます。難しそうな名前ですが、基本的には空欄を埋めるだけです。\
//:\
//: これをSwiftで行う方法に話を進めましょう。\
//:\
//: [前ヘ](@previous)  |  6／16ページ  |  [次は「文字列補間」です。](@next)
