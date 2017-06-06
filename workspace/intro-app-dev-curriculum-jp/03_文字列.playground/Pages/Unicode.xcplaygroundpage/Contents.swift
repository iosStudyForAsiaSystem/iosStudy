//: ## Unicode
//:
//: Unicodeは、すべての言語のほぼすべての文字を標準的な方法で表すことができる国際標準です。\
//:\
//: Swiftの文字列はUnicodeに完全に準拠しているため、様々な言語のテキストを含む文字列を作成することができます。
//:
let englishGreeting = "Hello, World!"

let chineseGreeting = "你好，世界!"

let spanishGreeting = "¡Hola Mundo!"

let russianGreeting = "Привет мир!"

let japaneseGreeting = "こんにちは世界!"
//: 様々な言語を文字列に含めることができるため、世界中の人が使えるアプリケーションを作成できます。\
//:\
//: もちろん、世界中のプログラマは様々な言語を話します。Swiftでは、名前にUnicodeを使用できます。
// 「英語の挨拶」を意味する中国語の定数の名前
let 英语问候 = "Hello, World!"

// 「英語の挨拶」を意味するフランス語の定数の名前
let salutationAnglais = "Hello, World!"
 
//: 絵文字もUnicodeで定義されるため、絵文字を文字列に含めることができます。\
//: （Macでは、Command+Control+スペースを入力すると絵文字ピッカーが表示されます）
let welcomingPhrase = "Welcome! 😀"

//: 絵文字を名前に使用することもできます。これらを使用すると少し面白くなりますが、多くのプログラマにとって入力したり、読み取ったりするのは簡単ではなく、名前に単語を使用する場合よりも表現の仕方が限られてしまいます。
let 🍓🍏🍒🍐🍋🍇 = "Fruit Salad"
//: 次のページに進み、複数の文字列を1つに結合する方法を見てみましょう。\
//:\
//: [前ヘ](@previous)  |  4／16ページ  |  [次は「文字列の結合」です。](@next)
