//
//  KeyboardViewController.swift
//  Keyboard
//
//  Created by Maslov Sergey on 06.06.16.
//  Copyright © 2016 ROKOLABS. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {
    @IBOutlet weak var hintView: UIView!
    @IBOutlet weak var hintButton: UIButton!
    @IBOutlet weak var keyboardView: UIView!
    @IBOutlet weak var buttonShare: UIButton!
    @IBOutlet weak var labelInfo: UILabel!
    @IBOutlet weak var buttonDelete: UIButton!
    
    var longPress: UILongPressGestureRecognizer!
    
    @IBOutlet weak var stickersPanel: StickersPanel!
    @IBOutlet weak var stickersPackPanel: StickerPacksPanel!
    
    var dataSource: ROKOPortalStickersDataSource!
    var stickersDataProvider = StickersDataProvider()
    var guid = NSUUID().uuidString
    var deepLink: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stickersDataProvider.getWarmCache {
            self.stickersPackPanel.reloadCollection()
            self.stickersPanel.reloadCollection()
        }
        
        loadKeyboard()
        configureStikers()
        hintView.isHidden = true
        configuteHintButton()
        
        longPress = UILongPressGestureRecognizer(target: self, action: #selector(KeyboardViewController.handleLongPress(_:)))
        longPress.minimumPressDuration = 0.5
        longPress.numberOfTouchesRequired = 1
        longPress.allowableMovement = 44.0
        
        buttonDelete.addGestureRecognizer(longPress)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guid = NSUUID().uuidString
        ROKOStickers.logEnteredStickersPanel()
        
        if (deepLink == nil) {
            // We create Refferal link.
            let manager = ROKOLinkManager()
            manager.createLink(withName: nil, type: .share, sourceURL: nil, channelName: nil, sharingCode: nil, advancedSettings: nil, completionBlock: {
                [weak self] linkURL, linkId, error in
                if error == nil, let url = linkURL{
                    self?.deepLink = url
                }
            })
        }
        
        
        stickersPackPanel.scrollTo()
    }
    
    override func advanceToNextInputMode() {
        super.advanceToNextInputMode()
        updateBackground()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        updateBackground()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateBackground()
    }
    
    fileprivate func updateBackground() {
        if self.textDocumentProxy.keyboardAppearance == .dark {
            keyboardView.backgroundColor = UIColor.darkGray
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // For better memory drain - we manually remove all
        hintView.removeFromSuperview()
        hintButton.removeFromSuperview()
        keyboardView.removeFromSuperview()
        buttonShare.removeFromSuperview()
        labelInfo.removeFromSuperview()
        
        stickersPanel.removeFromSuperview()
        stickersPackPanel.removeFromSuperview()
        buttonDelete.removeGestureRecognizer(longPress)
        
        dataSource = nil
        stickersDataProvider.stickerPacks?.removeAll()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func clickGlobe(_ sender: AnyObject) {
        ROKOStickers.logExitedStickersPanel()
        advanceToNextInputMode()
    }
    
    @IBAction func clickHide(_ sender: AnyObject) {
        self.dismissKeyboard()
    }
    
    @IBAction func clickShare(_ sender: AnyObject) {
        let link = deepLink ?? kAppLink
        self.textDocumentProxy.insertText(kGreetingText + link)
        
        ROKOStickers.logSharedImage(withId: self.guid)
    }
    
    @IBAction func clickDelete(_ sender: AnyObject) {
        deleteSimbolOnTextEdit()
    }
    
    func handleLongPress(_ gestureRecognizer: UIGestureRecognizer) {
        deleteSimbolOnTextEdit()
    }
    
    fileprivate func deleteSimbolOnTextEdit(){
        textDocumentProxy.deleteBackward()
    }
    
    fileprivate func loadKeyboard(){
        Bundle.main.loadNibNamed("KeyboardViewController", owner: self, options: nil)
        self.keyboardView.frame = self.view.frame
        self.view.addSubview(self.keyboardView)
    }
    
    fileprivate func configuteHintButton() {
        hintView.backgroundColor = UIColor(red: 32/255.0, green: 59/255.0, blue: 104/255.0, alpha: 0.7)
        
        let fontSize:CGFloat = 16.0
        let button = UIButton(frame: CGRect(x:0, y: 0, width: 140, height: 100))
        hintButton = button
        let font1 = UIFont(name: "SFUIText-Regular", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
        let font2 = UIFont(name: "SFUIText-Bold", size:fontSize) ?? UIFont.systemFont(ofSize: fontSize)
        let color = UIColor.white
        
        let myNormalAttributedTitle = NSMutableAttributedString(string: "Copied to the clipboard. Now tap and\n",
                                                                attributes: [NSFontAttributeName : font1, NSForegroundColorAttributeName: color ])
        
        let myBoldAttributedTitle = NSAttributedString(string: " paste ",
                                                       attributes: [NSFontAttributeName : font2, NSForegroundColorAttributeName: color])
        let myLastAttributedTitle = NSAttributedString(string: " into the message field",
                                                       attributes: [NSFontAttributeName : font1, NSForegroundColorAttributeName: color])
        myNormalAttributedTitle.append(myBoldAttributedTitle)
        myNormalAttributedTitle.append(myLastAttributedTitle)
        hintButton.translatesAutoresizingMaskIntoConstraints = false
        hintButton.setAttributedTitle(myNormalAttributedTitle, for: .normal)
        
        
        hintButton.layer.cornerRadius = 10
        hintButton.titleLabel!.numberOfLines = 2
        hintButton.titleLabel!.lineBreakMode = .byWordWrapping;
        hintButton.titleLabel!.textAlignment = .center;
        
        
        hintView.addSubview(hintButton)
        
        let centerX = NSLayoutConstraint(item: hintView, attribute: .centerX, relatedBy: .equal, toItem: hintButton, attribute: .centerX, multiplier: 1, constant: 0)
        
        let centerY = NSLayoutConstraint(item: hintView, attribute: .centerY, relatedBy: .equal, toItem: hintButton, attribute: .centerY, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([centerX, centerY])
    }
    
    fileprivate func configureStikers(){
        stickersPanel.delegate = self
        stickersPackPanel.delegate = self
        
        let isDefaultPackProvided = stickersDataProvider.loadData()
        if  isDefaultPackProvided {
            stickersPanel.configure(withDatasource: stickersDataProvider)
            stickersPackPanel.configure(withDatasource: stickersDataProvider, stickersPanel: stickersPanel)
            
            if let oldPackIndex = UserDefaults.standard.object(forKey: kLastPackKey) as? Int {
                if oldPackIndex < (stickersDataProvider.numberOfStickerPacks()) {
                    stickersPackPanel.selectedPackIndex = oldPackIndex
                    stickersPanel.selectedPackIndex = oldPackIndex
                    let info = stickersDataProvider.composer(infoForStickerPackAt: oldPackIndex)
                    labelInfo.text = info.name
                }
            }
            
            stickersPanel.reloadCollection()
            stickersPackPanel.reloadCollection()
        }
        
        dataSource =  ROKOPortalStickersDataSource(manager: ROKOComponentManager.shared())
        dataSource.reloadStickers { [weak self](object, error) in
            if error == nil {
                if let stickerPacks = object as? [ROKOStickerPack] {
                    self?.stickersDataProvider.initWithDataSource(stickerPacks: stickerPacks)
                    
                    var packsCount = stickerPacks.count
                    for pack in stickerPacks {
                        StickerCache.load(stickerPack: pack) { (pack) in
                            packsCount = packsCount - 1
                            if packsCount == 0 {
                                DispatchQueue.main.async() { () -> Void in
                                    self?.stickersPanel.reloadCollection()
                                    self?.stickersPackPanel.reloadCollection()
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    fileprivate func hideHint(){
        self.hintView.isHidden = true
    }
    
    fileprivate func showHint(){
        self.hintView.isHidden = false
        self.hintView.alpha = 0
        UIView.animate(withDuration: kPressPasteTitleAppearDuration, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.hintView!.alpha = 1
        }, completion: { (Bool) -> () in
            UIView.animate(withDuration: kPressPasteTitleAppearDuration, delay: kPressPasteTitleShowDuration, options: UIViewAnimationOptions.curveEaseOut, animations: {
                self.hintView!.alpha = 0
            }, completion: nil)
        })
    }
}

extension KeyboardViewController: StickersPanelDelegate {
    func didSelect(image: UIImage!, pack: ROKOStickerPack, stickerInfo: ROKOSticker) {
        if let image = image!.resizeImage(scale: CGFloat(stickerInfo.scaleFactor)) {
            ClipboardManager.copy(image)
            
            let info = RLStickerInfo()
            info.stickerID = stickerInfo.imageInfo.objectId as Int
            info.scale = CGFloat(stickerInfo.scaleFactor)
            
            let packInfo = RLStickerPackInfo()
            packInfo.packID = pack.objectId as Int
            packInfo.title = pack.name
            ROKOStickers.logStickerSelection(info, inPack: packInfo, withImageId: guid)
            
            
            let item = ROKOStickersEventItem()
            item.stickerId = stickerInfo.objectId as Int
            item.stickerPackId = pack.objectId as Int
            item.stickerPackName = pack.name
            ROKOStickers.logSaving(withStickers: [item], onImageWithId: guid, fromCamera: false)
            showHint()
        }
    }
}

extension KeyboardViewController: StickerPacksPanelDelegate {
    func didSelectPack(at packPosition: Int) {
        UserDefaults.standard.set(packPosition, forKey: kLastPackKey)
        let info = stickersDataProvider.composer(infoForStickerPackAt: packPosition)
        labelInfo.text = info.name
    }
}
