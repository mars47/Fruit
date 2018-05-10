//
//  ViewController.swift
//  Fruit
//
//  Created by Omar  on 30/01/2018.
//  Copyright © 2018 Omar. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    let viewModel = ViewControllerViewModel()
    var dataSource: ViewControllerDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = ViewControllerDataSource(viewModel: viewModel)
        self.tableView.delegate = self
        self.tableView.dataSource = self.dataSource

        bindViewModel()
        viewModel.downloadData()
        }
    
    func bindViewModel() {
        viewModel.fruitCells.bindAndFire() { [weak self] _ in
            DispatchQueue.main.async{
            self?.tableView?.reloadData()
            }
        }
    }

    func  tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let fruit = viewModel.fruitCells.value[indexPath.row]
        performSegue(withIdentifier: "show", sender: fruit)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if let destination = segue.destination as? DetailViewController {
            if let party = sender as? Fruit {
                destination.fruit = party
            }
        }
    }
}

