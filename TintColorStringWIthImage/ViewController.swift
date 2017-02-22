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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createLabel()

        let formattedString = ImageUtility.createAttributedString(text: " Hello This is string with image", image: UIImage(named: "swift_logo")!, imagePos: .start, imageColor: .green)
        
        //let formattedString = ImageUtility.createAttributedString(text: "Hello This is string with image", image: UIImage(named: "swift_logo")!, imagePos: .end, imageColor: .cyan  )
        label.attributedText = formattedString

    }
    
    func createLabel() {
        label.numberOfLines = 0
        view.addSubview(label)
        label.center = view.center
        label.textColor = UIColor.blue
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

