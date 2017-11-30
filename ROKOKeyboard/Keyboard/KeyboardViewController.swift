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
}

extension KeyboardType {
    func nextType() -> KeyboardType? {
        switch self {
        case .stickers:
            return nil;
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
        let stickers = StickersViewController(nibName: "KeyboardViewController", bundle: nil)
        stickers.view.frame = self.view.bounds
        stickers.view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.view.addSubview(stickers.view)
        self.addChildViewController(stickers)
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
        guard let nextType = self.type.nextType() else {
            advanceToNextInputMode()
            return
        }
        self.type = nextType;
    }
    
    func numericButtonPressed() {
        
    }
    
    func alphabetButtonPressed() {
        
    }
}
