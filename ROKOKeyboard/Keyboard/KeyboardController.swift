//
//  KeyboardController.swift
//  Keyboard
//
//  Created by Alexey Golovenkov on 01/12/2017.
//  Copyright © 2017 ROKOLABS. All rights reserved.
//

import Foundation

let iPhoneHeight: CGFloat = 216.0
let iPhoneFullHeight: CGFloat = 258.0
let iPadHeight:CGFloat = 280.0
let iPadFullHeight:CGFloat = 313.0

protocol KeyboardController: class {
    
    var height: CGFloat {get set}
    
    func configureKeyboard()
}

extension KeyboardController where Self : UIViewController {
    func keyboardController() -> KeyboardViewController? {
        return self.parent as? KeyboardViewController
    }
    
    static func defaultHeight() -> CGFloat {
        switch UIDevice.current.userInterfaceIdiom {
        case .pad:
            return iPadHeight
        default:
            return iPhoneHeight
        }
    }
    
    static func fullHeight() -> CGFloat {
        switch UIDevice.current.userInterfaceIdiom {
        case .pad:
            return iPadFullHeight
        default:
            return iPhoneFullHeight
        }
    }
}
