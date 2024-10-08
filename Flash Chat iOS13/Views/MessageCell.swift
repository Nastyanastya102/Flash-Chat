//
//  MessageCell.swift
//  Flash Chat iOS13
//
//  Created by Nastya Klyashtorna on 2024-10-06.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    @IBOutlet weak var messageBuble: UIView!
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        messageBuble.layer.cornerRadius = messageBuble.frame.size.height / 5
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
