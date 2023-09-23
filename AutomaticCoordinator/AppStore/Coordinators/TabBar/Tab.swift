import UIKit

enum Tab: Int, CaseIterable {
	case home = 0
    case profile

	var info: TabItemInfo {
		switch self {
        case .home: return .init(
            normalImage: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )
        case .profile: return .init(
            normalImage: UIImage(systemName: "person"),
            selectedImage: UIImage(systemName: "person.fill"))
        }
	}

	struct TabItemInfo {
		let normalImage: UIImage?
		let selectedImage: UIImage?
	}
}
