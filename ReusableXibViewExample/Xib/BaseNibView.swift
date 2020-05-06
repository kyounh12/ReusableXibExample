//
//  BaseNibView.swift
//  ReusableXibViewExample
//
//  Created by Moly on 2020/05/06.
//  Copyright © 2020 moly. All rights reserved.
//

import UIKit

@IBDesignable
class BaseNibView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNibContent()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNibContent()
    }
    
    // This function should be implemented to show contents in Storyboard(IB).
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        loadNibContent()
    }
    
    /// Load first UIView of Xib file having same name as class of this view.
    /// - Returns: Instantiated UIView if xib file is found, else nil.
    func loadViewFromNib() -> UIView? {
        // Find xib file having same class name
        // This is why xib file and view file should have same name
        let nibName = String(describing: type(of: self))
        
        // Bundle
        let bundle = Bundle(for: type(of: self))
        
        // Get Nib
        let nib = UINib(nibName: nibName, bundle: bundle)
        
        // Instantiate first view of xib file
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    /// Load view from xib file and add to subview.
    func loadNibContent() {
        // Load view from xib file
        if let loadedView = loadViewFromNib() {
            
            // Remove all orignal subview for safety
            for subview in subviews {
                subview.removeFromSuperview()
            }
            
            // Add to self as subview.
            addSubview(loadedView)
            
            // Set constraints to maintain same size as self.
            loadedView.scaleToFill(in: self)
        }
    }
}

extension UIView {
    /// Set constraints to maintain same size as given view.
    /// - Parameter view: UIView to fill in.
    func scaleToFill(in view: UIView) {
        // Remove autoresize masks
        self.translatesAutoresizingMaskIntoConstraints = false
        
        // Set constraints
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
    }
}
