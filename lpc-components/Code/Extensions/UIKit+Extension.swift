//
//  UIKit+Extension.swift
//  LPCComponents
//
//  Created by Alaeddine Ouertani on 13/06/2018.
//  Copyright © 2018 Lakooz. All rights reserved.
//

import UIKit

extension UIView {
    // MARK: UIView
    
    func loadNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        if let nibName = type(of: self).description().components(separatedBy: ".").last {
            let nib = UINib(nibName: nibName, bundle: bundle)
            return nib.instantiate(withOwner: self, options: nil).first as? UIView
        }
        return nil
    }
}

extension UIAlertController {
    // MARK: UIAlertController
    
    func addHeader(_ header: UIView) {
        // FIXME: This is a hack to avoid a header view for the UIAlertAction
        let margin: CGFloat = 10.0
        let rect = CGRect(x: margin, y: margin, width: header.frame.size.width - margin * 4.0, height: header.frame.size.height)
        header.frame = rect
        
        let headerHeight = header.frame.height
        let lineBreakHeight: CGFloat = 20 // An estimation of the lineBreak height inside the title
        let lineBreakNumber = Int(headerHeight / lineBreakHeight)
        
        var title = ""
        for _ in 1...lineBreakNumber {
            title.append("\n")
        }
        
        if !title.isEmpty {
            self.title = title
            view.addSubview(header)
        }
    }
}
