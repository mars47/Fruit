//
//  ViewControllerDataSource.swift
//  Fruit
//
//  Created by Omar  on 08/02/2018.
//  Copyright © 2018 Omar. All rights reserved.
//

import UIKit

class ViewControllerDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let array = FruitController.sharedSessionManager.fruitArray {
            
            return array.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "infoTableViewCell", for: indexPath) as? infoTableViewCell {
            
            if let array = FruitController.sharedSessionManager.fruitArray{
                
                cell.updateUI(fruit: array[indexPath.row])
                return cell
            }
        }
        return UITableViewCell()
    }
    
}
