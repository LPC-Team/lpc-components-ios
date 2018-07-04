//
//  LPCRippleView.swift
//  lpc-components
//
//  Created by Alaeddine Ouertani on 04/07/2018.
//  Copyright © 2018 Lakooz. All rights reserved.
//

import UIKit

final class LPCRippleView: UIView {
    
    // MARK: Private Properties
    
    private var startColor: UIColor!
    private var endColor: UIColor!
    
    // MARK: Constructors
    
    convenience init(frame: CGRect, startColor: UIColor, endColor: UIColor) {
        self.init(frame: frame)
        
        self.startColor = startColor
        self.endColor = endColor
    }
    
    override private init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Overrides
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        addGradient(startColor: self.startColor, endColor: self.endColor)
    }
}
