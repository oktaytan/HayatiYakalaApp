//
//  UIButtonExtension.swift
//  HayatiYakala
//
//  Created by Oktay Tanrıkulu on 21.09.2020.
//

import Foundation
import UIKit

extension UIButton {
    
    func diselectedButtonBackgroundColor() {
        self.backgroundColor = .systemGray6
        self.setTitleColor(.darkGray, for: .normal)
    }
    
    func selectedButtonBackgroundColor() {
        self.backgroundColor = #colorLiteral(red: 0.3515103459, green: 0.7626091838, blue: 0.7579529881, alpha: 1)
        self.setTitleColor(.white, for: .normal)
    }
}
