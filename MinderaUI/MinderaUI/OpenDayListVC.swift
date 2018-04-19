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
    var day_nr:String?
    var list_items:[String] = []
    let list_count = 15
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        set_navbar_title()
        populate_list()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list_items.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "list_item", for: indexPath) as! OpenDayListCell
        cell.list_nr.text = list_items[indexPath.item]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "list_to_collection", sender: "List " + String(indexPath.item+1))
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let collectionVC = segue.destination as! ListCollectionVC
        collectionVC.list_item = sender as? String
    }
    
    
    func set_navbar_title(){
        if let title = day_nr{
            self.navigationItem.title = title
        }
        else{
            print("ERROR: could not get the day number")
        }
    }
    
    
    func populate_list(){
        for i in 1...list_count{
            var temp:String?
            if i < 10{
                temp = "List 0" + String(i)
            }
            else if i >= 10{
                temp = "List " + String(i)
            }
            if let item_text = temp{
                list_items.append(item_text)
            }
            else{
                print("Error: could not get the list number")
            }
        }
    }
}
