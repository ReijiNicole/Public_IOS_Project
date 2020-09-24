//
//  ShereViewController.swift
//  Swift5Bokete1
//
//  Created by X X X on 2020/08/12.
//  Copyright © 2020 X X X. All rights reserved.
//

import UIKit

class ShereViewController: UIViewController {

    var resultImage = UIImage()
    var commentString = String()
    var screenShotImage = UIImage()
    
    @IBOutlet weak var resultImageView: UIImageView!
    
    @IBOutlet weak var commentLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultImageView.image = resultImage
        commentLabel.text = commentString
        commentLabel.adjustsFontSizeToFitWidth = true
        
        
        
    }
    
    @IBAction func shere(_ sender: Any) {
        
        //スクリーンショットをとる
        takeScreenShot()
        
        
        let items = [screenShotImage] as [Any]
        
        //アクティビティビューに乗っけて、シェアする
        let activityVC = UIActivityViewController(activityItems: items, applicationActivities: nil)
        
        present(activityVC, animated: true, completion: nil)

        
    }
    
    func takeScreenShot(){
        
        let width = CGFloat(UIScreen.main.bounds.size.width)
        let height = CGFloat(UIScreen.main.bounds.size.height/1.3)
        let size = CGSize(width: width, height: height)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        //viewに書き出す
        self.view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        screenShotImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
    }

    @IBAction func back(_ sender: Any) {

        dismiss(animated: true, completion: nil)
        
    }
    
}
