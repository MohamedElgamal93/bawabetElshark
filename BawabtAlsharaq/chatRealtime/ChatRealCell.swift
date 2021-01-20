//
//  ChatRealCell.swift
//  BawabtAlsharaq
//
//  Created by MAC on 1/19/21.
//  Copyright © 2021 MM. All rights reserved.
//

import UIKit

class ChatRealCell: UITableViewCell {
    
    enum bubbleType {
        case incomming
        case outgoing
    }
    
    @IBOutlet weak var chatTeextView: UITextView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var chatTextBubble: UIView!
    @IBOutlet weak var chatStack: UIStackView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        chatTextBubble.layer.cornerRadius = 6
        // Initialization code
    }
    
    func setMessageForData(message: Message){
        userNameLabel.text = message.senderName
        chatTeextView.text = message.messageText
    }

    
    func setBubbletype (type : bubbleType) {
        if type == .incomming {
            chatStack.alignment = .trailing
            chatTextBubble.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            chatTeextView.textColor = .black
        }
        else if type == .outgoing{
            chatStack.alignment  = .leading
            chatTextBubble.backgroundColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
            chatTeextView.textColor = .white
        }
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
