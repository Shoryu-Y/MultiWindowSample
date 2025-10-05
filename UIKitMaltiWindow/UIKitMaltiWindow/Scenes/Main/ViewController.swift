import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBlue

        let safeAreaView = UIView()
        safeAreaView.backgroundColor = .white
        safeAreaView.translatesAutoresizingMaskIntoConstraints = false

        let uiView = UIView()
        uiView.backgroundColor = .systemRed
        uiView.translatesAutoresizingMaskIntoConstraints = false

        let redRectangle = ColorRectangle(color: .systemRed)
        let blueRectangle = ColorRectangle(color: .systemBlue)

        let label1 = UILabel()
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.text = "ウインドウコントロール"
        label1.font = .systemFont(ofSize: 32)

        let label2 = UILabel()
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.text = "セーフエリア外"
        label2.font = .systemFont(ofSize: 32)

        let stackView = UIStackView(arrangedSubviews: [redRectangle, label1, UIView()])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8

        let stackView2 = UIStackView(arrangedSubviews: [blueRectangle, label2, UIView()])
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        stackView2.axis = .horizontal
        stackView2.spacing = 8

        view.addSubview(safeAreaView)
        view.addSubview(uiView)
        view.addSubview(stackView)
        view.addSubview(stackView2)

        NSLayoutConstraint.activate(
            [
                safeAreaView.topAnchor.constraint(equalTo: view.layoutGuide(for: .safeArea()).topAnchor),
                safeAreaView.leadingAnchor.constraint(equalTo: view.layoutGuide(for: .safeArea()).leadingAnchor),
                safeAreaView.trailingAnchor.constraint(equalTo: view.layoutGuide(for: .safeArea()).trailingAnchor),
                safeAreaView.bottomAnchor.constraint(equalTo: view.layoutGuide(for: .safeArea()).bottomAnchor),

                uiView.topAnchor.constraint(equalTo: view.topAnchor),
                uiView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                uiView.trailingAnchor.constraint(equalTo: view.layoutGuide(for: .safeArea(cornerAdaptation: .horizontal)).leadingAnchor),
                uiView.bottomAnchor.constraint(equalTo: view.layoutGuide(for: .safeArea(cornerAdaptation: .vertical)).topAnchor),

                stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),

                stackView2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                stackView2.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                stackView2.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            ]
        )
    }
}

#Preview {
    ViewController(nibName: nil, bundle: nil)
}

final class ColorRectangle: UIView {
    let color: UIColor
    let size: CGSize

    init(color: UIColor, size: CGSize = .init(width: 50, height: 50)) {
        self.color = color
        self.size = size
        super.init(frame: .null)

        backgroundColor = color
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        size
    }
}
