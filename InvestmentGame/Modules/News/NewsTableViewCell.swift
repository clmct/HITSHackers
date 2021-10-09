import UIKit

class NewsTableViewCell: UITableViewCell {
  let text = UILabel()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setup()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure(news: Advice) {
    self.text.text = news.text
  }
  
  func setup() {
    contentView.addSubview(text)
    
    text.snp.makeConstraints { make in
      make.edges.equalToSuperview().inset(20)
    }
    
    text.numberOfLines = .zero
  }
  
}
