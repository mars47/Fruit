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
    private var math = Math()
    private var vc = ViewController()
    var displayTimeStarted = NSDate()
    var displayInterval = Double()
    
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
         priceLabel.text = "£" + math.convertPenceToPounds(fruit.price) + "p"
         weightLabel.text = math.convertGramsToKilos(fruit.weight) + " Kg"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        displayTimeStarted = NSDate()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        displayInterval = NSDate().timeIntervalSince(displayTimeStarted as Date)
        let endpoint = "display&data=" + self.math.convertToMilliSecondsAndString(displayInterval)
        vc.RecordStat(endpoint, type: 1)
    }
    

}
