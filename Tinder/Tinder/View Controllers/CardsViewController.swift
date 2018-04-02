//
//  ViewController.swift
//  Tinder
//
//  Created by Sarah Villegas  on 4/1/18.
//  Copyright © 2018 Sarah Villegas . All rights reserved.
//

import UIKit

class CardsViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var profileImageView: UIImageView!
    
    var cardInitialCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Here we use the method didPan(sender:), which we defined in the previous step, as the action.
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didPan(_:)))
        
       
        profileImageView.isUserInteractionEnabled = true
        profileImageView.addGestureRecognizer(panGestureRecognizer)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
    @IBAction func didPan(_ sender: UIPanGestureRecognizer) {
        
        let location = sender.location(in: view)
        let velocity = sender.velocity(in: view)
        let translation = sender.translation(in: view)
        
        if sender.state == .began {
            print("Gesture began")
            
            profileImageView.transform = CGAffineTransform(rotationAngle: CGFloat(45 * M_PI / 180))
        } else if sender.state == .changed {
            print("Gesture is changing")
            
            
            if location.x < profileImageView.center.x{
                
                //Swipe Left
                profileImageView.transform = view.transform.rotated(by: CGFloat(-45 * M_PI / 180))
            }
            else{
                
                //Swipe Right
                profileImageView.transform = view.transform.rotated(by: CGFloat(45 * M_PI / 180))
            }
            
            
        } else if sender.state == .ended {
            print("Gesture ended")
            
            self.profileImageView.alpha = 1
            if translation.x > 50{
                
                UIView.animate(withDuration:0.4, animations: {
                    // This causes first view to fade in and second view to fade out
                    self.profileImageView.center = CGPoint(x: self.profileImageView.center.x + 200, y: self.profileImageView.center.y + 80 )
                    self.profileImageView.alpha = 0
                })
            }else if translation.x > 50{
                
                UIView.animate(withDuration:0.4, animations: {
                    // This causes first view to fade in and second view to fade out
                    self.profileImageView.center = CGPoint(x: self.profileImageView.center.x - 200, y: self.profileImageView.center.y + 80 )
                    self.profileImageView.alpha = 0
                })
                
            }
            
            profileImageView.transform = CGAffineTransform.identity
            
        }
        
    }
   
    
    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        
        
        performSegue(withIdentifier: "Profile", sender: nil)
    }
    
    
    
    
    
}

