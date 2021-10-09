//
//  SceneDelegate.swift
//  InvestmentGame
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let scene = (scene as? UIWindowScene) else { return }
    window = UIWindow(windowScene: scene)
    
    
    let storyboard = UIStoryboard(name: "screen1", bundle: nil)
    let viewController = storyboard.instantiateViewController(withIdentifier: "viewController1") as? ViewController1
    window?.rootViewController = UINavigationController(rootViewController: createTabBarController())
    window?.makeKeyAndVisible()
    
    guard let _ = UserDefaults.standard.string(forKey: "user") else {
      return
    }
    NetworkService.shared.createUser(name: UUID().uuidString) { result in
      switch result {
      case .success(let user):
        UserDefaults.standard.set(user.id, forKey: "user")
      case .failure(_):
        print("error")
      }
    }
  }
}

