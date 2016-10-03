//
//  ViewController.swift
//  1337moji
//
//  Created by Michael Perri on 12/25/15.
//  Copyright © 2015 Michael Perri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var stepsLabel: UILabel!
    var stepsString = "Open the Settings app\n"
        + "Go to General > Keyboard > Keyboards\n"
        + "Tap Add New Keyboard\n"
        + "Select 1337moji to add it\n"
    
    override func viewDidLoad() {
        let stepsAttributedString = NSMutableAttributedString(
            string: stepsString
        );
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.paragraphSpacing = 12;
        paragraphStyle.lineSpacing = 4;
        
        // bold "Settings"
        stepsAttributedString.addAttribute(
            NSFontAttributeName,
            value: UIFont.boldSystemFont(ofSize: stepsLabel.font.pointSize),
            range: NSRange(location: 9, length: 8)
        );
        
        // bold "Add New Keyboard"
        stepsAttributedString.addAttribute(
            NSFontAttributeName,
            value: UIFont.boldSystemFont(ofSize: stepsLabel.font.pointSize),
            range: NSRange(location: 63, length: 16)
        );
        
        // bold "1337moji"
        stepsAttributedString.addAttribute(
            NSFontAttributeName,
            value: UIFont.boldSystemFont(ofSize: stepsLabel.font.pointSize),
            range: NSRange(location: 87, length: 9)
        );
        
        stepsAttributedString.addAttribute(
            NSParagraphStyleAttributeName,
            value: paragraphStyle,
            range: NSRange(location: 0, length: stepsAttributedString.length)
        );
        
        stepsLabel.attributedText = stepsAttributedString;
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
