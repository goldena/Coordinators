//
//  SceneDelegate.swift
//  Onboarding&Login
//
//  Created by Denis Goloborodko on 23.09.21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    // MARK: - Root properties
    
    var loginCoordinator: Coordinator?
    
    func composeApp() {
        let page1 = UIViewController()
        let page2 = UIViewController()
        let page3 = UIViewController()
        
        page1.view.backgroundColor = .blue
        page2.view.backgroundColor = .yellow
        page3.view.backgroundColor = .gray
        
        lazy var onboardingViewController = OnboardingViewController(pages: page1, page2, page3)
        
        lazy var signupViewController = SignupController(ViewType: SignupView.self)
        lazy var loginViewController = LoginViewController(ViewType: LoginView.self)
        lazy var tableViewController = TableViewController(ViewType: TableView.self)
        
        loginCoordinator = Coordinator(rootViewController: tableViewController, otherViewControllers: loginViewController, signupViewController)
    }
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        // MARK: - Composition Root
        composeApp()
                
        window?.rootViewController = loginCoordinator?.rootViewController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }

}

