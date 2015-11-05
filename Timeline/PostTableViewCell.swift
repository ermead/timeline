//
//  PostTableViewCell.swift
//  Timeline
//
//  Created by Eric Mead on 11/5/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var likes: UILabel!
    @IBOutlet weak var comments: UILabel!
    @IBOutlet weak var imageViewOutlet: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateWithPost(post: Post){
    
        self.imageViewOutlet.image = nil
        
        self.likes.text = "\(post.likes.count) likes"
        self.comments.text = "\(post.comments.count) comments"
        
        ImageController.imageForIdentifier(post.imageEndPoint) { (image) -> Void in
            self.imageViewOutlet.image = image
        }

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
