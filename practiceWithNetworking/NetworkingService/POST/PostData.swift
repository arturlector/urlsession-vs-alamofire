
import Foundation
import Alamofire

class PostData {
    
    func postDataWithURLSession() {
        
        // https://jsonplaceholder.typicode.com
        
        let configuration = URLSessionConfiguration.default
        
        let session = URLSession(configuration: configuration)
        
        let parameters = ["Name" : "Ivan", "Surname" : "Ivanov"]
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        var request = URLRequest(url: url)
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "POST"
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        
        request.httpBody = httpBody
        
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
    
    func postDataWithAlamofire() {
        
        let parameters = ["Name" : "Ivan", "Surname" : "Ivanov"]
        let headers = HTTPHeader(name: "application/json", value: "Content-Type")
        
        AF.request("https://jsonplaceholder.typicode.com/posts", method: .post, parameters: parameters, headers: [headers]).responseJSON { response in
            
            guard let data = response.data else { return }
            
            guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else { return }
            
            print(json)
        }
    }
}
