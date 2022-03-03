//
//  AccessibilityReadingSlider.swift
//  Slider
//
//  Created by Yura Zabolotin on 12.05.2021.
//  Copyright © 2021 Dmitry Nesterenko. All rights reserved.
//

import UIKit

class AccessibilityReadingSlider: Slider {
    @objc var didAccessibilityValueChanged: ((Slider) -> ())?

    @objc var increamentValue: CGFloat = 0
    override func accessibilityDecrement() {
        let newValue = fraction - CGFloat(increamentValue)
        if newValue > 0 {
            fraction = newValue
            didAccessibilityValueChanged?(self)
        }
    }
    
    override func accessibilityIncrement() {
        let newValue = fraction + CGFloat(increamentValue)
        let maxValue = 1
        if newValue < CGFloat(maxValue) {
            fraction = newValue
            didAccessibilityValueChanged?(self)
        }
    }
    
    override var accessibilityValue: String? {
        get {
            let pageIndex = Int(increamentValue > 0 ? fraction / increamentValue  : 1)
            return "\(pageIndex + 1)"
        }
        set {
            
        }
    }
}
