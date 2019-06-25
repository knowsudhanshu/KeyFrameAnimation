//
//  ViewController.swift
//  AnimationTest
//
//  Created by Sudhanshu on 25/06/19.
//  Copyright © 2019 Sudhanshu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let imageView: UIImageView = {
        let imv = UIImageView(image: #imageLiteral(resourceName: "heart"))
        imv.contentMode = .scaleAspectFit
        imv.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        imv.backgroundColor = .blue
//        imv.translatesAutoresizingMaskIntoConstraints = false
//        imv.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        imv.widthAnchor.constraint(equalToConstant: 40).isActive = true
        return imv
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(tapHandler))
        tapGR.numberOfTapsRequired = 1
        view.addGestureRecognizer(tapGR)
    }
    
    @objc func tapHandler(_ tapGesture: UITapGestureRecognizer) {
        imageView.removeFromSuperview()
        
        let tapLocation = tapGesture.location(in: self.view)
        
        imageView.center = tapLocation
        
        view.addSubview(imageView)

        
        let transform1 = CGAffineTransform(translationX: 0, y: -30)
        let transform2 = CGAffineTransform(scaleX: 2, y: 2)
        
        let transform3 = CGAffineTransform(translationX: 0, y: -200)
        let transform4 = CGAffineTransform(scaleX: 0.2, y: 0.2)
        
        UIView.animateKeyframes(withDuration: 2, delay: 0, options: UIView.KeyframeAnimationOptions.calculationModePaced, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5, animations: {
                self.imageView.transform = transform1.concatenating(transform2)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5, animations: {
                self.imageView.transform = transform4.concatenating(transform3)
                self.imageView.alpha = 0.2
            })
        }) { (finished) in
            print("animation done")
            self.imageView.transform = .identity
            self.imageView.alpha = 1
            self.imageView.removeFromSuperview()
        }
    }
}

