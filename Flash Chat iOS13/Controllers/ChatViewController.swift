//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

//MARK:-
//MARK:- File Header

import UIKit
import Firebase

class ChatViewController: UIViewController {
        
//MARK:-
//MARK:- Outlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
   
//MARK:-
//MARK:- ViewController LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    //Customzing the navigationBar
        navigationItem.title = Constants.appName
        navigationItem.hidesBackButton = true
        
    //Setting ChatViewController as the tableView Delegate & Datasource
        tableView.delegate = self
        tableView.dataSource = self
        
    //Registering the custom Message cell to the tableView
        tableView.register(UINib(nibName: Constants.cellNibName, bundle: nil), forCellReuseIdentifier: Constants.cellIdentifier)
        
    //Loading messages from FireStore once the view loaded
        
        Fstore.loadMessagesInto(TableView: tableView, ViewController: self)
    }

//MARK:-
//MARK:- Logout did pressed
    
    @IBAction func logoutDidPressed(_ sender: UIBarButtonItem) {
        
    //Signing out and heading back to the welcomeViewController
        Fstore.signOut(ViewController: self)
        
    }
    
//MARK:-
//MARK:- Send button did pressed
    
    @IBAction func sendPressed(_ sender: UIButton) {
    
    //Safely unwrapping body & sender textFields
        if let messageBody = self.messageTextfield.text, let messageSender = Auth.auth().currentUser?.email {
        
        //Saving the current message into Firestore
            Fstore.saveIntoFirestore(sender: messageSender, body: messageBody, ViewController: self)
            
        }
        
        // Reload the messages data after the new message added
        Fstore.loadMessagesInto(TableView: tableView, ViewController: self)
        
        // Clearing the message field
        messageTextfield.text! = ""
        
    }
}

//MARK:-
//MARK:- TableView Delegate & Datasource

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
        
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Fstore.messages.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let currentMessage = Fstore.messages[indexPath.row]
        
        let currentMessageCell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier) as! MessageCell 
        
        if currentMessage.sender == Auth.auth().currentUser?.email {
        
        //Update the message look as sender
            Constants.updateUIFor(MessageCell: currentMessageCell, CurrentUser: true)
            
        }
            
        else {
        
        //Update the message look as reciever
            Constants.updateUIFor(MessageCell: currentMessageCell, CurrentUser: false)
        }
        
        currentMessageCell.body.text = Fstore.messages[indexPath.row].body
        
        return currentMessageCell
    }
}
//MARK:-
//MARK:- End of File
