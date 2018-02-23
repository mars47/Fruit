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
    private var fruit = Fruit()
    private var tableviewRefreshControl = RefreshControl()
    let url = URL(string: "https://raw.githubusercontent.com/fmtvp/recruit-test-data/master/data.json")
    
//    var displayTimeStarted = NSDate()
//    var displayInterval = Double()
//
//    let start = NSDate()
//    var interval = Double()
//    var endpoint = String()
    
        let dataSource = ViewControllerDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.register(UINib(nibName: "TestCell", bundle: nil), forCellReuseIdentifier: "myCell")
//        tableView.addSubview(tableviewRefreshControl.returnRefreshControl())

        FruitController.sharedSessionManager.downloadData(from: url!) { (fruit : [Fruit]) in

            FruitController.sharedSessionManager.fruitArray = fruit

            DispatchQueue.main.async{
                self.tableView.delegate = self
                self.tableView.dataSource = self.dataSource
                self.tableView.reloadData()
            }
        }
    }
    
    func  tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let fruit = FruitController.sharedSessionManager.fruitArray![indexPath.row]
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
    
//   override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//        displayTimeStarted = NSDate()
//        tableviewRefreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
//
//   }
//
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(true)
//        // Records Display Time
//        displayInterval = NSDate().timeIntervalSince(displayTimeStarted as Date)
//        let endpoint = "display&data=" + self.math.convertToMilliSecondsAndString(displayInterval)
//        RecordStat(endpoint, type: 1)
//    }
//
//
//    func RecordStat (_ Endpoint: String, type: Int){
//
//        guard let url = URL(string: "https://raw.githubusercontent.com/fmtvp/recruit-test-data/master/stats?event=\(Endpoint)") else {
//            return
//        }
//        var eventRequest = URLRequest(url: url as URL)
//        eventRequest.httpMethod = "GET"
//        let session = URLSession.shared.dataTask(with: eventRequest) { (data, response, error) in
//        }
//        session.resume()
//    }
//

    
//  @objc func refresh (refreshControl: UIRefreshControl) {
//
//        arrayOfFruitDictionaries.removeAll()
//        fruitArray.removeAll()
//        //downloadJSONData()
//        tableView.reloadData()
//        refreshControl.endRefreshing()
//    }
}

