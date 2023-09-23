import UIKit

final class ProfileModuleViewController: UIViewController {
    struct Model {
        let pushUnitHandler: (() -> Void)?
        let pushModuleHandler: (() -> Void)?
        let closeUnitOrModuleHandler: (() -> Void)?
        let popToRootHandler: (() -> Void)?
        let modalModuleHandler: (() -> Void)?
        let modalUnitHandler: (() -> Void)?
        let closeModalHandler: (() -> Void)?
    }

    private let model: Model

    init(model: Model) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }

    deinit {
        print("ViewController dealloc")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        navigationItem.title = "Profile"
    }
}
