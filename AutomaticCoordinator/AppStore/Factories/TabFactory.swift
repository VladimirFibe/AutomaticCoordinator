import UIKit

protocol TabFactoryProtocol {
	func makeBarItem(for tab: Tab) -> UITabBarItem
}

final class TabFactory: TabFactoryProtocol {
	func makeBarItem(for tab: Tab) -> UITabBarItem {
		return UITabBarItem(rootTab: tab)
	}
}

private extension UITabBarItem {
	convenience init(rootTab: Tab) {
		self.init(
			title: nil,
			image: rootTab.info.normalImage,
			selectedImage: rootTab.info.selectedImage
		)
	}
}
