//
//  DetailsViewControllerViewModel.swift
//  Fruit
//
//  Created by Omar  on 08/05/2018.
//  Copyright © 2018 Omar. All rights reserved.
//

import Foundation

class DetailViewControllerViewModel: NSObject {
    
    let math = Math()
    let nameLabel = Bindable(String())
    let priceLabel = Bindable(String())
    let weightLabel = Bindable(String())
    
    init(fruit:Fruit) {
        nameLabel.value = fruit.type
        priceLabel.value = math.convertPenceToPounds(fruit.price)
        weightLabel.value = math.convertGramsToKilos(fruit.weight)
    }
}
