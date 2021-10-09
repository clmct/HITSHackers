//
//  ViewController2.swift
//  InvestmentGame
//
//  Created by Daniil on 09.10.2021.
//

import UIKit

class ViewController2: UIViewController {
    
    
    
    
    var currentLevel: Int!
    var userData: Int!
    
    @IBOutlet weak var romashka1description: UILabel!
    @IBOutlet weak var romashka2description: UILabel!
    @IBOutlet weak var romashkaTitleLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if currentLevel == nil {
            currentLevel = 0
        }
        if userData == nil {
            userData = 2
        }
        
        switch currentLevel {
        case 0:
            textLabel.text = "Вашей подруге Маше очень повезло. Совсем недавно она выиграла в лотерею! Маша не хочет ни на что тратиться, она твердо решила сохранить и даже приумножить доставшиеся ей деньги.\nК вам обратились за советом! Как вы считаете, стоит ли просто положить деньги на сберегательный счет в банке?"
            romashkaTitleLabel.text = "Сберегательный счет"
            romashka1description.text = "Звучит надежно"
            romashka2description.text = "Мало прибыли"
        case 1:
            textLabel.text = "У всех на слуху компания \"Ромашка\". Никто и подумать не мог, что за несколько лет ей удастся так взлететь! А ее генеральный директор вообще постит веселые твиты и с современным поколением на одной волне. Маша очень горит идеей приобрести акции данной компании, они кажутся ей самыми надежными. Все ведь закупают, чего тут медлить? Цена компании лишь продолжает расти с каждым днем, Маша вот-вот решится! Одобрили бы вы ее покупку?"
            romashkaTitleLabel.text = "Ромашка"
            romashka1description.text = "Очень популярна"
            romashka2description.text = "Возможен рост"
        case 2:
            textLabel.text = "В стране N началось бурное развитие промышленности. Государство всеми силами привлекает иностранные инвестиции, предлагая потенциально выгодные государственные облигации. Однако Машу эти бумажки не интересуют. Она считает, что доход с них почти ничем не отличается от дохода со вклада в банке, хотя и риск при этом выше. Лучше купить надежные акции компаний! Вы бы с ней согласились?"
            romashkaTitleLabel.text = "Гос. облигации"
            romashka1description.text = "Надежно"
            romashka2description.text = "Не так выгодно"
        default:
            break
        }
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    @IBAction func noWay(_ sender: Any) {
      let storyboard = UIStoryboard(name: "screen2", bundle: nil)
      let viewController = storyboard.instantiateViewController(withIdentifier: "viewController2") as? ViewController2
      viewController?.currentLevel = self.currentLevel + 1
        viewController?.userData = self.userData
        
        if currentLevel < 2 {
            self.navigationController?.pushViewController(viewController ?? UIViewController(), animated: true)
        } else {
            print(self.userData)
          let storyboard = UIStoryboard(name: "screen3", bundle: nil)
          let viewController = storyboard.instantiateViewController(withIdentifier: "viewController3") as? ViewController3
          self.navigationController?.pushViewController(viewController ?? UIViewController(), animated: true)
        }

    }
    
    @IBAction func ofCourse(_ sender: Any) {
      let storyboard = UIStoryboard(name: "screen2", bundle: nil)
      let viewController = storyboard.instantiateViewController(withIdentifier: "viewController2") as? ViewController2
        viewController?.currentLevel = self.currentLevel + 1
          viewController?.userData = self.userData + 1
        
        
        if currentLevel < 2 {
            self.navigationController?.pushViewController(viewController ?? UIViewController(), animated: true)
        } else {
            print(self.userData)
          let storyboard = UIStoryboard(name: "screen3", bundle: nil)
          let viewController = storyboard.instantiateViewController(withIdentifier: "viewController3") as? ViewController3
          self.navigationController?.pushViewController(viewController ?? UIViewController(), animated: true)
        }
    }
    
}
