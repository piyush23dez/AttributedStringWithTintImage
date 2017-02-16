//
//  ViewController.swift
//  TintColorStringWIthImage
//
//  Created by Piyush Sharma on 2/15/17.
//  Copyright © 2017 Piyush Sharma. All rights reserved.
//  https://github.com/Raizlabs/BonMot/issues/105

import UIKit

class ViewController: UIViewController {
    
    let label = UILabel(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 300, height: 300)))
    let attachment = NSTextAttachment()
    let imageColor = UIColor.orange
    let stringColor = UIColor.green

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //create a label
        label.numberOfLines = 0
        view.addSubview(label)
        label.center = view.center
        label.textColor = stringColor
        
        attachment.bounds = CGRect(origin: CGPoint(x: 0, y: -2), size: CGSize(width: 15, height: 15))
        appendImageAtStart()
    }
    
    func appendImageAtEnd() {
        
        // image must be set to Template rendering mode
        attachment.image = UIImage(named: "swift_logo")
        
        //create a string with image attachment
        let attachmentString = NSAttributedString(attachment: attachment)
        
        //create a title attributed string
        let title = NSAttributedString(string: "Hello This is string with image ")
        
        // Need to use a space, or this bug/feature isn't activated
        let fullString = NSMutableAttributedString(string: " ")
        
        //append title string to full string
        fullString.append(title)
        
        //append attachment string to full string
        fullString.append(attachmentString)
        
        fullString.addAttribute(NSForegroundColorAttributeName, value: imageColor, range: NSMakeRange(0, 1))
        label.attributedText = fullString
    }
    
    func appendImageAtStart() {
        
        // image must be set to Template rendering mode
        attachment.image = UIImage(named: "swift_logo")
        
        //create a string with image attachment
        let attachmentString = NSAttributedString(attachment: attachment)
        
        //create a title attributed string
        let title = NSAttributedString(string: " Hello this is string with image")
        
        // Need to use a space, or this bug/feature isn't activated
        let fullString = NSMutableAttributedString(string: " ")
        
        //append attachment string to full string
        fullString.append(attachmentString)
        
        //append title string to full string
        fullString.append(title)
        
        fullString.addAttribute(NSForegroundColorAttributeName, value: imageColor, range: NSMakeRange(0, 2))
        label.attributedText = fullString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

