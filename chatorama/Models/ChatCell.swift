//
//  ChatCellTableViewCell.swift
//  chatorama
//
//  Created by Andre Campbell on 9/29/18.
//  Copyright © 2018 Andre Campbell. All rights reserved.
//

import UIKit
import Parse

class ChatCell: UITableViewCell {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    
    var messages: PFObject! {
        didSet {
            messageLabel.text = messages.object(forKey: "text") as? String
            
            //let username = messages.object(forKey: "user")
            let user = messages.object(forKey: "user") as? PFUser
            if (user != nil) {
                userLabel.text = user?.username
            }
            else {
                userLabel.text = ""
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization codexs
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
