//
//  KeyboardController.swift
//  Keyboard
//
//  Created by Alexey Golovenkov on 01/12/2017.
//  Copyright © 2017 ROKOLABS. All rights reserved.
//

import Foundation

protocol KeyboardController: class {
    
    var height: CGFloat {get set}
    
    func configureKeyboard()
}
