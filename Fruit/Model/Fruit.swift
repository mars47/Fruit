//
//  Fruit.swift
//  Fruit
//
//  Created by Omar  on 01/02/2018.
//  Copyright © 2018 Omar. All rights reserved.
//

import UIKit
import Foundation

class Fruit: NSObject {
    
    private var _type: String!
    private var _price: Int!
    private var _weight: Int!
    
    var type: String {
        return _type
    }
    
    var price: Int {
        return _price
    }
    
    var weight: Int {
        return _weight
    }
    
    override init() {
        super.init()
    }

    init(initialiseFruitWith dict: Dictionary<String, Any>) {

        _type = dict["type"] as! String
        _price = dict["price"] as! Int
        _weight = dict["weight"] as! Int
    }
    
    /* iterates through the array of fruit dictionaries, creates and initalises a fruit object on each iteration, then appends each newly created object to an array of type fruit */
    func makeArrayOfFruitObjects (_ arrayOfFruitDictionaries: [Dictionary<String, Any>]) -> [Fruit] {
        var fruitArray = [Fruit]()
        
        for dict in arrayOfFruitDictionaries {
            
            let newFruit = Fruit(initialiseFruitWith: dict)
            fruitArray.append(newFruit)
            
        }
        
        return fruitArray
    }

}
