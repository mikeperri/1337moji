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
    
    lazy var keys = _1337mojis.get()
    
    var nextKeyboardButton: UIButton!
    var backspaceButton: UIButton!
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return keys.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! KeyCell
        let keyData = keys[indexPath.item]
        cell.label.text = keyData
        
        return cell
    }
    
    // 1337moji was tapped
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let keyData = keys[indexPath.item]
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
}
