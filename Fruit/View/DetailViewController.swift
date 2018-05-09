//
//  DetailViewController.swift
//  Fruit
//
//  Created by Omar  on 01/02/2018.
//  Copyright © 2018 Omar. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    var viewModel: DetailViewControllerViewModel!
    
    var fruit: Fruit {
        
        get {
            return _fruit
        } set {
            _fruit = newValue
        }
    }
    
    private var _fruit: Fruit!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = DetailViewControllerViewModel(fruit: fruit)
        bind()
    }
    
    func bind() {
        titleLabel.text = viewModel.nameLabel.value
        priceLabel.text = viewModel.priceLabel.value
        weightLabel.text = viewModel.weightLabel.value
    }
}
