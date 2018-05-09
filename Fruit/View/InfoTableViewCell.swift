//
//  infoTableViewCell.swift
//  Fruit
//
//  Created by Omar  on 01/02/2018.
//  Copyright © 2018 Omar. All rights reserved.
//

import UIKit

class infoTableViewCell: UITableViewCell {
    
    var viewModel: InfoTableViewCellViewModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var typeLabel: UILabel!
    
    func bind(fruit: Fruit) {
        
        viewModel = InfoTableViewCellViewModel(label: fruit.type)
        typeLabel.text = viewModel.nameLabel.value
    }
}
