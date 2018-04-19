//
//  LaunchVC.swift
//  MinderaUI
//
//  Created by Ricardo Duarte on 19/04/2018.
//  Copyright © 2018 Ricardo Duarte. All rights reserved.
//

import UIKit

class LaunchVC: UIViewController {
    
    @IBOutlet weak var logo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animate_logo()
    }
    
    func animate_logo(){
        UIView.animate(withDuration: 1.5, animations: {
            //180 degrees animation
            self.logo.transform = CGAffineTransform(rotationAngle: CGFloat.pi) },
                       completion: { finished in
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            //initiate navigation controller
                            let home = self.storyboard?.instantiateViewController(withIdentifier: "home")
                            self.present(home!, animated: true, completion: nil)
                        }
                        })
        }
}


