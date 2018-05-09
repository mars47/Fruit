//
//  FruitController.swift
//  Fruit
//
//  Created by Omar  on 12/02/2018.
//  Copyright © 2018 Omar. All rights reserved.
//

import UIKit

class NetworkManager: NSObject {
    
    static var sharedSessionManager = NetworkManager()
     var fruitArray:[Fruit]? {
        didSet {
            print("Items set: \(fruitArray!.count)")
        }
    }

    func downloadData(from url: URL, completion: @escaping ([Fruit]) -> ()) {
        
        var array = [Fruit]()
        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
        if let data = data {
                
                do {
                    let root = try JSONSerialization.jsonObject(with: data, options: []) as! [String: [Dictionary<String, Any>]]
                    
                    array = self.makeArrayOfFruitObjects(root["fruit"]!)
                    completion(array)
                    
                } catch {
                    print(error)
                }
            }
        }
        session.resume()
    }
    
  /* iterates through the array of fruit dictionaries, creates and initalises a fruit object on each iteration, then appends each newly created object to an array of type fruit */
    
    func makeArrayOfFruitObjects (_ arrayOfFruitDictionaries: [Dictionary<String, Any>]) -> [Fruit] {
        var fruitArray = [Fruit]()
        
        for dict in arrayOfFruitDictionaries {
            
            let newFruit = Fruit(initialiseFruitWith: dict)
           // print("FRUIT TYPE ADDED: \(newFruit.type)")
            fruitArray.append(newFruit)
            
        }
        return fruitArray
    }

}
    

