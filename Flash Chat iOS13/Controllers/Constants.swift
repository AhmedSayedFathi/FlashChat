//
//  Constants.swift
//  Flash Chat iOS13
//
//  Created by Ahmed Sayed Fathi on 1/21/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import Foundation
import UIKit
import Firebase

struct Constants {
    
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    static let appName = "⚡️FlashChat"
    static let friendCellNibName = "FriendsCell"
    static let friendCellIdentifier = "FriendsTableViewCell"

//MARK:-
//MARK:- Segues Identifires
    
    enum Segues:String {
        case HomeToLogin, HomeToRegister, LoginToChat, RegisterToChat
    }
    
    
//MARK:-
//MARK:- Brand Colors
        
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }

    
//MARK:-
//MARK:- Commonly reused Functions

//MARK:-
//MARK:- Pop up an alert

    static func popUpAlertWith(title alertTitle:String, body alertBody:String, _ viewController:UIViewController) {
    
        let alertAction = UIAlertController(title: alertTitle, message: alertBody, preferredStyle: UIAlertController.Style.alert)
                
        alertAction.addAction(UIAlertAction(title: "OK", style:UIAlertAction.Style.cancel, handler: nil))
            
        viewController.present(alertAction, animated: true, completion: nil)
    }

//MARK:-
//MARK:- Typing Animation

    static func doTypingAnimationFor(Label label:UILabel) {
                
        if label.text != nil {
            
            var charIndex = 0.0
            let titleText = label.text!
            label.text! = ""
                
            for letter in titleText {
                        
                Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { (timer) in
                                
                    label.text!.append(letter)
                }
                            
                charIndex += 1
            }
                        
        }
        
        else {
            print("Can't do typing animation for empty label")
        }
    }

//MARK:-
//MARK:- Button rounded corners

    static func makeCornersRoundedFor(View view: UIView) {
        
            view.layer.cornerRadius = view.frame.height / 5
    }
            
//MARK:-
//MARK:- Update MessageCell UI
            
    static func updateUIFor(MessageCell cell: MessageCell,
                            CurrentUser user: Bool) {
                
        if user == true {
            cell.senderAvatar.isHidden = false
            cell.recieverAvatar.isHidden = true
            cell.messageBubble.backgroundColor = UIColor(named: "senderMessageBackground")
        }
            
        else {
            cell.senderAvatar.isHidden = true
            cell.recieverAvatar.isHidden = false
            cell.messageBubble.backgroundColor = UIColor(named: "recieverMessageBackground")
        }
    }
}

//MARK:-
//MARK:- End of File


