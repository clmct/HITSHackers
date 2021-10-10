import UIKit

class CustomTabBatController: UITabBarController {
  override func viewDidLayoutSubviews() {
      super.viewWillLayoutSubviews()

      tabBar.frame.size.height = 75
      tabBar.frame.origin.y = view.frame.height - 75
  }
}

func createTabBarController() -> UITabBarController {
  let tabBar = CustomTabBatController()
  
  let viewController1 = StocksViewController()
  let viewController2 = NewsViewController()
  let viewController3 = NewsViewController()
  
  tabBar.tabBar.unselectedItemTintColor = UIColor(named: "unselected")
  
  tabBar.tabBar.barTintColor = .white
  tabBar.tabBar.isTranslucent = false
  
  tabBar.tabBar.itemPositioning = .centered
  
  tabBar.tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
  tabBar.tabBar.layer.shadowRadius = 2
  tabBar.tabBar.layer.shadowColor = UIColor.black.cgColor
  tabBar.tabBar.layer.shadowOpacity = 0.3
  
  tabBar.viewControllers = [viewController1, viewController2, viewController3]
  
  let button = UIButton()
  
  button.setImage(UIImage(named: "main"), for: .normal)
  button.setImage(UIImage(named: "mainSelected"), for: .highlighted)
  button.sizeToFit()
  button.translatesAutoresizingMaskIntoConstraints = false
  button.adjustsImageWhenHighlighted = false


  tabBar.tabBar.addSubview(button)
  tabBar.tabBar.layoutIfNeeded()
  button.snp.makeConstraints { make in
    make.centerY.equalToSuperview().offset(-15)
    make.centerX.equalToSuperview()
  }
//  tabBar.tabBar.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true
//  tabBar.tabBar.topAnchor.constraint(equalTo: button.centerYAnchor).isActive = true
  
  tabBar.tabBar.items?[1].isEnabled = false
  
  
  //tabBar.tabBar.items?[1].image = UIImage(named: "main")
  //tabBar.tabBar.items?[1].selectedImage = UIImage(named: "main")
  
 // tabBar.tabBar.items?[0].title = "Stocks"
  tabBar.tabBar.items?[0].image = UIImage(named: "home")
  tabBar.tabBar.items?[0].selectedImage = UIImage(named: "homePicked")
  
  tabBar.tabBar.items?[2].image = UIImage(named: "spravka")
  tabBar.tabBar.items?[2].selectedImage = UIImage(named: "spravkaPicked")
  //tabBar.tabBar.items?[1].title = "News"
  return tabBar
}
