//
//  KeyboardViewController.swift
//  Keyboard
//
//  Created by Maslov Sergey on 06.06.16.
//  Copyright © 2016 ROKOLABS. All rights reserved.
//

import UIKit

enum KeyboardType {
    case stickers
    case letters
    case numbers
    
    func controller() -> UIViewController & KeyboardController {
        switch self {
        case .stickers:
            let stickersController = StickersViewController(nibName: "KeyboardViewController", bundle: nil)
            return stickersController
        case .letters:
            let lettersController = LettersViewController(nibName: "LettersViewController", bundle: nil)
            return lettersController
        case .numbers:
            let lettersController = LettersViewController(nibName: "NumbersViewController", bundle: nil)
            return lettersController
        }
    }
}

protocol KeyboardContolPanelController {
    func backspacePressed()
    func globePressed()
    func numericButtonPressed()
    func alphabetButtonPressed()
}

class KeyboardViewController: UIInputViewController {
    var heightConstraint: NSLayoutConstraint?
    
    var type = KeyboardType.stickers {
        didSet {
            self.reloadKeyboard()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.reloadKeyboard()
    }
    
    override func advanceToNextInputMode() {
        super.advanceToNextInputMode()
        updateBackground()
    }
    
    fileprivate func updateBackground() {
        if self.textDocumentProxy.keyboardAppearance == .dark {
            self.view.backgroundColor = UIColor.darkGray
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        updateBackground()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateBackground()
    }
    
    private func reloadKeyboard() {
        if let oldKeyboard = self.childViewControllers.first {
            oldKeyboard.view.removeFromSuperview()
            oldKeyboard.removeFromParentViewController()
        }
        let keyboard = self.type.controller()
        keyboard.view.frame = self.view.bounds
        keyboard.view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.view.addSubview(keyboard.view)
        self.addChildViewController(keyboard)
        keyboard.configureKeyboard()
        
        
        self.setHeight(keyboard.height)

    }
    
    func setHeight(_ height: CGFloat) {
        if heightConstraint == nil {
            heightConstraint = NSLayoutConstraint(item: view,
                                                  attribute: .height,
                                                  relatedBy: .equal,
                                                  toItem: nil,
                                                  attribute: .notAnAttribute,
                                                  multiplier: 1,
                                                  constant: height)
            heightConstraint!.priority = UILayoutPriority.required
            
            view.addConstraint(heightConstraint!)
        }
        else {
            heightConstraint?.constant = height
        }
    }
}

extension KeyboardViewController: KeyboardContolPanelController {
    func backspacePressed() {
        switch textDocumentProxy.documentContextBeforeInput {
        case let s where s?.hasSuffix("    ") == true: // Cursor in front of tab, so delete tab.
            for _ in 0..<4 { // TODO: Update to use tab setting.
                textDocumentProxy.deleteBackward()
            }
        default:
            textDocumentProxy.deleteBackward()
        }
    }
    
    func globePressed() {
        advanceToNextInputMode()
    }
    
    func numericButtonPressed() {
        
    }
    
    func alphabetButtonPressed() {
        
    }
}
