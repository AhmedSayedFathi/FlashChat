//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

//MARK:-
//MARK:- File Header

import UIKit

class WelcomeViewController: UIViewController {
    
//MARK:-
//MARK:- Outlets
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!

//MARK:-
//MARK:- ViewController LifeCycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        navigationController?.navigationBar.isHidden = true
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        navigationController?.navigationBar.isHidden = false
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Constants.doTypingAnimationFor(Label: titleLabel)
        Constants.makeCornersRoundedFor(View: loginButton)
        Constants.makeCornersRoundedFor(View: registerButton)

    }
    
//MARK:-
//MARK:- LoginDidPressed
    
    @IBAction func LoginDidPressed(_ sender: Any) {
            
        //Moving on to the loginViewController
            self.performSegue(withIdentifier: Constants.Segues.HomeToLogin.rawValue, sender: self)
        
    }

//MARK:-
//MARK:- RegisterDidPressed

    @IBAction func registerDidPressed(_ sender: Any) {
        
        //Moving on to the registerViewController
            self.performSegue(withIdentifier: Constants.Segues.HomeToRegister.rawValue, sender: self)
        
    }
}
//MARK:-
//MARK:- End of File

