//
//  Fstore.swift
//  Flash Chat iOS13
//
//  Created by Ahmed Sayed Fathi on 2/3/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import Foundation
import Firebase

struct Fstore {

//MARK:-
//MARK:- Constants
    
    struct FstoreConstants {
        
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
    
//MARK:-
//MARK:- References
    
    static let db = Firestore.firestore()
    static var messages:[Message] = []
    
//MARK:-
//MARK:- Load messages from Firestore
    
    static func loadMessagesInto(TableView tableView: UITableView, ViewController viewController: UIViewController) {
        
        db.collection(FstoreConstants
            .collectionName).order(by: FstoreConstants.dateField)
            .addSnapshotListener { (querySnapShot, error) in
                
                self.messages = []
                
                if let error = error {
                    
                    Constants.popUpAlertWith(title: "Alert", body: error.localizedDescription, viewController)
                }
                
                if let snapShotDocuments = querySnapShot?.documents {
                    
                    for doc in snapShotDocuments {
                        
                        let data = doc.data()
                        
                        if let body = data[FstoreConstants.bodyField] as? String, let sender = data[FstoreConstants.senderField] as? String {
                            
                            let newMessage = Message(sender: sender, body: body)
                            
                            self.messages.append(newMessage)
                            
                            DispatchQueue.main.async {
                                
                                tableView.reloadData()
                                let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                                tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                                
                            }
                        }
                    }
                }
        }
    }
    
//MARK:-
//MARK:- Save data into Firestore
    
    static func saveIntoFirestore(sender messageSender:String, body messageBody:String, ViewController viewController:UIViewController) {
        
        db.collection(FstoreConstants.collectionName).addDocument(data: [FstoreConstants.senderField:messageSender, FstoreConstants.bodyField: messageBody, FstoreConstants.dateField: Date().timeIntervalSince1970]) { (error) in
            
            if let error = error {
                Constants.popUpAlertWith(title: "Faliure", body: error.localizedDescription, viewController)
                
            }
        }
    }
    
//MARK:-
//MARK:- Sign out
    
    static func signOut(ViewController viewController: UIViewController) {
        
        do {
            
            try Auth.auth().signOut()
            viewController.navigationController!.popToRootViewController(animated: true)
            
        }
            
        catch let signOutError {
            
            Constants.popUpAlertWith(title: "Faliure", body: signOutError.localizedDescription, viewController)
            
        }
    }
}



