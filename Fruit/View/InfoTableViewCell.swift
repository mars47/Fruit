//
//  infoTableViewCell.swift
//  Fruit
//
//  Created by Omar  on 01/02/2018.
//  Copyright © 2018 Omar. All rights reserved.
//

import UIKit

class infoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var typeLabel: UILabel!
    
    var viewModel: InfoTableViewCellViewModel! {
        didSet {
            bind()
        }
    }
    
    func bind() {
        typeLabel.text = viewModel.nameLabel.value
    }
}
