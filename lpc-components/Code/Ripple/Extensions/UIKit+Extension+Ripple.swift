//
//  UIKit+Extension.swift
//  lpc-components
//
//  Created by Alaeddine Ouertani on 04/07/2018.
//  Copyright © 2018 Lakooz. All rights reserved.
//

import UIKit

extension UIColor {
    // MARK: UIColor
    
    static let lpcRedColor = UIColor(red: 96, green: 22, blue: 45)
    static let lpcDarkRedColor = UIColor(red: 227, green: 45, blue: 80)
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
}

extension UIView {
    // MARK: UIView
    
    static let maskLayerName = "masklayer"
    
    // swiftlint:disable function_body_length
    func drawAnimation(startFrame: CGRect, animationType: AnimationType) {
        
        if animationType == .reveal && !isHidden {
            return
        }
        
        if animationType == .unreveal && isHidden {
            return
        }
        
        let maskLayer = CAShapeLayer()
        let radius = sqrt(pow(frame.size.width, 2) + pow(frame.size.height, 2)) * 2
        
        let originRect: CGRect
        let newRect: CGRect
        let timingFunction: String
        
        switch animationType {
        case .reveal:
            isHidden = false
            originRect = startFrame
            newRect = CGRect(
                origin: CGPoint(
                    x: frame.size.width/2 - radius/2,
                    y: frame.size.height/2 - radius/2),
                size: CGSize(
                    width: radius,
                    height: radius))
            timingFunction = CAMediaTimingFunctionName.easeIn.rawValue
            
        case .unreveal:
            originRect = CGRect(
                origin: CGPoint(
                    x: frame.size.width/2 - radius/2,
                    y: frame.size.height/2 - radius/2),
                size: CGSize(
                    width: radius,
                    height: radius))
            newRect = startFrame
            timingFunction = CAMediaTimingFunctionName.easeOut.rawValue
        }
        
        let originPath = CGPath(ellipseIn: originRect, transform: nil)
        maskLayer.path = originPath
        
        let oldPath = maskLayer.path
        let newPath = CGPath(ellipseIn: newRect, transform: nil)
        
        layer.mask = maskLayer
        
        let revealAnimation = CABasicAnimation(keyPath: "path")
        revealAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName(rawValue: timingFunction))
        revealAnimation.fromValue = oldPath
        revealAnimation.toValue = newPath
        revealAnimation.duration = 0.33
        
        maskLayer.path = newPath
        
        LayerAnimator(layer: maskLayer, animation: revealAnimation).startAnimationWithBlock {
            if animationType == .unreveal {
                self.isHidden = true
            }
        }
    }
    
    func addGradient(startColor: UIColor, endColor: UIColor, startPointX: CGFloat = 0.0, startPointY: CGFloat = 0.0, endPointX: CGFloat = 1.0, endPoinY: CGFloat = 1.0) {
        
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.name = UIView.maskLayerName
        gradient.frame = bounds
        gradient.colors = [startColor.cgColor, endColor.cgColor]
        gradient.startPoint = CGPoint(x: startPointX, y: startPointY)
        gradient.endPoint = CGPoint(x: endPointX, y: endPoinY)
        
        layer.insertSublayer(gradient, at: 0)
    }
}

