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
    //private(set) var types:String!
    
    private var _type: String!
    private var _price: Int!
    private var _weight: Int!
    private var _fruitArray = [Fruit]()

    var type: String {
        return _type
    }
    
    var price: Int {
        return _price
    }
    
    var weight: Int {
        return _weight
    }
    
    var fruitArray: [Fruit] {
        get {
            return _fruitArray
        } set {
            _fruitArray = newValue
        }
    }
    
    override init() {
        super.init()
    }
    
    init(initWithArray array: [Fruit]) {
        
        _fruitArray = array
    }

    init(initialiseFruitWith dict: Dictionary<String, Any>) {

        _type = dict["type"] as! String
        _price = dict["price"] as! Int
        _weight = dict["weight"] as! Int
    }
    
    
}
