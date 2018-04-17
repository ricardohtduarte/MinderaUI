//
//  OpenDayListVC.swift
//  MinderaUI
//
//  Created by Ricardo Duarte on 17/04/2018.
//  Copyright © 2018 Ricardo Duarte. All rights reserved.
//

import UIKit

class OpenDayListVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    @IBOutlet weak var tableView: UITableView!
    var day_nr:Int?
    var list_items:[Int] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list_items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "list_item", for: indexPath) as! OpenDayListCell
        cell.list_nr.text = "List " + String(list_items[indexPath.item])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "list_to_collection", sender: indexPath.item)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let collectionVC = segue.destination as! ListCollectionVC
        collectionVC.list_item = sender as?  Int
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let number = day_nr{
            self.navigationItem.title = "Open Day 18'_Day " + String(number)
        }
        else{
            print("ERROR: could not get the day number")
        }
        
        for i in 0..<15{
            list_items.append(i)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
