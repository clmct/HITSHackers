import UIKit

struct Stock {
  var title: String
  var icon: String
  var price: Int
  var count: Int
  var change: Int
}

class StockTableViewCell: UITableViewCell {
  let icon = UIImageView()
  let title = UILabel()
  let desc = UILabel()
  let change = UILabel()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setup()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure(stock: Stock) {
    self.title.text = stock.title
    self.icon.kf.setImage(with: URL(string: stock.icon))
    self.desc.text = "\(stock.price)Р | \(stock.price) акций"
    self.change.text = "\(stock.change)%"
    
    if stock.change > 0 {
      change.textColor = .green
    } else if stock.change < 0 {
      change.textColor = .red
    } else {
      change.textColor = .black
    }
    
  }
  
  func setup() {
    contentView.addSubview(title)
    contentView.addSubview(icon)
    contentView.addSubview(desc)
    contentView.addSubview(change)

    icon.snp.makeConstraints { make in
      make.leading.equalToSuperview().offset(20)
      make.top.bottom.equalToSuperview().inset(10)
      make.size.equalTo(60)
    }
    
    title.snp.makeConstraints { make in
      make.leading.equalTo(icon.snp.trailing).offset(10)
      make.trailing.equalToSuperview().inset(70)
      make.top.equalToSuperview().offset(10)
    }
    
    title.adjustsFontSizeToFitWidth = true
    title.minimumScaleFactor = 0.3
    title.textAlignment = .left
    
    desc.snp.makeConstraints { make in
      make.top.equalTo(title.snp.bottom).offset(4)
      make.leading.equalTo(title)
      make.trailing.equalToSuperview().inset(20)
    }
    
    change.snp.makeConstraints { make in
      make.trailing.equalToSuperview().inset(20)
      make.centerY.equalTo(title)
    }
    
    desc.textAlignment = .left
    change.textAlignment = .left
    
    
    title.font = .systemFont(ofSize: 30)
    desc.font = .systemFont(ofSize: 12)
    change.font = .boldSystemFont(ofSize: 18)
    
    desc.textColor = .lightGray
  }
  
}
