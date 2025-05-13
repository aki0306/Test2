import UIKit

class KeyboardCaptureView: UIView, UIKeyInput {

    var realText: String = "" {
        didSet {
            setNeedsDisplay()
        }
    }

    var isMasked: Bool = true {
        didSet {
            setNeedsDisplay()
        }
    }

    // 🔽 プレースホルダー用プロパティ
    var placeholder: String? {
        didSet {
            setNeedsDisplay()
        }
    }

    // MARK: - UIKeyInput

    var hasText: Bool {
        return !realText.isEmpty
    }

    func insertText(_ text: String) {
        realText += text
    }

    func deleteBackward() {
        if !realText.isEmpty {
            realText.removeLast()
        }
    }

    override var canBecomeFirstResponder: Bool {
        return true
    }

    // MARK: - 描画

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        let textToDraw: String
        let textColor: UIColor

        if realText.isEmpty, let placeholder = placeholder {
            // プレースホルダー表示
            textToDraw = placeholder
            textColor = UIColor.lightGray
        } else {
            // 通常の入力文字表示
            textToDraw = isMasked ? String(repeating: "●", count: realText.count) : realText
            textColor = UIColor.red
        }

        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 18),
            .foregroundColor: textColor
        ]

        textToDraw.draw(at: CGPoint(x: 10, y: 10), withAttributes: attributes)
    }
}
