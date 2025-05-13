import UIKit

class ViewController: UIViewController {

    // let captureView = KeyboardCaptureView()
    @IBOutlet weak var captureView: KeyboardCaptureView!
    let toggleButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        // カスタム入力ビュー
        captureView.backgroundColor = .white
        captureView.layer.borderWidth = 1
        captureView.layer.borderColor = UIColor.gray.cgColor
        captureView.placeholder = "パスワードを入力"

        // ボタン
        toggleButton.frame = CGRect(x: 30, y: 220, width: view.frame.width - 60, height: 44)
        toggleButton.setTitle("マスク切り替え", for: .normal)
        toggleButton.addTarget(self, action: #selector(toggleMask), for: .touchUpInside)
        view.addSubview(toggleButton)

        // キーボード表示
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.captureView.becomeFirstResponder()
        }
    }

    @objc func toggleMask() {
        captureView.isMasked.toggle()
        print("マスク状態: \(captureView.isMasked)")
    }
}
