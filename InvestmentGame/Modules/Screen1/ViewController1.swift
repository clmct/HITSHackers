//
//  ViewController.swift
//  InvestmentGame
//

import UIKit
import SnapKit
import Alamofire
import Kingfisher

class ViewController1: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet var welcomeLabelsOnRight: [UILabel]!
    
    @IBOutlet var welcomeLabelsOnLeft: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        navigationController?.navigationBar.barStyle = .black
      
        textLabel.text = "Добро пожаловать в нашу игру! В ней Вам предстоит познакомиться с инвестициями и дорогой в светлое будущее с пассивным доходом. \n\nГотовы начать?"
        
        var i = 0
        var j = 0
        for label in welcomeLabelsOnRight {
            
            label.snp.makeConstraints { make in
                make.left.equalTo(view.snp.right)
                make.top.equalToSuperview().inset(i*40 + 40)
            }
            i += 1
            guard j < welcomeLabelsOnLeft.count else {
                break
            }
            
            let label2 = welcomeLabelsOnLeft[j]
            
            label2.snp.makeConstraints { make in
                make.right.equalTo(view.snp.left)
                make.top.equalToSuperview().inset(i*40 + 40)
            }
            j += 1
            i += 1
            
        }
        
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIView.animate(withDuration: 5.0, delay: 2, options: [.repeat, .autoreverse], animations: {
            
            var i = 0
            var j = 0
            for label in self.welcomeLabelsOnRight {
                self.view.layoutIfNeeded()
                label.snp.remakeConstraints { make in
                    make.right.equalTo(self.view.snp.left)
                    make.top.equalToSuperview().inset(i*40 + 40)
                }
                i += 1
                guard j < self.welcomeLabelsOnLeft.count else {
                    break
                }
                
                let label2 = self.welcomeLabelsOnLeft[j]
                
                label2.snp.remakeConstraints { make in
                    make.left.equalTo(self.view.snp.right)
                    make.top.equalToSuperview().inset(i*40 + 40)
                }
                j += 1
                i += 1
                
            }
            
        })
    }
    
    
}

