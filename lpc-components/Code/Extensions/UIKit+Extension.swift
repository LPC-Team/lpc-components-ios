//
//  UIKit+Extension.swift
//  LPCComponents
//
//  Created by Alaeddine Ouertani on 13/06/2018.
//  Copyright © 2018 Lakooz. All rights reserved.
//

import UIKit

extension UIAlertController {
    // MARK: UIAlertController
    
    func addHeader(_ header: UIView) {
        // FIXME: This is a hack to avoid a header view for the UIAlertAction
        let rect = CGRect(x: 0, y: 0, width: header.frame.size.width, height: header.frame.size.height)
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
