//
//  Animation.swift
//  ChatApp
//
//  Created by X X X on 2020/09/02.
//  Copyright © 2020 X X X. All rights reserved.
//

import Foundation
import Firebase
import Lottie


class LoadingAnimation : UIViewController{
    
    let animationView = AnimationView()

    
    func startAnimation() {
        
        let animation = Animation.named("loading")
        
        animationView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height / 1.5)
        
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        
        view.addSubview(animationView)
        
    }
    
    func stopAnimation() {
        animationView.removeFromSuperview()
    }

}
