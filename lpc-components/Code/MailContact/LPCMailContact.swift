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
    
    // MARK: Properties
    
    let viewController: UIViewController!
    let sender: UIView?
    let image: UIImage!
    let title: String!
    let message: String!
    let contactEmail: String!
    let openText: String!
    let copyText: String!
    let cancelText: String!
    let mailComposeDelegate: MFMailComposeViewControllerDelegate!
    let contactActionsDelegate: ContactActionsDelegate!
    
    // MARK: Constructors
    
    public init(_ viewController: UIViewController,
                sender: UIView? = nil,
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
        self.sender = sender
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
                            sender: UIView? = nil,
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
        
        self.init(viewController, sender: sender, image: image, title: title, message: message, contactEmail: contactEmail, openText: openText, copyText: copyText, cancelText: cancelText, mailComposeDelegate: mailComposeDelegate, contactActionsDelegate: contactActionsDelegate)
    }
    
    // MARK: Public Methods
    
    public final func show(isIPad: Bool = false) {
        let actionSheetController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        if isIPad {
            actionSheetController.prepareHeader(headerHeight: EmailActionSheetHeader.viewHeight)
        } else {
            let header = EmailActionSheetHeader(frame: CGRect(x: 0, y: 0, width: actionSheetController.view.bounds.size.width, height: EmailActionSheetHeader.viewHeight))
            header.image = self.image
            header.title = self.title
            header.message = self.message
            header.contactEmail = self.contactEmail
            actionSheetController.addHeader(header)
        }
        
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
        
        let copyAdressActionButton = UIAlertAction(title: self.copyText, style: .default) { _ -> Void in
            //Mail copied
            UIPasteboard.general.string = self.contactEmail
            self.contactActionsDelegate.onCopyMail()
        }
        actionSheetController.addAction(copyAdressActionButton)
        
        if let popoverController = actionSheetController.popoverPresentationController, let sender = self.sender {
            popoverController.sourceView = sender
            popoverController.sourceRect = CGRect(x: sender.bounds.midX, y: sender.bounds.midY, width: 0, height: 0)
        }
        
        self.viewController.present(actionSheetController, animated: true, completion: {
            if isIPad {
                let header = EmailActionSheetHeader(frame: CGRect(x: 15, y: 0, width: actionSheetController.view.bounds.size.width, height: EmailActionSheetHeader.viewHeight))
                header.image = self.image
                header.title = self.title
                header.message = self.message
                header.contactEmail = self.contactEmail
                actionSheetController.view.addSubview(header)
            }
        })
    }
}
