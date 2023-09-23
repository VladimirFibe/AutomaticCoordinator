final class TabBarCoordinator: BaseCoordinator {

	enum Deeplink {
		case initial
	}

	private let coordinatorFactory: CoordinatorFactoryProtocol
	private let transitionFactory: TransitionFactory
	private let tabBarManager: TabBarManagerProtocol

	init(
		router: Routable,
		parent: BaseCoordinator,
		coordinatorFactory: CoordinatorFactoryProtocol,
		transitionFactory: TransitionFactory,
		tabBarManager: TabBarManagerProtocol
	) {
		self.coordinatorFactory = coordinatorFactory
		self.transitionFactory = transitionFactory
		self.tabBarManager = tabBarManager
		super.init(router: router, parent: parent)
	}
}

extension TabBarCoordinator: Coordinator {
	func start(with option: Deeplink) {
		tabBarManager.delegate = self
		prepareTabs()
	}
}

extension TabBarCoordinator: TabBarManagerDelegate {
	func repeatedTap(tab: Tab) {
		print(#function)
	}

	func didSelectTab(tab: Tab) {
		print(#function)
	}
}

// MARK: - Navigation

private extension TabBarCoordinator {
	func prepareTabs() {
		tabBarManager.setPresentable([
			makeHome(),
            makeProfile()
		])
		router.setRootModule(tabBarManager.tabBarPresentable, transition: transitionFactory.custom)
	}

    func makeHome() -> Presentable {
        let unit = coordinatorFactory.makePrototypeTabCoordinator(parent: self, tab: .home)
        unit.coordinator.start(with: .initial)
        return unit.view
    }

    func makeProfile() -> Presentable {
        let unit = coordinatorFactory.makeProfileTabCoordinator(parent: self, tab: .profile)
        unit.coordinator.start(with: .initial)
        return unit.view
    }
}
