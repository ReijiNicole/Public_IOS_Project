//
//  ViewController.swift
//  Swift5Bokete1
//
//  Created by X X X on 2020/08/12.
//  Copyright © 2020 X X X. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage
import Photos

class ViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet weak var odaiImageView: UIImageView!
    
    @IBOutlet weak var commentTextView: UITextView!
    
    @IBOutlet weak var searchTextField: UITextField!
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // パーツの体裁を整える
        commentTextView.layer.cornerRadius = 20.0
        
        // アルバムへのアクセスの許可を識別する
        PHPhotoLibrary.requestAuthorization { (status) in
            
            switch(status) {
            case .authorized: break
            case .denied: break
            case .notDetermined: break
            case .restricted: break
            case .limited: break
            }

            
        }
        
        getImage(keyword: "funny")
        
        searchTextField.delegate = self
        commentTextView.delegate = self
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        searchTextField.resignFirstResponder()
        
        return true
    }
        
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditingが動きました。")
    }
    
        // 検索キーワードを元に画像を引っ張ってくる
        // pixer.com
        // API keys 2963093-768f9ffc11d874c5a568a82ee
        
        
        func getImage(keyword:String) {
            
            let url = "https://pixabay.com/api/?key=2963093-768f9ffc11d874c5a568a82ee&q=\(keyword)"
            
            /*
             *Alamofireを使ってhttpリクエストを投げる。
             *帰ってきた値をJSON解析する。
             *image.viewに貼り付ける
             */
            AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response) in
                
                switch response.result {
                    
                case .success:
                    let json:JSON = JSON(response.data as Any)
                    var imageString = json["hits"][self.count]["webformatURL"].string

                    if imageString == nil{
                        
                        imageString = json["hits"][0]["webformatURL"].string
                        self.odaiImageView.sd_setImage(with: URL(string: imageString!), completed: nil)
                        
                        
                    }else{
                        
                        self.odaiImageView.sd_setImage(with: URL(string: imageString!), completed: nil)

                    }

                case .failure(let error):
                    print(error)
                    
                    
                }
                
            }
            
        }
        
        
    
    
    @IBAction func nextOdai(_ sender: Any) {
        
        count += 1
        if searchTextField.text == ""{
            
            getImage(keyword: "funny")
            
            
        }else{
            
            getImage(keyword: searchTextField.text!)
            
        }

    }
    
    @IBAction func searchAction(_ sender: Any) {
        self.count = 0
        if searchTextField.text == ""{
            
            getImage(keyword: "funny")
            
        }else{
            
            getImage(keyword: searchTextField.text!)
            
        }
    }
    
    @IBAction func next(_ sender: Any) {
        
        performSegue(withIdentifier: "next", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let shareVC = segue.destination as? ShereViewController
        
        shareVC?.commentString = commentTextView.text
        shareVC?.resultImage = odaiImageView.image!
        
        
    }
}



