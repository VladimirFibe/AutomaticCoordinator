final class ProfileCoordinator: BaseCoordinator {
    private let moduleFactory: ModuleFactoryProtocol
    private let coordinatorFactory: CoordinatorFactoryProtocol

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

extension ProfileCoordinator: Coordinator {
    func start(with option: Void) {
        showInital()
    }
}

// MARK: - Navigation

private extension ProfileCoordinator {
    func showInital() {
        weak var wSelf = self
        let module = moduleFactory.makeProfileModule(
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
            },
            closeModalHandler: {
                wSelf?.router.dismissModule()
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
                wSelf?.router.closeModule()
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
        router.presentModule(unit.view)
    }
}
