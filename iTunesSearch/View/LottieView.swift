//
//  Animation.swift
//  iTunesSearch
//
//  Created by Jorge Acosta on 03-01-20.
//  Copyright © 2020 Jorge Acosta. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Lottie

struct LottieView : UIViewControllerRepresentable {
    
   
    
    func makeUIViewController(context: Context) -> UIViewController {
        
        let animationView = AnimationView(name: "loading_music")

        let viewController = UIViewController()
    
        animationView.contentMode = .scaleAspectFill
        animationView.frame = CGRect(x: 0, y: -314, width: 264, height: 464)
    

        viewController.view.addSubview(animationView)
        
        animationView.loopMode = .loop
        animationView.play()
        
        return viewController
    }

       func updateUIViewController(_ viewController: UIViewController, context: Context) {
            
               
       }
    
}
