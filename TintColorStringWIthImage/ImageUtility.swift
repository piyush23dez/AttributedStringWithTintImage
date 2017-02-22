//
//  ImageUtility.swift
//  TintColorStringWIthImage
//
//  Created by Piyush Sharma on 2/21/17.
//  Copyright © 2017 Piyush Sharma. All rights reserved.
//

import UIKit

class ImageUtility {
    
    enum ImagePosition {
        case start, end
    }
    
    static func createAttributedString(text: String, image: UIImage, imagePos: ImagePosition, imageColor: UIColor) -> NSMutableAttributedString {
        
        var range = NSMakeRange(0, 0)
        let attachment = NSTextAttachment()
        
        attachment.bounds = CGRect(origin: CGPoint(x: 0, y: -2), size: CGSize(width: 15, height: 15))
        
        // image must be set to Template rendering mode
        attachment.image = image
        
        //create a string with image attachment
        let attachmentString = NSAttributedString(attachment: attachment)
        
        //create a title NSMutableAttributedString
        let title = NSMutableAttributedString(string: text)
        
        // Need to use a space, or this bug/feature isn't activated
        let fullString = NSMutableAttributedString(string: " ")
        
        switch imagePos {
            
        case .start:
            
            //append attachment string to full string
            fullString.append(attachmentString)
            
            //append title to the start of text provided
            fullString.append(title)
            
            //assign range for image
            range = NSMakeRange(0, 2)
            
            fullString.addAttribute(NSForegroundColorAttributeName, value: imageColor, range: range)
            return fullString

        case .end:
            
            //append attachment string to full string
            fullString.append(attachmentString)
            
            //append image to the end of text provided
            title.append(fullString)
            
            //assign range for image
            range = NSMakeRange(text.characters.count, 1)
            
            title.addAttribute(NSForegroundColorAttributeName, value: imageColor, range: range)
            return title

        }
        
    }
}
