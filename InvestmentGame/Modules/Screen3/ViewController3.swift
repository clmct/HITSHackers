//
//  ViewController3.swift
//  InvestmentGame
//
//  Created by Daniil on 10.10.2021.
//

import UIKit

class ViewController3: UIViewController {
    @IBOutlet weak var textLabel: UILabel!
    
  var data: Int!
  
    @IBAction func go(_ sender: Any) {
//      NetworkService.shared.createUser(name: UUID().uuidString, investID: data) { result in
//            switch result {
//            case .success(let user):
//              UserDefaults.standard.set(user.id, forKey: "user")
//              print(result)
//
//            case .failure(_):
//              print("error")
//            }
//
//          }
      self.navigationController?.pushViewController(createTabBarController(), animated: true)
      
      DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
        self.navigationController?.present(BottomSheetView(), animated: true, completion: nil)
      }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
      
      if data == nil {
        data = 1
      }
        textLabel.text = "Маша благодарна вам за помощь! Мы уверены, что она учтет ваши советы при формировании своего портфеля.\n\nА что насчет вашего? Готовы ли вы собрать собственный инвестиционный портфель? Есть способ проверить! \n\nМы предлагаем вам специально подобранную под вас коллекцию ненастоящих ценных бумаг. Ваша цель - получить сбалансированный портфель к концу игры. Не беспокойтесь, на протяжении всего пути мы будем давать вам ценные советы и фидбэк на принятые решения. Ну что, готовы начать?"
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
