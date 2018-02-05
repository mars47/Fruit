//
//  Math.swift
//  Fruit
//
//  Created by Omar  on 05/02/2018.
//  Copyright © 2018 Omar. All rights reserved.
//

import UIKit

class Math: NSObject {

    func convertToMilliSecondsAndString (_ interval: Double) -> String {

        let number = String(format: "%.0f", Double(round(interval * 100)))
        return number
    }
    
    func convertPenceToPounds (_ pence: Int) -> String {

        return String(format: "%.2f", (Double(pence)/100))
    }
    
    func convertGramsToKilos (_ grams: Int) -> String {
        
       return String(format: "%.2f", (Double(grams)/1000))
    }

}
