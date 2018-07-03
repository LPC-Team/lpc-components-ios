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
    
    private var ibImageView: UIImageView!
    private var ibTitleLabel: UILabel!
    private var ibMessageLabel: UILabel!
    private var ibEmailLabel: UILabel!
    
    // MARK: Properties
    
    var image: UIImage? {
        didSet {
            self.ibImageView.image = self.image
        }
    }
    
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
        
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: frame.width - 30, height: frame.height)

        self.ibImageView = UIImageView(frame: CGRect(x: 0, y: 20, width: 70, height: 52))
        ibImageView.center.x = view.center.x
        view.addSubview(self.ibImageView)
        
        self.ibTitleLabel = UILabel(frame: CGRect(x: 0, y: self.ibImageView.frame.maxY + 15, width: view.frame.width, height: 21))
        self.ibTitleLabel.textAlignment = .center
        self.ibTitleLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        self.ibTitleLabel.textColor = UIColor(red: 67/255, green: 74/255, blue: 84/255, alpha: 1.0)
        view.addSubview(self.ibTitleLabel)
        
        self.ibMessageLabel = UILabel(frame: CGRect(x: 0, y: self.ibTitleLabel.frame.maxY + 15, width: view.frame.width, height: 21))
        self.ibMessageLabel.textAlignment = .center
        self.ibMessageLabel.font = UIFont.systemFont(ofSize: 15)
        self.ibMessageLabel.textColor = UIColor(red: 67/255, green: 74/255, blue: 84/255, alpha: 1.0)
        view.addSubview(self.ibMessageLabel)
        
        self.ibEmailLabel = UILabel(frame: CGRect(x: 0, y: self.ibMessageLabel.frame.maxY + 2.5, width: view.frame.width, height: 21))
        self.ibEmailLabel.textAlignment = .center
        self.ibEmailLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        self.ibEmailLabel.textColor = UIColor(red: 226/255, green: 43/255, blue: 118/255, alpha: 1.0)
        view.addSubview(self.ibEmailLabel)
        
        addSubview(view)
    }
}
