protocol CoordinatorFactoryProtocol: AnyObject {
	func makeApplicationCoordinator(router: Routable) -> AnyCoordinator<Void>

	func makeTabBarCoordinator(router: Routable, parent: BaseCoordinator) -> AnyCoordinator<TabBarCoordinator.Deeplink>

	func makePrototypeTabCoordinator(parent: BaseCoordinator, tab: Tab)
	-> (view: Presentable, coordinator: AnyCoordinator<PrototypeTabCoordinator.Deeplink>)

	func makePrototypeCoordinator(router: Routable, parent: BaseCoordinator) -> AnyCoordinator<Void>
	func makeModalPrototypeCoordinator(parent: BaseCoordinator) -> (view: Presentable, coordinator: AnyCoordinator<Void>)
}

final class CoordinatorFactory: CoordinatorFactoryProtocol {
	static let shared = CoordinatorFactory()
	let tabFactory = TabFactory()
	private init() {}

	func makeApplicationCoordinator(router: Routable) -> AnyCoordinator<Void> {
		return AnyCoordinator(ApplicationCoordinator(router: router, coordinatorFactory: self))
	}

	func makeTabBarCoordinator(router: Routable, parent: BaseCoordinator) -> AnyCoordinator<TabBarCoordinator.Deeplink> {
		let tabbarController = SystemTabBarController()
		let tabbarManager = TabBarManager(tabBar: tabbarController)
		return AnyCoordinator(
			TabBarCoordinator(
				router: router,
				parent: parent,
				coordinatorFactory: self,
				transitionFactory: TransitionFactory.shared,
				tabBarManager: tabbarManager
			)
		)
	}

	func makePrototypeTabCoordinator(parent: BaseCoordinator, tab: Tab)
	-> (view: Presentable, coordinator: AnyCoordinator<PrototypeTabCoordinator.Deeplink>) {
		let navigation = SystemNavigationController(hideNavigationBar: false)
		navigation.tabBarItem = tabFactory.makeBarItem(for: tab)
		let router = ApplicationRouter(rootController: navigation)
		let coordinator = AnyCoordinator(
			PrototypeTabCoordinator(
				router: router,
				parent: parent,
				coordinatorFactory: self,
				moduleFactory: ModuleFactory.shared
			)
		)
		return (navigation, coordinator)
	}

	func makePrototypeCoordinator(router: Routable, parent: BaseCoordinator) -> AnyCoordinator<Void> {
		return AnyCoordinator(
			PrototypeCoordinator(
				router: router,
				parent: parent,
				coordinatorFactory: self,
				moduleFactory: ModuleFactory.shared
			)
		)
	}

	func makeModalPrototypeCoordinator(parent: BaseCoordinator) -> (view: Presentable, coordinator: AnyCoordinator<Void>) {
		let navigation = SystemNavigationController(hideNavigationBar: false)
		let router = ApplicationRouter(rootController: navigation)
		let coordinator = AnyCoordinator(
			PrototypeCoordinator(
				router: router,
				parent: parent,
				coordinatorFactory: self,
				moduleFactory: ModuleFactory.shared
			)
		)
		return (navigation, coordinator)
	}
}
