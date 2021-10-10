import UIKit
let day = 8
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
    
    view.backgroundColor = .white
    titleLabel.font = .boldSystemFont(ofSize: 24)
    textLabel.numberOfLines = .zero
    titleLabel.snp.makeConstraints { make in
      make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
      make.leading.equalToSuperview().offset(20)
      make.trailing.equalToSuperview().inset(20)
      make.height.equalTo(50)
    }
    
    titleLabel.font = .systemFont(ofSize: 20)
    textLabel.snp.makeConstraints { make in
      make.top.equalTo(titleLabel.snp.bottom).offset(10)
      make.trailing.leading.equalToSuperview().inset(20)
    }
    
    button1.snp.makeConstraints { make in
      make.top.equalTo(titleLabel.snp.bottom).offset(10)
      make.leading.equalToSuperview().inset(20)
      make.trailing.equalTo(view.snp.centerX).inset(10)
      make.height.equalTo(40)
    }
    
    button2.snp.makeConstraints { make in
      make.top.equalTo(textLabel.snp.bottom).offset(10)
      make.trailing.equalToSuperview().inset(20)
      make.leading.equalTo(view.snp.centerX).offset(10)
      make.height.equalTo(40)
    }
    
    button1.setTitle("Да", for: .normal)
    button2.setTitle("Нет", for: .normal)
    
    titleLabel.text = "Проблема Насти"
    textLabel.text = "Ваша подруга Анастасия давно хочет начать инвестировать, но она располагает довольно малым капиталом и готова вложить в ценные бумаги не более 15 тысяч. \r\n\r\nКак вы думаете, может ли Настя начать инвестировать?"
    
    configure()
    

  }
  
  func configure() {
    NetworkService.shared.getGameWeek(id: day) { result in
      switch result {
      case .success(let week):
        let testQuestions = week.testQuestions
        self.titleLabel.text = testQuestions.first?.name ?? "1"
        self.textLabel.text = testQuestions.first?.text ?? "2"
      case .failure(_):
        print("error")
      }
    }
  }
}
