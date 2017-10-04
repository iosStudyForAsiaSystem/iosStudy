import AppKit
import PlaygroundSupport

// NSViewサブクラスは左上を原点とするCALayerジオメトリをサポートしている必要があります
class FlippedView: NSView {
    override var isFlipped: Bool {
        return true
    }
}

/// BoogieBotはダンスロボットです。ダンスで様々な動きをするための多くのメソッドがあります
public class BoogieBot {
    internal let bot = BoogieBotLayer(frame: CGRect(x: 0.0, y: 0.0, width: 150, height: 250))
    internal let boogieView: FlippedView
    
    public init() {
        boogieView = FlippedView(frame: bot.bounds)
        boogieView.wantsLayer = true
        bot.backgroundColor = NSColor.black.cgColor
        boogieView.layer?.addSublayer(bot)
    }
    
    /// BoogieBotの左腕を上げます
    /// - 注意：すでに腕を上げている場合、このメソッドは何もしません。
    public func leftArmUp() {
        bot.doMove(.leftArmUp)
    }
    /// BoogieBotの左腕を下げます
    /// - 注意：すでに腕を下げている場合、このメソッドは何もしません。
    public func leftArmDown() {
        bot.doMove(.leftArmDown)
    }
    /// BoogieBotの右腕を上げます
    /// - 注意：すでに腕を上げている場合、このメソッドは何もしません。
    public func rightArmUp() {
        bot.doMove(.rightArmUp)
    }
    /// BoogieBotの右腕を下げます
    /// - 注意：すでに腕を下げている場合、このメソッドは何もしません。
    public func rightArmDown() {
        bot.doMove(.rightArmDown)
    }
    /// BoogieBotの左足を上げます
    /// - 注意：すでに足を上げている場合、このメソッドは何もしません。
    public func leftLegUp() {
        bot.doMove(.leftLegUp)
    }
    /// BoogieBotの左足を下げます
    /// - 注意：すでに足を下げている場合、このメソッドは何もしません。
    public func leftLegDown() {
        bot.doMove(.leftLegDown)
    }
    /// BoogieBotの右足を上げます
    /// - 注意：すでに足を上げている場合、このメソッドは何もしません。
    public func rightLegUp() {
        bot.doMove(.rightLegUp)
    }
    /// BoogieBotの右足を下げます
    /// - 注意：すでに足を下げている場合、このメソッドは何もしません。
    public func rightLegDown() {
        bot.doMove(.rightLegDown)
    }
    /// BoogieBotの腰を左に振ります
    /// - 注意：すでに腰を左に振っている場合、このメソッドは何もしません。腰を右に振っている場合は、左に動かします。
    public func shakeItLeft() {
        bot.doMove(.shakeItLeft)
    }
    /// BoogieBotの腰を右に振ります
    /// - 注意：すでに腰を右に振っている場合、このメソッドは何もしません。腰を左に振っている場合は、右に動かします。
    public func shakeItRight() {
        bot.doMove(.shakeItRight)
    }
    /// BoogieBotの腰の位置を中央に戻します
    /// - 注意：すでに腰の位置が中央に戻っている場合、このメソッドは何もしません。
    public func shakeItCenter() {
        bot.doMove(.shakeItCenter)
    }
    /// BoogieBotをジャンプさせます
    /// - 注意：すでにBoogieBotがジャンプしている場合、このメソッドは何もしません。
    public func jumpUp() {
        bot.doMove(.jumpUp)
    }
    /// BoogieBotをジャンプしている状態から元に戻します
    /// - 注意：BoogieBotがジャンプしていない場合、このメソッドは何もしません。
    public func jumpDown() {
        bot.doMove(.jumpDown)
    }
    /// BoogieBotをランダムに明るい色に変えます。
    /// - 注意：すでにBoogieBotの色が変わっている場合、このメソッドは新しい色に変えます。
    public func fabulize() {
        bot.doMove(.fabulize)
    }
    /// BoogieBotを標準の色に変えます。
    /// - 注意：BoogieBotの色が変わっていない場合、このメソッドは何もしません。
    public func defabulize() {
        bot.doMove(.defabulize)
    }
    /// BoogieBotのタイトルです。ルーチンの途中でこれを変更することはできません。
    public var botName: String {
    get { return bot.botName }
    set { bot.botName = newValue }
    }
        
    internal func correctScale () {
        if let scale = boogieView.window?.backingScaleFactor {
            bot.setScale(scale)
        }
    }

}

extension BoogieBot: CustomDebugStringConvertible {
    public var debugDescription: String {
        if botName == "" {
        return "BoogieBot"
        } else {
            return botName
        }
    }
}
