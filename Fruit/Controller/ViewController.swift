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
    var fruitArray = [Fruit]()
    var arrayOfFruitDictionaries = [Dictionary<String, Any>] ()
    

    override func viewDidLoad() {
        super.viewDidLoad()
 
        tableView.delegate = self
        tableView.dataSource = self
        
        guard let url = URL(string: "https://raw.githubusercontent.com/fmtvp/recruit-test-data/master/data.json") else {
            return
        }
        
        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let data = data {
                
                do {
                    let root = try JSONSerialization.jsonObject(with: data, options: []) as! [String: [Dictionary<String, Any>]]
                    
                    self.arrayOfFruitDictionaries = root["fruit"]!
                    self.fruitArray = self.makeArrayOfFruitObjects(self.arrayOfFruitDictionaries)
                    print(self.fruitArray.count)
                    
                    DispatchQueue.main.async{
                        self.tableView.reloadData()
                    }
                    
                } catch {
                    print(error)
                }
            }
        }
        session.resume()
        

    }
    /* iterates through the array of fruit dictionaries, creates and initalises a fruit object on each iteration, then appends each newly created object to an array of type fruit */
    func makeArrayOfFruitObjects (_ arrayOfFruitDictionaries: [Dictionary<String, Any>]) -> [Fruit] {
        var _fruitArray = [Fruit]()
        
        for dict in arrayOfFruitDictionaries {
            
            let newFruit = Fruit(initialiseFruitWith: dict)
            _fruitArray.append(newFruit)
            
        }
        
        return _fruitArray
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "infoTableViewCell", for: indexPath) as? infoTableViewCell {
            
            print("PRINTING CELL")
            cell.updateUI(fruit: fruitArray[indexPath.row])
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.fruitArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

