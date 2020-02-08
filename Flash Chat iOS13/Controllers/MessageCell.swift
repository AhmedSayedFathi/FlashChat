//
//  MessageCell.swift
//  Flash Chat iOS13
//
//  Created by Ahmed Sayed Fathi on 1/23/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

//MARK:-
//MARK:- File header

import UIKit

class MessageCell: UITableViewCell {

//MARK:-
//MARK:- Outlets
    
    @IBOutlet weak var messageBubble: UIView!
    @IBOutlet weak var body: UILabel!
    @IBOutlet weak var recieverAvatar: UIImageView!
    @IBOutlet weak var senderAvatar: UIImageView!

//MARK:-
//MARK:- awakeFromNib
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        Constants.makeCornersRoundedFor(View: messageBubble)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
//MARK:-
//MARK:- End of file
    
}
