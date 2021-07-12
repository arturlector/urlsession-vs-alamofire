//
//  PunchData.swift
//  practiceWithNetworking
//
//  Created by Григорий Виняр on 03.07.2021.
//

import Foundation
import Alamofire

class PatchData {
    
    func patchDataWithURLSession() {
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        let parameters = ["title" : "Swimming is good for your neck", "Some" : "Sunshine"]
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
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
    
    func patchDataWithAlamofire() {
        
        let parameters = ["title" : "Tennis player", "Surname" : "Smirnov"]
        let headers = HTTPHeader(name: "application/json", value: "Content-Type")
        
        AF.request("https://jsonplaceholder.typicode.com/posts/1", method: .patch, parameters: parameters, headers: [headers]).responseJSON { response in
            
            guard let json = try? JSONSerialization.jsonObject(with: response.data!, options: []) else { return }
            print(json)
        }
    }
}
