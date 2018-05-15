//
//  FruitController.swift
//  Fruit
//
//  Created by Omar  on 12/02/2018.
//  Copyright © 2018 Omar. All rights reserved.
//

import UIKit

class NetworkManager: NSObject {

    func downloadData(from url: URL, completion: @escaping ([Fruit]) -> ()) {
        
        var newArray = [Fruit]()
        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
        if let data = data {
                
                do {
                     let root = try JSONSerialization.jsonObject(with: data, options: []) as! [String: [Dictionary<String, Any>]]
                    guard let array = root["fruit"] else { return }

                    newArray = array.flatMap { Fruit(initialiseFruitWith: $0 ) }
                    completion(newArray)
                    
                } catch {
                    print(error)
                }
            }
        }
        session.resume()
    }
}
    

