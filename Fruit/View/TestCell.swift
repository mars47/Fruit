//
//  TestCell.swift
//  Fruit
//
//  Created by Omar  on 08/02/2018.
//  Copyright © 2018 Omar. All rights reserved.
//

import UIKit

class TestCell: UITableViewCell {

    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var ColourLabel: UILabel!
    @IBOutlet weak var NumberLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
