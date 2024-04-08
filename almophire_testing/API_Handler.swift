//
//  API_Handler.swift
//  almophire_testing
//
//  Created by Zignuts Technolab on 08/04/24.
//

import Foundation
import Alamofire

class APIHandler{
    static let sharedInstance = APIHandler()
    
    func fetchingAPIData(handler: @escaping (_ apiData: [Model])->(Void)){
        let url = "https://jsonplaceholder.typicode.com/posts/"
        AF.request(url,method: .get,parameters: nil,encoding: URLEncoding.default , headers: nil,interceptor: nil).response{ response in
            switch response.result {
            case .success(let data):
                do {
                    let jsondata = try JSONDecoder().decode([Model].self, from: data!)
                    // closure calling
                    handler(jsondata)
                }catch{
                    print(error.localizedDescription)
                } 
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
}

struct Model: Codable{
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
