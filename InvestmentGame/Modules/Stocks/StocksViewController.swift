import UIKit

class StocksViewController: UIViewController {
  let tableView = UITableView()
  var instruments: [Instrument]? = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setup()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(StockTableViewCell.self, forCellReuseIdentifier: "StockTableViewCell")
    
    NetworkService.shared.getUser(id: 4) { result in
      switch result {
      case .success(let result):
        let instruments = result.gameWeek?.instruments
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
      make.edges.equalToSuperview()
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
    
    if let instrument = instruments?[indexPath.row] {
    cell.configure(stock: Stock(title: instrument.name,
                                icon: instrument.imageURL,
                                price: instrument.basePrice,
                                count: instrument.baseAmount,
                                change: -4))
  }
    return cell
  }
  
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    80
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let urlStr = "itms-apps://apps.apple.com/ru/app/id1364026756"
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(URL(string: urlStr)!, options: [:], completionHandler: nil)
            
        } else {
            UIApplication.shared.openURL(URL(string: urlStr)!)
        }

  }
  
}
