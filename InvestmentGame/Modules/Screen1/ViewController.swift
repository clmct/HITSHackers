//
//  ViewController.swift
//  InvestmentGame
//

import UIKit
import SnapKit
import Alamofire
import Kingfisher

class ViewController: UIViewController {
  
  let labelTitle = UILabel()
  let labelText = UILabel()
  let labelSuggestion = UILabel()
  let button = UIButton(type: .system)
  let button2 = UIButton(type: .system)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.setNavigationBarHidden(true, animated: false)
    view.backgroundColor = .white
    
    labelTitle.text = "Срочные новости!".uppercased()
    labelTitle.font = UIFont.systemFont(ofSize: 28, weight: .bold)
    
    labelText.text = "У всех на слуху компания \"Ромашка\". Никто и подумать не мог, что за несколько лет ей так удастся взлететь! А ее генеральный директор вообще постит веселые твиты и с современным поколением на одной волне. Цена компании продолжает расти, решайтесь! Вы ведь не упустите свой шанс купить акции компании и получить легкие деньги?"
    labelText.numberOfLines = 0
    labelText.font = UIFont.systemFont(ofSize: 18, weight: .regular)
    
    labelSuggestion.text = "Купить акцию?"
    
    button.setTitle("Конечно!", for: .normal)
    button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    button2.setTitle("Пожалуй, откажусь", for: .normal)
    button2.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    
    view.addSubview(labelTitle)
    
    view.addSubview(labelText)
    view.addSubview(labelSuggestion)
    view.addSubview(button)
    view.addSubview(button2)
    
    labelTitle.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalToSuperview().inset(40)
    }
    
    labelText.snp.makeConstraints { make in
      make.left.right.equalToSuperview().inset(25)
      make.top.equalTo(labelTitle.snp.bottom).inset(-50)
    }
    
    button.snp.makeConstraints {make in
      make.width.equalToSuperview().dividedBy(1.8)
      make.centerX.equalToSuperview().multipliedBy(1.5)
      make.bottom.equalToSuperview().inset(30)
    }
    
    button2.snp.makeConstraints {make in
      make.width.equalToSuperview().dividedBy(1.8)
      make.centerX.equalToSuperview().dividedBy(1.5)
      make.bottom.equalToSuperview().inset(30)
    }
    labelSuggestion.snp.makeConstraints{make in
      make.bottom.equalTo(button2.snp.top).inset(-20)
      make.centerX.equalToSuperview()
    }
    
    
  }
  
  @objc func buttonClicked(_ sender: AnyObject?) {
    if sender === button {
      print(1)
    } else if sender === button2 {
      print(2)
    }
  }
}

