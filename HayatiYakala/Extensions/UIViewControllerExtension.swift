//
//  UIViewControllerExtension.swift
//  HayatiYakala
//
//  Created by Oktay Tanrıkulu on 20.09.2020.
//

import Foundation
import UIKit

extension UIViewController {
    
    func presentNew(_ viewControllerToPresent: UIViewController) {
        
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = .push
        transition.subtype = .fromRight
        self.view.window?.layer.add(transition, forKey: "presentAnimation")
        present(viewControllerToPresent, animated: false, completion: nil)
        
    }
    
    func presentSecond(_ viewControllerToPresent: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = .push
        transition.subtype = .fromRight
        guard let sunulanVC = presentedViewController else {
            return
        }
        sunulanVC.dismiss(animated: false) {
            self.view.window?.layer.add(transition, forKey: "presentAnimation")
            self.present(viewControllerToPresent, animated: false, completion: nil)
        }
    }
    
    func dissmisNew() {
        
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = .push
        transition.subtype = .fromLeft
        self.view.window?.layer.add(transition, forKey: "dismissAnimation")
        dismiss(animated: false, completion: nil)
        
    }
    
}
