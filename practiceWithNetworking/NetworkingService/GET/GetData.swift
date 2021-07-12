
import Foundation
import Alamofire

class GetData {
    
    func getDataWithUrlSession() {
        // https://jsonplaceholder.typicode.com/posts/1/comments
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1/comments") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request) { data, response, error in
            
            if error != nil {
                print(error as Any)
            }
            
            guard let data = data else { return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    func getDataWithAlamofire() {
        
        AF.request("https://jsonplaceholder.typicode.com/posts/1/comments", method: .get).responseJSON { response in
            
            guard let json = try? JSONSerialization.jsonObject(with: response.data!, options: []) else { return }
            print(json)
        }
        
    }
}
