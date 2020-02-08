
//MARK:-
//MARK:- File Header

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {

//MARK:-
//MARK:- Outlets
    
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
//MARK:-
//MARK:- UIView Lifecycle Functions
    
    override func viewWillAppear(_ animated: Bool) {
        
        Constants.makeCornersRoundedFor(View: registerButton)
        emailTextfield.becomeFirstResponder()
        
    }
    
//MARK:-
//MARK:- RegisterButtonDidPressed
    
    @IBAction func registerDidPressed(_ sender: UIButton) {
        
        // Safe unwrapp password & email textFields
        if let password = passwordTextfield.text, let email = emailTextfield.text {
            
            // Adding user to firebase
            Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
                
                if let error = error {
                    
                //If there is an error, Popup will be shown to the user
                    Constants.popUpAlertWith(title: "Alert", body: error.localizedDescription, self)
                    
                }
                    
                else {
                    
                    // Moving on to the chatViewController
                    self.performSegue(withIdentifier: "RegisterToChat", sender: self)
                    
                }
            }
        }
    }
}
//MARK:-
//MARK:- End of File


