//
//  ListCollectionVC.swift
//  MinderaUI
//
//  Created by Ricardo Duarte on 17/04/2018.
//  Copyright © 2018 Ricardo Duarte. All rights reserved.
//

import UIKit

class ListCollectionVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    @IBOutlet weak var collectionView: UICollectionView!
    var items:[String] = []
    var list_item:Int?
    let items_length = 15
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        set_navbar_title()
        populate_descriptions()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "item_id", for: indexPath) as! ListCollectionCell
        cell.label_description.text = items[indexPath.row]
        return cell
    }
    
    
    func populate_descriptions(){
        for i in 1..<items_length{
            var temp:String?
            if i < 10{
                temp = "Description 0" + String(i)
            }
            else if i >= 10{
                temp = "Description " + String(i)
            }
            if let item_text = temp{
                items.append(item_text)
            }
            else{
                print("Error: could not get the description number")
            }
        }
    }
    
    
    func set_navbar_title(){
        if let list_nr = list_item{
            self.navigationItem.title = "List " + String(list_nr)
        }
        else{
            print("Error: could not get list number")
        }
    }
}
