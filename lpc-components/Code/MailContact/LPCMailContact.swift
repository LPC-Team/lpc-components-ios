//
//  LPCComponents.swift
//  LPCComponents
//
//  Created by Alaeddine Ouertani on 13/06/2018.
//  Copyright © 2018 Lakooz. All rights reserved.
//

import UIKit
import MessageUI

public final class LPCMailContact {
    
    let viewController: UIViewController!
    let image: UIImage!
    let title: String!
    let message: String!
    let contactEmail: String!
    let openText: String!
    let copyText: String!
    let cancelText: String!
    let mailComposeDelegate: MFMailComposeViewControllerDelegate!
    let contactActionsDelegate: ContactActionsDelegate!
    
    public init(_ viewController: UIViewController,
                image: UIImage,
                title: String,
                message: String,
                contactEmail: String,
                openText: String,
                copyText: String,
                cancelText: String,
                mailComposeDelegate: MFMailComposeViewControllerDelegate,
                contactActionsDelegate: ContactActionsDelegate) {
        self.viewController = viewController
        self.image = image
        self.title = title
        self.message = message
        self.contactEmail = contactEmail
        self.openText = openText
        self.copyText = copyText
        self.cancelText = cancelText
        self.mailComposeDelegate = mailComposeDelegate
        self.contactActionsDelegate = contactActionsDelegate
    }
    
    public convenience init(_ viewController: UIViewController,
                image: UIImage,
                title: String,
                message: String,
                contactEmail: String,
                openText: String,
                copyText: String,
                cancelText: String) {
        guard let mailComposeDelegate = viewController as? MFMailComposeViewControllerDelegate else {
            fatalError("Your viewController \(viewController) must implement MFMailComposeViewControllerDelegate")
        }
        
        guard let contactActionsDelegate = viewController as? ContactActionsDelegate else {
            fatalError("Your viewController \(viewController) must implement ContactActionsDelegate")
        }
        
        self.init(viewController, image: image, title: title, message: message, contactEmail: contactEmail, openText: openText, copyText: copyText, cancelText: cancelText, mailComposeDelegate: mailComposeDelegate, contactActionsDelegate: contactActionsDelegate)
    }
    
    public final func show() {
        let actionSheetController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let header = EmailActionSheetHeader(frame: CGRect(x: 0, y: 0, width: actionSheetController.view.frame.size.width, height: EmailActionSheetHeader.viewHeight))
        header.image = self.image
        header.title = self.title
        header.message = self.message
        header.contactEmail = self.contactEmail
        actionSheetController.addHeader(header)
        
        let cancelActionButton = UIAlertAction(title: self.cancelText, style: .cancel) { _ -> Void in
        }
        actionSheetController.addAction(cancelActionButton)
        
        let sendEmailButton = UIAlertAction(title: openText, style: .default) { _ -> Void in
            let composeVC = MFMailComposeViewController()
            if MFMailComposeViewController.canSendMail() {
                composeVC.mailComposeDelegate = self.mailComposeDelegate
                composeVC.setToRecipients([self.contactEmail])
                self.viewController.present(composeVC, animated: true, completion: nil)
            }
        }
        actionSheetController.addAction(sendEmailButton)
        
        let copyAdressActionButton = UIAlertAction(title: copyText, style: .default) { _ -> Void in
            //Mail copied
            UIPasteboard.general.string = self.contactEmail
            self.contactActionsDelegate.onCopyMail()
        }
        actionSheetController.addAction(copyAdressActionButton)
        
        viewController.present(actionSheetController, animated: true)
    }
}
