import AppKit
import ImageIO
import PlaygroundSupport

class Recorder: NSObject {
    var recordingLayer: CALayer!
    var targetView: NSView?
    var frames = [CGImage]()
    var timer: Timer?
    var scale: CGFloat = 1.0
    var outputSize: CGSize!
    
    private let frameDuration: TimeInterval = 0.05
    // フレーム録画のタイマーを開始
    func startRecording() {
        outputSize = CGSize(width: recordingLayer.bounds.width * scale, height: recordingLayer.bounds.height * scale)
        frames.removeAll()
        timer = Timer.scheduledTimer(timeInterval: frameDuration, target: self, selector: #selector(Recorder.takeSnapshot), userInfo: nil, repeats: true)
    }
    
    // ロボットを描画し、フレームとして保存
    @objc private func takeSnapshot() {
        
        let image = NSImage(size: outputSize)
        image.lockFocusFlipped(true)
        if let context = NSGraphicsContext.current()?.cgContext {
            context.scaleBy(x: scale, y: scale)
            recordingLayer.presentation()?.render(in: context)
        }
        
        image.unlockFocus()
        var destRect = NSRect(origin: .zero, size: outputSize)
        let cgImage = image.cgImage(forProposedRect: &destRect, context: NSGraphicsContext.current(), hints: nil)
        
        if let cgImage = cgImage {
            frames.append(cgImage)
        }
    }
    
    // 録画を中止して保存ボタンを表示
    internal func stopRecording() {
        timer?.invalidate()
        timer = nil
        
        guard
            let targetView = targetView ,
            frames.count > 0
            else { return }
        
        let button = NSButton(frame: NSRect(x: 50, y: 5, width: 200, height: 40))
        button.setButtonType(.momentaryPushIn)
        button.title = "Save"
        button.target = self
        button.action = #selector(Recorder.saveRecording)
        targetView.addSubview(button)
    }
    
    // ユーザーに対して保存パネルを表示
    @objc private func saveRecording() {
        
        if let data = saveFrames(frames) {
            
            do {
                let savePanel = NSSavePanel()
                let homeDirectory = URL(fileURLWithPath: NSHomeDirectory() + "/デスクトップ", isDirectory: true)
                savePanel.directoryURL = homeDirectory
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyyMMdd_HHmm"
                savePanel.nameFieldStringValue = "BoogieBot_\(formatter.string(from: Date())).gif"
                if (savePanel.runModal() == NSFileHandlingPanelOKButton) {
                    if var path = savePanel.url {
                        if (path.pathExtension != "gif") {
                            path = path.appendingPathExtension("gif")
                        }
                        try data.write(to: path, options: [])
                        print("Saved to \(path)")
                    }
                }
                
            } catch {
                print(error)
            }
        }
        frames.removeAll()
    }
    
    // 保存された各フレームをGIFとして書き出す
    private func saveFrames(_ frames:[CGImage]) -> Data? {
        guard frames.count > 0 else { return nil }
        
        let data = NSMutableData()
        guard let destination = CGImageDestinationCreateWithData(data, kUTTypeGIF, frames.count, nil) else { return nil }
        
        let frameProperties = [kCGImagePropertyGIFDictionary as String: [kCGImagePropertyGIFDelayTime as String: frameDuration]]
        let imageProperties = [kCGImagePropertyGIFDictionary as String: [kCGImagePropertyGIFLoopCount as String: 0]]
        CGImageDestinationSetProperties(destination, imageProperties as CFDictionary?)
        
        for image in frames {
            CGImageDestinationAddImage(destination, image, frameProperties as CFDictionary?)
        }
        guard CGImageDestinationFinalize(destination) else { return nil }
        
        return data as Data
    }
}
