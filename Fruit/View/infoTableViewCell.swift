//
//  infoTableViewCell.swift
//  Fruit
//
//  Created by Omar  on 01/02/2018.
//  Copyright © 2018 Omar. All rights reserved.
//

import UIKit

class infoTableViewCell: UITableViewCell {
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var typeLabel: UILabel!
    
    func updateUI(fruit: Fruit) {
        typeLabel.text = fruit.type
    }
    
}
