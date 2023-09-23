final class ModuleFactory: ModuleFactoryProtocol {
	static let shared = ModuleFactory()
	private init() {}

	func makeTabModule(
		pushUnitHandler: @escaping () -> Void,
		pushModuleHandler: @escaping () -> Void,
		modalModuleHandler: @escaping () -> Void,
		modalUnitHandler: @escaping () -> Void
	) -> Presentable {
		return PrototypeModuleViewController(
			model: .init(
				pushUnitHandler: pushUnitHandler,
				pushModuleHandler: pushModuleHandler,
				closeUnitOrModuleHandler: nil,
				popToRootHandler: nil,
				modalModuleHandler: modalModuleHandler,
				modalUnitHandler: modalUnitHandler,
				closeModalHandler: nil
			)
		)
	}

    func makeProfileTabModuel(
        pushUnitHandler: @escaping () -> Void,
        pushModuleHandler: @escaping () -> Void,
        modalModuleHandler: @escaping () -> Void,
        modalUnitHandler: @escaping () -> Void
    ) -> Presentable {
        return ProfileModuleViewController(
            model: .init(
                pushUnitHandler: pushUnitHandler,
                pushModuleHandler: pushModuleHandler,
                closeUnitOrModuleHandler: nil,
                popToRootHandler: nil,
                modalModuleHandler: modalModuleHandler,
                modalUnitHandler: modalUnitHandler,
                closeModalHandler: nil
            )
        )
    }

	func makePushModule(
		pushUnitHandler: @escaping () -> Void,
		pushModuleHandler: @escaping () -> Void,
		closeUnitOrModuleHandler: @escaping () -> Void,
		popToRootHandler: @escaping () -> Void,
		modalModuleHandler: @escaping () -> Void,
		modalUnitHandler: @escaping () -> Void
	) -> Presentable {
		return PrototypeModuleViewController(
			model: .init(
				pushUnitHandler: pushUnitHandler,
				pushModuleHandler: pushModuleHandler,
				closeUnitOrModuleHandler: closeUnitOrModuleHandler,
				popToRootHandler: popToRootHandler,
				modalModuleHandler: modalModuleHandler,
				modalUnitHandler: modalUnitHandler,
				closeModalHandler: nil
			)
		)
	}

	func makePrototypeModule(
		pushUnitHandler: @escaping () -> Void,
		pushModuleHandler: @escaping () -> Void,
		closeUnitOrModuleHandler: @escaping () -> Void,
		popToRootHandler: @escaping () -> Void,
		modalModuleHandler: @escaping () -> Void,
		modalUnitHandler: @escaping () -> Void,
		closeModalHandler: @escaping () -> Void
	) -> Presentable {
		return PrototypeModuleViewController(
			model: .init(
				pushUnitHandler: pushUnitHandler,
				pushModuleHandler: pushModuleHandler,
				closeUnitOrModuleHandler: closeUnitOrModuleHandler,
				popToRootHandler: popToRootHandler,
				modalModuleHandler: modalModuleHandler,
				modalUnitHandler: modalUnitHandler,
				closeModalHandler: closeModalHandler
			)
		)
	}

    func makeProfileModule(
        pushUnitHandler: @escaping () -> Void,
        pushModuleHandler: @escaping () -> Void,
        closeUnitOrModuleHandler: @escaping () -> Void,
        popToRootHandler: @escaping () -> Void,
        modalModuleHandler: @escaping () -> Void,
        modalUnitHandler: @escaping () -> Void,
        closeModalHandler: @escaping () -> Void
    ) -> Presentable {
        return ProfileModuleViewController(
            model: .init(
                pushUnitHandler: pushUnitHandler,
                pushModuleHandler: pushModuleHandler,
                closeUnitOrModuleHandler: closeUnitOrModuleHandler,
                popToRootHandler: popToRootHandler,
                modalModuleHandler: modalModuleHandler,
                modalUnitHandler: modalUnitHandler,
                closeModalHandler: closeModalHandler
            )
        )
    }

	func makeSingleModalModule(
		modalModuleHandler: @escaping () -> Void,
		closeModalHandler: @escaping () -> Void
	) -> Presentable {
		return PrototypeModuleViewController(
			model: .init(
				pushUnitHandler: nil,
				pushModuleHandler: nil,
				closeUnitOrModuleHandler: nil,
				popToRootHandler: nil,
				modalModuleHandler: modalModuleHandler,
				modalUnitHandler: nil,
				closeModalHandler: closeModalHandler
			)
		)
	}
}

protocol ModuleFactoryProtocol: AnyObject {
	func makeTabModule(
		pushUnitHandler: @escaping () -> Void,
		pushModuleHandler: @escaping () -> Void,
		modalModuleHandler: @escaping () -> Void,
		modalUnitHandler: @escaping () -> Void
	) -> Presentable

	func makePushModule(
		pushUnitHandler: @escaping () -> Void,
		pushModuleHandler: @escaping () -> Void,
		closeUnitOrModuleHandler: @escaping () -> Void,
		popToRootHandler: @escaping () -> Void,
		modalModuleHandler: @escaping () -> Void,
		modalUnitHandler: @escaping () -> Void
	) -> Presentable

	func makePrototypeModule(
		pushUnitHandler: @escaping () -> Void,
		pushModuleHandler: @escaping () -> Void,
		closeUnitOrModuleHandler: @escaping () -> Void,
		popToRootHandler: @escaping () -> Void,
		modalModuleHandler: @escaping () -> Void,
		modalUnitHandler: @escaping () -> Void,
		closeModalHandler: @escaping () -> Void
	) -> Presentable

	func makeSingleModalModule(
		modalModuleHandler: @escaping () -> Void,
		closeModalHandler: @escaping () -> Void
	) -> Presentable

    func makeProfileTabModuel(
        pushUnitHandler: @escaping () -> Void,
        pushModuleHandler: @escaping () -> Void,
        modalModuleHandler: @escaping () -> Void,
        modalUnitHandler: @escaping () -> Void
    ) -> Presentable

    func makeProfileModule(
        pushUnitHandler: @escaping () -> Void,
        pushModuleHandler: @escaping () -> Void,
        closeUnitOrModuleHandler: @escaping () -> Void,
        popToRootHandler: @escaping () -> Void,
        modalModuleHandler: @escaping () -> Void,
        modalUnitHandler: @escaping () -> Void,
        closeModalHandler: @escaping () -> Void
    ) -> Presentable
}
