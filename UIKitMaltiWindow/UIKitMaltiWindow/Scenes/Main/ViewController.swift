import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel()
        label.text = "Text"
        label.translatesAutoresizingMaskIntoConstraints = false

        let uiView = UIView()
        uiView.backgroundColor = .red
        uiView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(uiView)
        view.addSubview(label)
        NSLayoutConstraint.activate([
//            uiView.topAnchor.constraint(equalTo: view.layoutGuide(for: .margins(cornerAdaptation: .vertical)).topAnchor),
//            uiView.leadingAnchor.constraint(equalTo: view.layoutGuide(for: .margins(cornerAdaptation: .horizontal)).leadingAnchor),
//            uiView.trailingAnchor.constraint(equalTo: view.layoutGuide(for: .margins(cornerAdaptation: .horizontal)).trailingAnchor),
//            uiView.bottomAnchor.constraint(equalTo: view.layoutGuide(for: .margins(cornerAdaptation: .vertical)).bottomAnchor),

//            uiView.topAnchor.constraint(equalTo: view.layoutGuide(for: .safeArea(cornerAdaptation: .vertical)).topAnchor),
//            uiView.leadingAnchor.constraint(equalTo: view.layoutGuide(for: .safeArea(cornerAdaptation: .horizontal)).leadingAnchor),
//            uiView.trailingAnchor.constraint(equalTo: view.layoutGuide(for: .safeArea(cornerAdaptation: .horizontal)).trailingAnchor),
//            uiView.bottomAnchor.constraint(equalTo: view.layoutGuide(for: .safeArea(cornerAdaptation: .vertical)).bottomAnchor),

            uiView.topAnchor.constraint(equalTo: view.layoutGuide(for: .readableContent(cornerAdaptation: .vertical)).topAnchor),
            uiView.leadingAnchor.constraint(equalTo: view.layoutGuide(for: .readableContent(cornerAdaptation: .horizontal)).leadingAnchor),
            uiView.trailingAnchor.constraint(equalTo: view.layoutGuide(for: .readableContent(cornerAdaptation: .horizontal)).trailingAnchor),
            uiView.bottomAnchor.constraint(equalTo: view.layoutGuide(for: .readableContent(cornerAdaptation: .vertical)).bottomAnchor),

            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            label.leadingAnchor.constraint(equalTo: view.layoutGuide(for: .margins(cornerAdaptation: .horizontal)).leadingAnchor),
//            label.leadingAnchor.constraint(equalTo: view.layoutGuide(for: .safeArea(cornerAdaptation: .horizontal)).leadingAnchor),
        ])

        NSLayoutConstraint.activate([
            uiView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            uiView.leadingAnchor.constraint(equalTo: view.layoutGuide(for: .safeArea(cornerAdaptation: .horizontal)).leadingAnchor),
        ])
    }
}

