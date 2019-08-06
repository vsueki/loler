//
//  ViewController.swift
//  Loler
//
//  Created by Vitor Hissamura on 05/08/19.
//  Copyright © 2019 Vitor Hissamura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let imageURL = "http://ddragon.leagueoflegends.com/cdn/9.3.1/img/item/"
        
        guard let url = URL(string: "http://ddragon.leagueoflegends.com/cdn/9.3.1/data/pt_BR/item.json") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data, error == nil else {
                print(error?.localizedDescription ?? "Response Error")
                return
            }
            do {
                let jsonResponse = try JSONSerialization.jsonObject(with: dataResponse, options: [])
                print(jsonResponse)
                
                guard let jsonArray = jsonResponse as? [[String: Any]] else {
                    return
                }
                
                let j = try? JSONDecoder().decode(<#T##type: Decodable.Protocol##Decodable.Protocol#>, from: <#T##Data#>)
                
                print("*****************************")
                print("*****************************")
                print(jsonArray)
                
//                guard let title = jsonArray[0] as? String else {
//                    return
//                }
//                print(title)
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        
        task.resume()
    }


}

