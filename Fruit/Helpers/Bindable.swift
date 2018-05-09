//
//  Bindable.swift
//  Fruit
//
//  Created by Omar  on 03/05/2018.
//  Copyright © 2018 Omar. All rights reserved.
//

class Bindable<T> {
    typealias Listener = ((T) -> Void)
    var listener: Listener?
    
    var value: T {
        didSet {
            print("Value has been changed: \(value) ")
            listener?(value)
        }
    }
    
    init(_ v: T) {
        self.value = v
    }
    
    func bind(_ listener: Listener?) {
        self.listener = listener
    }
    
    func bindAndFire(_ listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
    
}

