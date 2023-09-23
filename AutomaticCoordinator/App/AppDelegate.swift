import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AnyCoordinator<Void>?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        AutomaticCoordinatorConfiguration.enabledDebugLog(true)

        setupAppearance()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        let rootViewController = SystemNavigationController(hideNavigationBar: true)
        window?.rootViewController = rootViewController

        let appCoordinator = CoordinatorFactory.shared.makeApplicationCoordinator(
            router: ApplicationRouter(rootController: rootViewController)
        )

        appCoordinator.start()
        self.appCoordinator = appCoordinator
        return true
    }
}

func setupAppearance() {
    UITabBar.appearance().barTintColor = .customMint
    UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor.clear], for: .normal)
    UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor.clear], for: .normal)

    UINavigationBar.appearance().barTintColor = .customMint
    UINavigationBar.appearance().tintColor = .white
    UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor.white]
}
