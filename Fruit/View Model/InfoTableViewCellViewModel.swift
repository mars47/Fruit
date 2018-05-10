//
//  InfoTableViewCellViewModel.swift
//  Fruit
//
//  Created by Omar  on 09/05/2018.
//  Copyright © 2018 Omar. All rights reserved.
//

import Foundation

class InfoTableViewCellViewModel: NSObject {
    
    let nameLabel = Bindable(String())
    
    init(label: String){
        nameLabel.value = label
    }
    
}
