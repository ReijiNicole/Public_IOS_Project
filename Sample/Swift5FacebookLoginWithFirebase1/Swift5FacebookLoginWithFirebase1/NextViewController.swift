//
//  NextViewController.swift
//  Swift5FacebookLoginWithFirebase1
//
//  Created by Reiji Nicole Nohara on 2020/08/25.
//  Copyright © 2020 Reiji Nicole Nohara. All rights reserved.
//

import UIKit
import SDWebImage


class NextViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if UserDefaults.standard.object(forKey: "pictureURLStirng") != nil || (UserDefaults.standard.object(forKey: "displayName") != nil) {
            
            let imageString = UserDefaults.standard.object(forKey: "pictureURLString") as!  String
            
            profileImageView.sd_setImage(with: URL(string: imageString), completed: nil)
            
            profileImageView.layer.cornerRadius = 20.0
            
            let displayName = UserDefaults.standard.object(forKey: "displayName") as! String
            
            userNameLabel.text = displayName
            
        }
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.isNavigationBarHidden = false
        
    }

    

}
