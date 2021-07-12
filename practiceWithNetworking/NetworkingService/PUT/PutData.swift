//
//  PutData.swift
//  practiceWithNetworking
//
//  Created by Григорий Виняр on 03.07.2021.
//

import Foundation
import Alamofire

class PutData {
    
    func putDataWithUrlSession() {
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        let parameters = ["Score" : "999"]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        request.httpBody = httpBody
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = session.dataTask(with: request) { data, response, error in
            
            if error != nil {
                print(error?.localizedDescription as Any)
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
    
    func putDataWithAlamofire() {
        
        let parameters = ["Day" : "3", "Month" : "June"]
        let headers = HTTPHeader(name: "application/json", value: "Content-Type")
        
        AF.request("https://jsonplaceholder.typicode.com/posts/1", method: .put, parameters: parameters, headers: [headers]).responseJSON { response in
            
            guard let json = try? JSONSerialization.jsonObject(with: response.data!, options: []) else { return }
            print(json)
        }
        
    }
}
