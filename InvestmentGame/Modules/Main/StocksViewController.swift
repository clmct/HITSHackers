import UIKit
import FittedSheets

class StocksViewController: UIViewController {
  let child = NewsViewController()
  let tableView = UITableView()
  var instruments: [UserInstrument]? = []
  var selectedInstrument = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //
    view.addSubview(child.view)
    addChild(child)
    child.didMove(toParent: self)
    child.view.snp.makeConstraints { make in
      make.top.leading.trailing.equalToSuperview()
      make.bottom.equalTo(view.snp.centerY)
    }
    
    
    //
    view.backgroundColor = .white
    setup()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(StockTableViewCell.self, forCellReuseIdentifier: "StockTableViewCell")
    
    NetworkService.shared.getUser(id: userId) { result in
      switch result {
      case .success(let result):
        let instruments = result.userInstruments
        self.instruments = instruments
        self.tableView.reloadData()
      case .failure:
        print("error")
      }
    }
  }
      
  func setup() {
    view.addSubview(tableView)
    tableView.snp.makeConstraints { make in
      make.leading.trailing.bottom.equalToSuperview()
      make.top.equalTo(child.view.snp.bottom)
    }
  }
}

extension StocksViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    instruments?.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "StockTableViewCell") as? StockTableViewCell else {
      return UITableViewCell()
    }
    
    if let instrument = instruments?[indexPath.row].instrument {
      cell.configure(stock: Stock(title: instrument.name,
                                icon: instrument.imageURL,
                                price: instrument.basePrice,
                                count: instrument.baseAmount,
                                change: instruments?[indexPath.row].priceChanged ?? 0))
  }
    return cell
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "?????? ??????????????????????"
  }
  
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    80
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    selectedInstrument = indexPath.row
    showAction()
  }
  
  func buy() {
    NetworkService.shared.buy(user: userId, instrument: selectedInstrument) { result in print(result) }
  }
  
  func sell() {
    NetworkService.shared.sell(user: userId, instrument: selectedInstrument) { result in print(result) }
  }
  
  func showAction() {
    let alert = UIAlertController(title: "???????????????? ????????????????", message: "", preferredStyle: .actionSheet)
    alert.addAction(UIAlertAction(title: "????????????", style: .default, handler: { _ in
      self.buy()
    }))
    alert.addAction(UIAlertAction(title: "??????????????", style: .default, handler: { _ in
      self.sell()
    }))
    alert.addAction(UIAlertAction(title: "????????????", style: . cancel, handler: { _ in
    }))
    self.present(alert, animated: true, completion: nil)
  }
  
}
