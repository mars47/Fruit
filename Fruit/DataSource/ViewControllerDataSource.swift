//
//  ViewControllerDataSource.swift
//  Fruit
//
//  Created by Omar  on 08/02/2018.
//  Copyright © 2018 Omar. All rights reserved.
//

import UIKit

class ViewControllerDataSource: NSObject, UITableViewDataSource {
    
    let viewModel: ViewControllerViewModel
    
    init(viewModel :ViewControllerViewModel){
        self.viewModel = viewModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.fruitCells.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "infoTableViewCell", for: indexPath) as? infoTableViewCell {
            
            cell.bind(fruit: viewModel.fruitCells.value[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
}
