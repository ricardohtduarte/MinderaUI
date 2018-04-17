//
//  ViewController.swift
//  MinderaUI
//
//  Created by Ricardo Duarte on 16/04/2018.
//  Copyright © 2018 Ricardo Duarte. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    @IBOutlet weak var open_day_collection: UICollectionView!
    @IBOutlet weak var graduate_collection: UICollectionView!
    
    var days:[String] = []
    let graduate_count = 10
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.open_day_collection{
            return days.count
        }
        else{
            return graduate_count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.open_day_collection{
            let cell = open_day_collection.dequeueReusableCell(withReuseIdentifier: "open_day", for: indexPath) as! OpenDayCollectionViewCell
            cell.layer.backgroundColor = UIColor(red:0.92, green:0.92, blue:0.92, alpha:1.0).cgColor
            cell.day.text = days[indexPath.row]
            return cell
        }
        else{
            let cell = graduate_collection.dequeueReusableCell(withReuseIdentifier: "graduate", for: indexPath)
            cell.layer.backgroundColor = UIColor(red:0.92, green:0.92, blue:0.92, alpha:1.0).cgColor
            return cell
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //populate open day collection view
        for i in 0..<10{
            let temp_day = "Day 0" + String(i)
            days.append(temp_day)
        }
        //populate graduate collection view
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

