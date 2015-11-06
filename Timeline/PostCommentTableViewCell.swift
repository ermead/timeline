//
//  PostCommentTableViewCell.swift
//  Timeline
//
//  Created by Eric Mead on 11/5/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import UIKit

class PostCommentTableViewCell: UITableViewCell {

    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var commentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateWithComment(comment: Comment){
        
        userNameLabel.text = comment.username
        commentLabel.text = comment.text
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
