//
//  LayerAnimator.swift
//  lpc-components
//
//  Created by Alaeddine Ouertani on 04/07/2018.
//  Copyright © 2018 Lakooz. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore.CALayer

final class LayerAnimator: NSObject, CAAnimationDelegate {
    
    // MARK: Properties
    
    private var completionBlock: (() -> Void)?
    private var animLayer: CALayer!
    private var caAnimation: CAAnimation!
    
    // MARK: Overrides
    
    init(layer: CALayer, animation: CAAnimation) {
        super.init()
        self.animLayer = layer
        self.caAnimation = animation
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("This custom view must not be used inside a .xib file")
    }
    
    // MARK: Public Methods
    
    final func startAnimationWithBlock(block: @escaping () -> Void) {
        self.completionBlock = block
        if let caAnimation = self.caAnimation {
            caAnimation.delegate = self
            self.animLayer.removeAllAnimations()
            self.animLayer.add(caAnimation, forKey: "anim")
        }
    }
    
    final func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.animLayer.removeAllAnimations()
        self.completionBlock?()
    }
}
