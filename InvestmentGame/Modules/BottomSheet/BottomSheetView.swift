import UIKit

class BottomSheetView: UIViewController {
  let titleLabel = UILabel()
  let textLabel = UILabel()
  let button1 = UIButton()
  let button2 = UIButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(titleLabel)
    view.addSubview(textLabel)
    view.addSubview(button1)
    view.addSubview(button2)
    
    textLabel.text = "wedwe wewedwe wedwwedwe wedwwedwe wedwwwe wewedwe wedwwedwe wedwwedwe wedwwewe wewedwe wedwwedwe wedwwedwe wedwwewe wewedwe wedwwedwe wedwwedwe wedwwewe wewedwe wedwwedwe wedwwedwe wedwwewe wewedwe wedwwedwe wedwwedwe wedwweedwe wedwdw"
    
    titleLabel.snp.makeConstraints { make in
      make.top.leading.equalToSuperview().offset(20)
      make.trailing.equalToSuperview().inset(20)
      make.height.equalTo(50)
    }
    
    textLabel.snp.makeConstraints { make in
      make.top.equalTo(titleLabel.snp.bottom).offset(10)
      make.trailing.leading.equalToSuperview().inset(20)
    }
    
    button1.snp.makeConstraints { make in
      make.top.equalTo(textLabel.snp.bottom).offset(10)
      make.leading.equalToSuperview().inset(20)
      make.trailing.equalTo(view.snp.centerX).inset(10)
    }
    
    button2.snp.makeConstraints { make in
      make.top.equalTo(textLabel.snp.bottom).offset(10)
      make.trailing.equalToSuperview().inset(20)
      make.leading.equalTo(view.snp.centerX).offset(10)
    }
  }
}
