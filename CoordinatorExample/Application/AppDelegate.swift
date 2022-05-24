import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    var appRootCoordinator: AppRootCoordinator?
//    var coordinator: MasterCoordinatorable?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let navigationController = UINavigationController()

        appRootCoordinator = AppRootCoordinator(
            navigationController: navigationController
        )
        appRootCoordinator?.start()
        window = UIWindow()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
}

