/*:
 ## 演習問題：抽選券
 友達の起業家精神はますます旺盛です。今度は町で抽選会を行うことにしました。
 
 ものに名前を付けて値を一度だけ設定することが有用なもう1つの理由は、何かを計算する正しい方法を判断でき、値を変更して答えをチェックできるからです。
*/
// 編集すべき値
let ticketsSold = 1000
let ticketPrice = 1
let printingCosts = 20
let advertising = 50
/*:
 - callout(演習): これまで、友達のために無償でずいぶん働いてきました。今回は、友達から報酬として利益の一部をもらいます。あなたは友達から、利益の10分の1をもらいます。賞金は、チケット販売合計額の半分です。上の数（販売チケット数、チケットの価格、印刷または広告費）を変更して、自分の取り分を100以上にできるかどうか確認してください。

 下の計算は固定されていますが、上の数を変更することによって結果が変わります。
*/
// Total takings（売上合計額）
let totalTakings = ticketPrice * ticketsSold

// Jackpot（賞金）
let jackpot = totalTakings / 2

// Expenses（費用）
let totalExpenses = printingCosts + advertising

// Profit（収益）
let profit = totalTakings - jackpot - totalExpenses

// Distribution（配分）
let programmersCut = profit / 10 // これが100以上になるようにします！👉 
let friendsCut = profit - programmersCut

//:[前ヘ](@previous)  |  11／14ページ  |  [次は「演習問題：あなたのiPhoneに入るのは？」です。](@next)
