//
//  FruitViewModel.swift
//  Fruit
//
//  Created by Omar  on 23/03/2018.
//  Copyright © 2018 Omar. All rights reserved.
//

import Foundation

class ViewControllerViewModel: NSObject {
   
    let fruitCells = Bindable([Fruit]())
    let url = URL(string: "https://raw.githubusercontent.com/fmtvp/recruit-test-data/master/data.json")
    
    let networkManager: NetworkManager
    
    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func downloadData() {
        networkManager.downloadData(from: url!) { (fruit : [Fruit]) in
            self.fruitCells.value = fruit
       }
    }
    
}

