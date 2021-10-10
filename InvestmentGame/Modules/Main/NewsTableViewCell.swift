import UIKit

class NewsTableViewCell: UITableViewCell {
  let textLabel1 = UILabel()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setup()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure(news: Advice) {
    self.textLabel1.text = news.text
  }
  
  func setup() {
    contentView.addSubview(textLabel1)
    
    textLabel1.snp.makeConstraints { make in
      make.edges.equalToSuperview().inset(20)
    }
    
    textLabel1.numberOfLines = .zero
  }
  
}
