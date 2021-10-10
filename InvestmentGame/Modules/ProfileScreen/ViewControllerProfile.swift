//
//  ViewControllerProfile.swift
//  InvestmentGame
//
//  Created by Daniil on 10.10.2021.
//

import UIKit
import Kingfisher

struct ProfileData123 {
  var text: String
  var icon: Bool
}

class CustomCellForProfile: UITableViewCell {
  let icon = UIImageView()
  let textLabel1 = UILabel()
  

    
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setup()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure(stock: ProfileData123) {
    
    if stock.icon {
      icon.image = UIImage(named: "goodReview")
    } else {
      icon.image = UIImage(named: "badReview")
    }
    
    self.textLabel1.text = stock.text
    
  }
  
  func setup() {
    contentView.addSubview(icon)
    contentView.addSubview(textLabel1)

    textLabel1.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
    textLabel1.numberOfLines = 0
    textLabel1.adjustsFontSizeToFitWidth = true
    textLabel1.minimumScaleFactor = 0.3
    textLabel1.textAlignment = .left
    
    icon.snp.makeConstraints { make in
        make.edges.equalToSuperview().inset(10)
    }
    
    textLabel1.snp.makeConstraints { make in
        make.top.bottom.right.equalToSuperview().inset(30)
      make.left.equalToSuperview().inset(50)
    }
    

  }
  
}

class ViewControllerProfile: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  var actualData: [ProfileData123]?
  
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
  let dummies: [ProfileData123] = {
    var dummies: [ProfileData123] = []
    for i in 0...3 {
      dummies.append(ProfileData123(text: "Акции не являются хорошимвыбором при предпочтениистабильных инструментов.Вам стоило посоветовать другу облигации. ", icon: false))
    }
    
    for i in 0...3 {
      dummies.append(ProfileData123(text: "Вы посоветовали другу действительно подходящий инструмент и помогли ему немного заработать.", icon: true))
    }
    return dummies
    
  }()
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      if let safeData = actualData {
        return safeData.count
      }
      return dummies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCellForProfile") as? CustomCellForProfile else {
        return UITableViewCell()
      }
      
      if let safeData = actualData {
        let data = safeData[indexPath.row]
          cell.configure(stock: ProfileData123(text: data.text, icon: data.icon))
        
      } else {
        let data = dummies[indexPath.row]
          cell.configure(stock: ProfileData123(text: data.text, icon: data.icon))
      }
      
      

      return cell
    
    }
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
      tableView.register(CustomCellForProfile.self, forCellReuseIdentifier: "CustomCellForProfile")
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
