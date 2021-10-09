import UIKit

func createTabBarController() -> UITabBarController {
  let tabBar = UITabBarController()
  
  let viewController1 = StocksViewController()
  let viewController2 = NewsViewController()
  
  tabBar.viewControllers = [viewController1, viewController2]
  tabBar.tabBar.items?[0].title = "Stocks"
  tabBar.tabBar.items?[1].title = "News"
  return tabBar
}
