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
    window?.rootViewController = UINavigationController(rootViewController: viewController ?? UIViewController())
    window?.makeKeyAndVisible()
    
    print(UserDefaults.standard.integer(forKey: "id"))
    if UserDefaults.standard.integer(forKey: "id") == 0 {
      
      NetworkService.shared.createUser(name: "User", investID: 3) { result in
        switch result {
        case .success(let user):
          print(user.id)
          UserDefaults.standard.set(user.id, forKey: "id")
        case .failure(_):
          print("error")
        }
      }
    }
    
  }
}

let userId = UserDefaults.standard.integer(forKey: "id")
