//
//  LettersViewController.swift
//  Keyboard
//
//  Created by Alex Golovenkov on 02/12/2017.
//  Copyright © 2017 ROKOLABS. All rights reserved.
//

import UIKit

class LettersViewController: UIViewController, KeyboardController {
    var height: CGFloat = 216
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureKeyboard() {
        let insets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        for subview in self.view.subviews {
            guard let button = subview as? UIButton else {
                continue
            }
            let initialImage = button.backgroundImage(for: .normal)
            let image = initialImage?.resizableImage(withCapInsets: insets)
            button.setBackgroundImage(image, for: .normal)
        }
    }
    
    @IBAction func emojiButtonPressed() {
        self.keyboardController()?.type = .stickers
    }
    
    @IBAction func globeButtonPressed() {
        self.keyboardController()?.globePressed();
    }
    
    @IBAction func deleteButtonPressed() {
        self.keyboardController()?.backspacePressed()
    }
    
    @IBAction func returnButtonPressed() {
        self.keyboardController()?.textDocumentProxy.insertText("\n")
    }
    
    @IBAction func letterButtonPressed(_ button: UIButton) {
        guard let text = button.titleLabel?.text else {
            return
        }
        self.keyboardController()?.textDocumentProxy.insertText(text)
    }
    
    @IBAction func spaceTap(_ sender: UITapGestureRecognizer) {
        self.keyboardController()?.textDocumentProxy.insertText(" ")
    }
    
    @IBAction func spaceDoubleTap(_ sender: UITapGestureRecognizer) {
        self.keyboardController()?.textDocumentProxy.deleteBackward()
        self.keyboardController()?.textDocumentProxy.insertText(". ")
    }
    
}
