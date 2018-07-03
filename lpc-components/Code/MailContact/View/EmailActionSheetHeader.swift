//
//  EmailActionSheetHeader.swift
//  LPCComponents
//
//  Created by Alaeddine Ouertani on 13/06/2018.
//  Copyright © 2018 Lakooz. All rights reserved.
//

import UIKit

final class EmailActionSheetHeader: UIView {
    
    static let viewHeight: CGFloat = 180
    
    // MARK: Overrides
    
    @IBOutlet weak private var ibImageView: UIImageView!
    @IBOutlet weak private var ibTitleLabel: UILabel!
    @IBOutlet weak private var ibMessageLabel: UILabel!
    @IBOutlet weak private var ibEmailLabel: UILabel!
    
    // MARK: Properties
    
    var title: String = "" {
        didSet {
            self.ibTitleLabel.text = self.title
        }
    }
    
    var message: String = "" {
        didSet {
            self.ibMessageLabel.text = self.message
        }
    }
    
    var contactEmail: String = "" {
        didSet {
            self.ibEmailLabel.text = self.contactEmail
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("This custom view must not be used inside a .xib file")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        if let view = loadNib() {
            view.frame = bounds
            addSubview(view)
        }
    }
}
