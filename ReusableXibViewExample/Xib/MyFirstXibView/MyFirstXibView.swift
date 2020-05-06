//
//  MyFirstXibView.swift
//  ReusableXibViewExample
//
//  Created by Moly on 2020/05/06.
//  Copyright © 2020 moly. All rights reserved.
//

import UIKit

class MyFirstXibView: BaseNibView {
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myButton: UIButton!
    
    @IBInspectable
    public var myXibViewTone: UIColor = .black {
        didSet {
            myImageView.backgroundColor = myXibViewTone
            myLabel.textColor = myXibViewTone
            myButton.setTitleColor(myXibViewTone, for: .normal)
        }
    }
    
    override func awakeFromNib() {
        myLabel?.text = "Awake Man!"
    }
}
