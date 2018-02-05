//
//  ViewController.swift
//  Fruit
//
//  Created by Omar  on 30/01/2018.
//  Copyright © 2018 Omar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    private var fruit = Fruit()
    private var math = Math()
    private var tableviewRefreshControl = RefreshControl()
    
    var fruitArray = [Fruit]()
    var arrayOfFruitDictionaries = [Dictionary<String, Any>] ()
    
    var displayTimeStarted = NSDate()
    var displayInterval = Double()
    
    let start = NSDate()
    var interval = Double()
    var endpoint = String()
    

    override func viewDidLoad() {
        super.viewDidLoad()
 
        tableView.delegate = self
        tableView.dataSource = self
        tableView.addSubview(tableviewRefreshControl.returnRefreshControl())
        downloadJSONData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        displayTimeStarted = NSDate()
        tableviewRefreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        // Records Display Time
        displayInterval = NSDate().timeIntervalSince(displayTimeStarted as Date)
        let endpoint = "display&data=" + self.math.convertToMilliSecondsAndString(displayInterval)
        RecordStat(endpoint, type: 1)
    }
    
    func downloadJSONData() {
        
        guard let url = URL(string: "https://raw.githubusercontent.com/fmtvp/recruit-test-data/master/data.json") else {
            return
        }
        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let data = data {
                
                do {
                    let root = try JSONSerialization.jsonObject(with: data, options: []) as! [String: [Dictionary<String, Any>]]
                    
                    self.arrayOfFruitDictionaries = root["fruit"]!
                    self.fruitArray = self.fruit.makeArrayOfFruitObjects(self.arrayOfFruitDictionaries)
                    
                    DispatchQueue.main.async{
                        self.tableView.reloadData()
                    }
                    
                    // Records Network Request time
                    self.interval = NSDate().timeIntervalSince(self.start as Date)
                    self.endpoint = "load&data=" + self.math.convertToMilliSecondsAndString(self.interval)
                    
                } catch {
                    print(error)
                }
            }
        }
        session.resume()
        RecordStat(endpoint, type: 0)
    }
    
    func RecordStat (_ Endpoint: String, type: Int){
        
        guard let url = URL(string: "https://raw.githubusercontent.com/fmtvp/recruit-test-data/master/stats?event=\(Endpoint)") else {
            return
        }
        var eventRequest = URLRequest(url: url as URL)
        eventRequest.httpMethod = "GET"
        let session = URLSession.shared.dataTask(with: eventRequest) { (data, response, error) in
        }
        session.resume()
    }
    
        // MARK: - Table view data source ------------------
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "infoTableViewCell", for: indexPath) as? infoTableViewCell {
            
            cell.updateUI(fruit: fruitArray[indexPath.row])
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func  tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let fruit = fruitArray[indexPath.row]
        performSegue(withIdentifier: "show", sender: fruit)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.fruitArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
            // ----------- Table view data source ------------------

    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if let destination = segue.destination as? DetailViewController {
            if let party = sender as? Fruit {
                destination.fruit = party
            }
        }
    }
    
  @objc func refresh (refreshControl: UIRefreshControl) {
        
        arrayOfFruitDictionaries.removeAll()
        fruitArray.removeAll()
        downloadJSONData()
        tableView.reloadData()
        refreshControl.endRefreshing()
    }
}

