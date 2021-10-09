import Foundation


private let baseApi = "http://95.182.120.116:9584/api/"

enum NetworkError: Error {
  case error
}

final class NetworkService {
  public static var shared = NetworkService()
  private init() {}
  
  private func fetch<T: Codable>(urlRequest: URLRequest, completion: @escaping (Result<T, NetworkError>) -> Void) {
    URLSession(configuration: .default).dataTask(with: urlRequest) { data, response, error in
      guard let data = data else {
        DispatchQueue.main.async {
          completion(.failure(.error))
        }
        return
      }
      
      do {
        let jsonObject = try JSONDecoder().decode(T.self, from: data)
        DispatchQueue.main.async {
          completion(.success(jsonObject))
        }
      } catch {
      }
    }.resume()
  }
}


extension NetworkService {
  func getUser(id: Int, completion: @escaping (Result<User, NetworkError>) -> Void) {
    guard let url = URL(string: baseApi + "user/\(id)") else {
      completion(.failure(.error))
      return
    }
    
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "GET"
    
    self.fetch(urlRequest: urlRequest) { (result: Result<User, NetworkError>) in
      DispatchQueue.main.async {
        completion(result)
      }
    }
  }
  
  func getGameWeek(id: Int, completion: @escaping (Result<GameWeek, NetworkError>) -> Void) {
    guard let url = URL(string: baseApi + "game_week/\(id)") else {
      completion(.failure(.error))
      return
    }
    
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "GET"
    
    self.fetch(urlRequest: urlRequest) { (result: Result<GameWeek, NetworkError>) in
      completion(result)
    }
  }

  func getTestQuestion(completion: @escaping (Result<GameWeek, NetworkError>) -> Void) {
    guard let url = URL(string: baseApi + "test_question") else {
      completion(.failure(.error))
      return
    }
    
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "GET"
    
    self.fetch(urlRequest: urlRequest) { (result: Result<GameWeek, NetworkError>) in
      completion(result)
    }
  }

  // MARK: TO DO
//  func getGameResult(completion: @escaping (Result<GameWeek, NetworkError>) -> Void) {
//  }
  
  //
  
  
  func createUser(name: String, completion: @escaping (Result<User, NetworkError>) -> Void) {
    guard let url = URL(string: baseApi + "user") else {
      completion(.failure(.error))
      return
    }
    
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "POST"
    
    let parameterDictionary = ["Name" : name]
    urlRequest.setValue("Application/json", forHTTPHeaderField: "Content-Type")
    guard let httpBody = try? JSONSerialization.data(withJSONObject: parameterDictionary, options: []) else {
      return
    }
    urlRequest.httpBody = httpBody
    
    self.fetch(urlRequest: urlRequest) { (result: Result<User, NetworkError>) in
      completion(result)
    }
  }
  
  func nextWeek(id: Int, completion: @escaping (Result<User, NetworkError>) -> Void) {
    guard let url = URL(string: baseApi + "user/\(id)/next_week") else {
      completion(.failure(.error))
      return
    }

    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "POST"

    
    self.fetch(urlRequest: urlRequest) { (result: Result<User, NetworkError>) in
      completion(result)
    }
  }
  
  // MARK: TO DO
  //  func buy(id: Int, completion: @escaping (Result<User, NetworkError>) -> Void) {
  //    guard let url = URL(string: baseApi + "user/\(id)/next_week") else {
  //      completion(.failure(.error))
  //      return
  //    }
  //
  //    var urlRequest = URLRequest(url: url)
  //    urlRequest.httpMethod = "POST"
  //
  //
  //    self.fetch(urlRequest: urlRequest) { (result: Result<User, NetworkError>) in
  //      completion(result)
  //    }
  //  }
  
  // MARK: TO DO
  //  func sell(id: Int, completion: @escaping (Result<User, NetworkError>) -> Void) {
  //    guard let url = URL(string: baseApi + "user/\(id)/next_week") else {
  //      completion(.failure(.error))
  //      return
  //    }
  //
  //    var urlRequest = URLRequest(url: url)
  //    urlRequest.httpMethod = "POST"
  //
  //
  //    self.fetch(urlRequest: urlRequest) { (result: Result<User, NetworkError>) in
  //      completion(result)
  //    }
  //  }
  
  // MARK: TO DO
  //  func createInvetProfile(id: Int, completion: @escaping (Result<User, NetworkError>) -> Void) {
  //    guard let url = URL(string: baseApi + "user/\(id)/next_week") else {
  //      completion(.failure(.error))
  //      return
  //    }
  //
  //    var urlRequest = URLRequest(url: url)
  //    urlRequest.httpMethod = "POST"
  //
  //
  //    self.fetch(urlRequest: urlRequest) { (result: Result<User, NetworkError>) in
  //      completion(result)
  //    }
  //  }
}

