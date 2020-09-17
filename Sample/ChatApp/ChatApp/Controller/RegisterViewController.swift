//
//  RegisterViewController.swift
//  ChatApp
//
//  Created by Reiji Nicole Nohara on 2020/08/30.
//  Copyright © 2020 Reiji Nicole Nohara. All rights reserved.
//

import UIKit
import Firebase
import Lottie
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!

    let animationView = AnimationView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // FireBaseにUserを登録する。
    @IBAction func registerNewUser(_ sender: Any) {
        
        // アニメーションのスタート
        LoadingAnimation().startAnimation()
        
        // 新規登録
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            
            if error != nil {
                
                print(error as Any)
                
            } else {
                
                print("ユーザーの作成が成功しました。")
                
                // アニメーションのストップ
                LoadingAnimation().stopAnimation()
                
                // 画面をチャット画面に遷移させる
                self.performSegue(withIdentifier: "chat", sender: nil)
                
            }
            
        }
        
    }
    
}
