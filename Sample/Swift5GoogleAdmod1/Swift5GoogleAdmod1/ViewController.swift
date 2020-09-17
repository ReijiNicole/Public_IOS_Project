//
//  ViewController.swift
//  Swift5GoogleAdmod1
//
//  Created by Reiji Nicole Nohara on 2020/08/29.
//  Copyright © 2020 Reiji Nicole Nohara. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController {

    @IBOutlet weak var bannerView: GADBannerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
    }


}

