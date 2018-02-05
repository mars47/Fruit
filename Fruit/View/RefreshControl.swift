//
//  RefreshControl.swift
//  Fruit
//
//  Created by Omar  on 05/02/2018.
//  Copyright © 2018 Omar. All rights reserved.
//

import UIKit

class RefreshControl: UIRefreshControl {
    
    func returnRefreshControl() -> UIRefreshControl {
        
        let refreshControl = RefreshControl()
        refreshControl.backgroundColor = UIColor.lightGray
        refreshControl.backgroundColor = UIColor.lightGray
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to Refresh")

        return refreshControl
    }

}
