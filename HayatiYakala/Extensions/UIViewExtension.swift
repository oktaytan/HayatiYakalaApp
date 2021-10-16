//
//  UIViewExtension.swift
//  HayatiYakala
//
//  Created by Oktay Tanrıkulu on 20.09.2020.
//

import Foundation
import UIKit

extension UIView {
    
    
    func klavyeTasimasi() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(klavyeDegisim(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(klavyeDegisim(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func klavyeDegisim(_ notification: NSNotification) {
       
        // Klavyenin yerini değiştirme süresi
        let sure = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
        let baslangicKlavyeFrame = (notification.userInfo![UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let bitisKlavyeFrame = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        let farkY = bitisKlavyeFrame.origin.y - baslangicKlavyeFrame.origin.y + 15
        
        if notification.name.rawValue == "UIKeyboardWillShowNotification" {
            
            UIView.animateKeyframes(withDuration: sure, delay: 0.0, options: .init(rawValue: curve), animations: {
                self.frame.origin.y += farkY
            }, completion: nil)
            
        } else if notification.name.rawValue == "UIKeyboardWillHideNotification" {
            
            UIView.animateKeyframes(withDuration: sure, delay: 0.0, options: .init(rawValue: curve), animations: {
                self.frame.origin.y = 301.0
            }, completion: nil)
        }
        
        
        
    }
    
}
