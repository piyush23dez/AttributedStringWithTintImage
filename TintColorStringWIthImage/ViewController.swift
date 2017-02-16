//
//  ViewController.swift
//  TintColorStringWIthImage
//
//  Created by Piyush Sharma on 2/15/17.
//  Copyright © 2017 Piyush Sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //create a label
        let attributesStringLabel = UILabel(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 300, height: 300)))
        attributesStringLabel.numberOfLines = 0
        view.addSubview(attributesStringLabel)
        attributesStringLabel.center = view.center
        attributesStringLabel.textColor = .green
        
        //load the image
        let image = UIImage(named: "swift_logo")!.withRenderingMode(.alwaysTemplate)
        
        // create the text attachment
        let textAttachment = NSTextAttachment()
        
        // assign the loaded image to the text attachment
        textAttachment.image = image
        
        // create an attributed string with our text attachment
        let attributedStringWithImage = NSAttributedString(attachment: textAttachment)
        
        // now create the full string to display
        let stringToDisplay = "This string has a image with color"
        let fullAttributedString = NSMutableAttributedString(string: "\(stringToDisplay) ")
        
        // append space the string to display with our string containing the image
        fullAttributedString.append(attributedStringWithImage)
        
        // color the image part of the string
        fullAttributedString.addAttribute(
            NSForegroundColorAttributeName,
            value: UIColor.gray,
            range: NSMakeRange(
                stringToDisplay.characters.distance(from: stringToDisplay.startIndex, to: stringToDisplay.endIndex), attributedStringWithImage.length))
        
        // assign it to the label
        attributesStringLabel.attributedText = fullAttributedString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

