import UIKit

class BottomSheetView: UIViewController {
  let titleLabel = UILabel()
  let textLabel = UILabel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(titleLabel)
    view.addSubview(textLabel)
    
    
    titleLabel.snp.makeConstraints { make in
      make.top.leading.equalToSuperview().offset(20)
      make.trailing.equalToSuperview().inset(20)
      make.height.equalTo(50)
    }
    
    textLabel.snp.makeConstraints { make in
      make.top.equalTo(titleLabel.snp.bottom).offset(10)
      make.trailing.leading.equalToSuperview().inset(20)
    }
  }
}
