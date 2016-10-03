//
//  KeyboardViewController.swift
//  CustomKeyboard
//
//  Created by Michael Perri on 11/29/15.
//  Copyright © 2015 Michael Perri. All rights reserved.
//

import UIKit
import AVFoundation

class KeyboardViewController: UIInputViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UIGestureRecognizerDelegate {
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    var heightConstraint: NSLayoutConstraint!
    
    lazy var keys = _1337mojis.get()
    
    var nextKeyboardButton: UIButton!
    var backspaceButton: UIButton!
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return keys.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! KeyCell
        let keyData = keys[(indexPath as NSIndexPath).item]
        cell.label.text = keyData
        
        return cell
    }
    
    // 1337moji was tapped
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let keyData = keys[(indexPath as NSIndexPath).item]
        textDocumentProxy.insertText(keyData)
    }
    
    // Next keyboard button action
    @IBAction override func advanceToNextInputMode() {
        super.advanceToNextInputMode()
    }
    
    // Backspace button action
    @IBAction func backspace() {
        self.textDocumentProxy.deleteBackward()
    }
    
    override func updateViewConstraints()
    {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
        if (view.frame.size.width == 0 || view.frame.size.height == 0) {
            return
        }
        
        setUpHeightConstraint()
    }
    
    // MARK: Set up height constraint
    func setUpHeightConstraint()
    {
        let customHeight = UIScreen.main.bounds.height / 2
        
        if heightConstraint == nil {
            heightConstraint = NSLayoutConstraint(item: view,
                                                  attribute: .height,
                                                  relatedBy: .equal,
                                                  toItem: nil,
                                                  attribute: .notAnAttribute,
                                                  multiplier: 1,
                                                  constant: customHeight)
            heightConstraint.priority = UILayoutPriority(UILayoutPriorityRequired)
            
            view.addConstraint(heightConstraint)
        }
        else {
            heightConstraint.constant = customHeight
        }
    }

}
