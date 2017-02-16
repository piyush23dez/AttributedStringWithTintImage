//
//  ViewController.swift
//  TintColorStringWIthImage
//
//  Created by Piyush Sharma on 2/15/17.
//  Copyright © 2017 Piyush Sharma. All rights reserved.
//  https://github.com/Raizlabs/BonMot/issues/105

import UIKit

enum ImagePosition {
    case start, end
}

class ViewController: UIViewController {
    
    let label = UILabel(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 300, height: 300)))
    let attachment = NSTextAttachment()
    let imageColor = UIColor.orange
    let stringColor = UIColor.green

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createLabel()

        createAttributedString(imagePosition: .start, text: " Hello This is string with image", image: UIImage(named: "swift_logo")!)
        
        //createAttributedString(imagePosition: .end, text: "Hello This is string with image ", image: UIImage(named: "swift_logo")!)
    }
    
    func createLabel() {
        label.numberOfLines = 0
        view.addSubview(label)
        label.center = view.center
        label.textColor = stringColor
    }
    
    func createAttributedString(imagePosition: ImagePosition, text: String, image: UIImage) {
        
        var range = NSMakeRange(0, 0)
        attachment.bounds = CGRect(origin: CGPoint(x: 0, y: -2), size: CGSize(width: 15, height: 15))

        // image must be set to Template rendering mode
        attachment.image = image
        
        //create a string with image attachment
        let attachmentString = NSAttributedString(attachment: attachment)
        
        //create a title attributed string
        let title = NSAttributedString(string: text)
        
        // Need to use a space, or this bug/feature isn't activated
        let fullString = NSMutableAttributedString(string: " ")
        
        switch imagePosition {
            
        case .start:
            //append attachment string to full string
            fullString.append(attachmentString)
            
            //append title string to full string
            fullString.append(title)
            
            //assign range for image
            range = NSMakeRange(0, 2)
        case .end:
            
            //append title string to full string
            fullString.append(title)
            
            //append attachment string to full string
            fullString.append(attachmentString)
            
            //assign range for image
            range = NSMakeRange(0, 1)
        }
        
        fullString.addAttribute(NSForegroundColorAttributeName, value: imageColor, range: range)
        label.attributedText = fullString
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

