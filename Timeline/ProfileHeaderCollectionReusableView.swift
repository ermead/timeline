//
//  ProfileHeaderCollectionReusableView.swift
//  Timeline
//
//  Created by Eric Mead on 11/5/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import UIKit

class ProfileHeaderCollectionReusableView: UICollectionReusableView {
    
    var delegate: ProfileHeaderCollectionReusableViewDelegate?
 
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var followUserButton: UIButton!
    @IBOutlet weak var urlButton: UIButton!
    
    
    func updateWithUser(user: User) {
        
        if let bio = user.bio {
            bioLabel.text = bio
        } else {
            
            if bioLabel != nil {
                bioLabel.removeFromSuperview()
            }
        }
        
        if let url = user.url {
            urlButton.setTitle(url, forState: .Normal)
        } else {
            
            if urlButton != nil {
                urlButton.removeFromSuperview()
            }
        }
        
        if user == UserController.sharedController.currentUser {
            followUserButton.setTitle("You", forState: .Normal)
            followUserButton.enabled = false
        } else {
            UserController.userFollowsUser(UserController.sharedController.currentUser, followsUser: user, completion: { (follows) -> Void in
                if follows {
                    self.followUserButton.setTitle("Unfollow", forState: .Normal)
                } else {
                    self.followUserButton.setTitle("Follow", forState: .Normal)
                }
            })
            
        }
    }

    
}






protocol ProfileHeaderCollectionReusableViewDelegate {
    
    func userTappedFollowActionButton(sender: UIButton)
    func userTappedURLButton(sender: UIButton)
    
}
