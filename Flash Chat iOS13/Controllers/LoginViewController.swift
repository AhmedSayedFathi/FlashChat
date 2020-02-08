//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

//MARK:-
//MARK:- File Header

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
//MARK:-
//MARK:- Outlets
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
//MARK:-
//MARK:- UIViewController LifeCycle Functions
    
    override func viewWillAppear(_ animated: Bool) {
        
        Constants.makeCornersRoundedFor(View: loginButton)
        emailTextfield.becomeFirstResponder()
        
    }
    
//MARK:-
//MARK:- Login Did pressed
    
    @IBAction func loginDidPressed(_ sender: UIButton) {
        
    //Safe unwrapp email & password textFields
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            
            Auth.auth().signIn(withEmail: email, password: password) { (authResultOptional, errorOptional) in
                
                if let error = errorOptional {
                    
                //Pop-up an alert with the error to user
                    Constants.popUpAlertWith(title: "Alert", body: error.localizedDescription, self)
                    
                }
                    
                else {
                    
                //Moving on to loginViewController
                    self.performSegue(withIdentifier: Constants.Segues.LoginToChat.rawValue, sender: self)
                    
                }
            }
        }
    }
}
//MARK:-
//MARK:- End of File
