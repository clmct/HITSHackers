import UIKit

class NewsViewController: UIViewController {
  let tableView = UITableView()
  var news: [Advice]? = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setup()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: "NewsTableViewCell")
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 200
    
    NetworkService.shared.getUser(id: userId) { result in
      switch result {
      case .success(let result):
        let news = result.gameWeek?.news
        self.news = news
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

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    news?.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell") as? NewsTableViewCell else {
      return UITableViewCell()
    }
    
    if let news = news?[indexPath.row] {
    cell.configure(news: news)
  }
    return cell
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
