//
//  ViewController.swift
//  MinderaUI
//
//  Created by Ricardo Duarte on 16/04/2018.
//  Copyright © 2018 Ricardo Duarte. All rights reserved.
//

import UIKit

class MinderaHomeVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    @IBOutlet weak var open_day_collection: UICollectionView!
    @IBOutlet weak var graduate_collection: UICollectionView!
    @IBOutlet weak var segmented: UISegmentedControl!
    
    var days:[String] = []
    let graduate_count = 10
    let days_length = 15
    let cell_color = UIColor(red:0.92, green:0.92, blue:0.92, alpha:1.0).cgColor
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.bringSubview(toFront: segmented)
        populate_days_collection()
    }
    
    
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
            let cell = open_day_collection.dequeueReusableCell(withReuseIdentifier: "open_day", for: indexPath) as! OpenDayCollectionCell
            cell.layer.backgroundColor = cell_color
            cell.day.text = days[indexPath.row]
            return cell
        }
        else{
            let cell = graduate_collection.dequeueReusableCell(withReuseIdentifier: "graduate", for: indexPath)
            cell.layer.backgroundColor = cell_color
            return cell
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.open_day_collection{
            performSegue(withIdentifier: "home_to_list", sender: indexPath.row+1)
            
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let listVC = segue.destination as! OpenDayListVC
        listVC.day_nr = sender as? Int
    }
    
    
    func populate_days_collection(){
        for i in 1..<days_length{
            var temp_day:String?
            if i < 10{
                temp_day = "Day 0" + String(i)
            }
            else if i >= 10{
                temp_day = "Day " + String(i)
            }
            if let day_nr = temp_day{
                days.append(day_nr)
            }
            else{
                print("Error: could not get the day number")
            }
        }
    }
}

