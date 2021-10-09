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
    
    
    @IBOutlet var allLabels: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.adjustsFontSizeToFitWidth = true
        textLabel.minimumScaleFactor = 0.5
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        textLabel.text = "Добро пожаловать в нашу игру! В ней Вам предстоит познакомиться с инвестициями и дорогой в светлое будущее с пассивным доходом. \n\nГотовы начать?"
        
        self.view.layoutIfNeeded()
        var flag = false
        var i = 0
        for label in allLabels {
            flag = !flag
            self.view.layoutIfNeeded()
            
            if flag {
                label.snp.makeConstraints { make in
                    make.left.equalTo(self.view.snp.right)
                    make.top.equalToSuperview().inset(i*40 + 40)
                }
            } else {
                label.snp.makeConstraints { make in
                    make.right.equalTo(self.view.snp.left)
                    make.top.equalToSuperview().inset(i*40 + 40)
                }
            }
            
            i += 1
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.layoutIfNeeded()
        
        UIView.animate(withDuration: 5.0, delay: 1.5, options: [.repeat, .autoreverse], animations: {
            self.view.layoutIfNeeded()
            var flag = false
            var i = 0
            for label in self.allLabels {
                flag = !flag
                self.view.layoutIfNeeded()
                
                if flag {
                    label.snp.remakeConstraints { make in
                        make.right.equalTo(self.view.snp.left)
                        make.top.equalToSuperview().inset(i*40 + 40)
                    }
                } else {
                    label.snp.remakeConstraints { make in
                        make.left.equalTo(self.view.snp.right)
                        make.top.equalToSuperview().inset(i*40 + 40)
                    }
                }
                
                i += 1
            }
            
        })
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    @IBAction func pressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "screen2", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "viewController2") as? ViewController2
        self.navigationController?.pushViewController(viewController ?? UIViewController(), animated: true)
    }
    
}

