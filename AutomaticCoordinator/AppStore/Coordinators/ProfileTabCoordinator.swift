final class ProfileTabCoordinator: BaseCoordinator {
    enum Deeplink {
        case initial
    }

    private let coordinatorFactory: CoordinatorFactoryProtocol
    private let moduleFactory: ModuleFactoryProtocol

    init(
        router: Routable,
        parent: BaseCoordinator,
        coordinatorFactory: CoordinatorFactoryProtocol,
        moduleFactory: ModuleFactoryProtocol
    ) {
        self.coordinatorFactory = coordinatorFactory
        self.moduleFactory = moduleFactory
        super.init(router: router, parent: parent)
    }
}

extension ProfileTabCoordinator: Coordinator {
    func start(with option: Deeplink) {
        switch option {
        case .initial: showInitial()
        }
    }
}

// MARK: - Navigation

extension ProfileTabCoordinator {
    func showInitial() {
        weak var wSelf = self
        let module = moduleFactory.makeProfileTabModuel(
            pushUnitHandler: {
                wSelf?.showUnit()
            },
            pushModuleHandler: {
                wSelf?.showModule()
            },
            modalModuleHandler: {
                wSelf?.presentModule()
            },
            modalUnitHandler: {
                wSelf?.openUnitModal()
            }
        )
        router.pushModule(module)
    }

    func showModule() {
        weak var wSelf = self
        let module = moduleFactory.makePushModule(
            pushUnitHandler: {
                wSelf?.showUnit()
            },
            pushModuleHandler: {
                wSelf?.showModule()
            },
            closeUnitOrModuleHandler: {
                wSelf?.router.closeModule()
            },
            popToRootHandler: {
                wSelf?.router.popToRootModule()
            },
            modalModuleHandler: {
                wSelf?.presentModule()
            },
            modalUnitHandler: {
                wSelf?.openUnitModal()
            }
        )

        router.pushModule(module)
    }

    func presentModule() {
        weak var wSelf = self
        let module = moduleFactory.makeSingleModalModule(
            modalModuleHandler: {
                wSelf?.presentModule()
            },
            closeModalHandler: {
                wSelf?.router.dismissModule()
            }
        )

        router.presentModule(module, presentationStyle: .automatic)
    }

    func showUnit() {
        let coordinator = coordinatorFactory.makeProfileCoordinator(router: router, parent: self)
        coordinator.start()
    }

    func openUnitModal() {
        let unit = coordinatorFactory.makeModalPrototypeCoordinator(parent: self)
        unit.coordinator.start()
        router.presentModule(unit.view, presentationStyle: .automatic)
    }
}
