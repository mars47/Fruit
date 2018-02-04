//
//  DetailViewController.swift
//  Fruit
//
//  Created by Omar  on 01/02/2018.
//  Copyright © 2018 Omar. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    private var _fruit: Fruit!
    
    var fruit: Fruit {
        
        get {
            return _fruit
        } set {
            _fruit = newValue
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

         titleLabel.text = fruit.type
         priceLabel.text = String (fruit.price)
         weightLabel.text = String (fruit.weight)
    }


}
