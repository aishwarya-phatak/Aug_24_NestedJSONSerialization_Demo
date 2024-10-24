//
//  ViewController.swift
//  Aug_24_NestedJSONSerialization_Demo
//
//  Created by Vishal Jagtap on 24/10/24.
//

import UIKit

class ViewController: UIViewController {

    var url : URL?
    var urlRequest : URLRequest?
    var urlSession : URLSession?
    var users : [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonParsing()
    }
    
    func jsonParsing(){
        url = URL(string: "")
        urlRequest = URLRequest(url: url!)
        urlRequest?.httpMethod = "GET"
        urlSession = URLSession(configuration: .default)
        
        let dataTask = urlSession?.dataTask(with: urlRequest!, completionHandler: { data, response, error in
            print(data)
            print(response)
            print(error)
            
            let jsonAPIResponse = try! JSONSerialization.jsonObject(with: data!) as! [String:Any]
            
            let page = jsonAPIResponse["page"] as! Int
            let perPage = jsonAPIResponse["per_page"] as! Int
            let total = jsonAPIResponse["total"] as! Int
            let totalPages = jsonAPIResponse["total_pages"] as! Int
            let data = jsonAPIResponse["data"] as! [[String:Any]]
            
                for eachUser in data{
                    let eachUserId = eachUser["id"] as! Int
                    let eachUserEmail = eachUser["email"] as! String
                    let eachUserFirstName = eachUser["first_name"] as! String
                    let eachUserLastName = eachUser["last_name"] as! String
                    let eachUserAvatar = eachUser["avatar"] as! String
                    
                    self.users.append(User(id: eachUserId,
                                           email: eachUserEmail,
                                           first_name: eachUserFirstName,
                                           last_name: eachUserLastName,
                                           avatar: eachUserAvatar))
                }
                
            let support = jsonAPIResponse["support"] as! [String:Any]
                let supposrtUrl = support["url"] as! String
                let supportText = support["text"] as! String
            
            print(self.users)
        })
        
        dataTask?.resume()
    }
}
