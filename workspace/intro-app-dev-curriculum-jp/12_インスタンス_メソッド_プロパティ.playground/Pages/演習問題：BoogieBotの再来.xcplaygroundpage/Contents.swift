/*:
 ## 演習問題：BoogieBotの再来
 
 以前にBoogieBotを使った時は、ダンスの動作を実行する関数のリストが必要でした。
 
 このPlaygroundでは、`BoogieBot`は型です。次のようにインスタンスを作成します。
*/
let leftBot = BoogieBot()
//: インスタンスを扱っているので、ロボットを複数作成できます。
let rightBot = BoogieBot()
//: 2つのBoogieBotにダンス対決をさせたら楽しいだろうな、と思っている人には朗報です。それを実現するために、このPlaygroundにはもう1つの型が組み込まれています。
let stage = BoogieStage()
//: ステージでは、ステージ上で行われるダンスを録画できます。
stage.startRecording()
//: それぞれのロボットに名前を付けます。
leftBot.botName = "Lefty"
rightBot.botName = "Righty"
//: 次に、ロボットたちをステージに配置します。
stage.leftBot = leftBot
stage.rightBot = rightBot
/*
 アシスタントエディタを開き、タイムラインを選択してロボットを確認します。
 オートコンプリート機能を使うことで、`BoogieBot`のAPIを利用できます。
 
 ダンスバトルを開始
 */
leftBot.fabulize()
leftBot.leftArmUp()
leftBot.leftArmDown()
leftBot.rightLegUp()
leftBot.rightLegDown()

rightBot.fabulize()
rightBot.shakeItLeft()
rightBot.shakeItCenter()
rightBot.leftLegUp()
rightBot.leftLegDown()






//: - experiment:(実験): BoogieBotのインスタンスメソッドを使って、2体のロボットのダンス対決を構築してください。オートコンプリートのポップアップメニューを使うと便利です。機能するロボットがない場合に、`leftArmUp()`を呼び出す危険はありません。

//: [前ヘ](@previous)  |  15／17ページ  |  [次は「演習問題：ツリーハウスの滑車」です。](@next)
