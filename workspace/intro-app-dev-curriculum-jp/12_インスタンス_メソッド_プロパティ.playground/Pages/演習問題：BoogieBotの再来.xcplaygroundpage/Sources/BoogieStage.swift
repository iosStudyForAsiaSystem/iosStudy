import AppKit
import PlaygroundSupport

public class BoogieStage {
    
    private let stageView: FlippedView
    
    /// ステージの左のBoogieBot
    public var leftBot = BoogieBot() {
        didSet {
            oldValue.boogieView.removeFromSuperview()
            leftBot.boogieView.frame = CGRect(x: 0.0, y: 0.0, width: 150.0, height: 250.0)
            stageView.addSubview(leftBot.boogieView)
            leftBot.correctScale()
            leftFinished = false
            leftBot.bot.boogieDelegate = self
        }
    }
    /// ステージの右のBoogieBot
    public var rightBot = BoogieBot() {
        didSet {
            oldValue.boogieView.removeFromSuperview()
            rightBot.boogieView.frame = CGRect(x: 150.0, y: 0.0, width: 150.0, height: 250.0)
            stageView.addSubview(rightBot.boogieView)
            rightBot.correctScale()
            rightFinished = true
            rightBot.bot.boogieDelegate = self
        }
    }
    
    public init () {
        stageView = FlippedView(frame: CGRect(x: 0.0, y: 0.0, width: 300.0, height: 300.0))
        stageView.wantsLayer = true
        stageView.layer?.backgroundColor = NSColor.black.cgColor
        PlaygroundPage.current.liveView = stageView
        leftBot.boogieView.isHidden = true
        rightBot.boogieView.isHidden = true
    }
    
    fileprivate let recorder = Recorder()
    fileprivate var leftFinished = true
    fileprivate var rightFinished = true
    
    /// ステージ上で行われるダンスの録画を開始します。両方のBoogieBotがダンスを終えると保存ボタンが表示されます。
    public func startRecording() {
        recorder.targetView = stageView
        recorder.recordingLayer = stageView.layer
        recorder.scale = 0.5
        recorder.startRecording()
    }
}

extension BoogieStage: BoogieBotDelegate {
    internal func dancingFinished(bot: BoogieBotLayer) {
        if bot == leftBot.bot {
            leftFinished = true
        }
        
        if bot == rightBot.bot {
            rightFinished = true
        }
        
        if leftFinished && rightFinished {
            recorder.stopRecording()
        }
    }
}

extension BoogieStage: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "\(leftBot) VS \(rightBot)"
    }
}



