//
//  Post.swift
//  Timeline
//
//  Created by Eric Mead on 11/3/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import Foundation
import UIKit

struct Post: Equatable {
    
    var image: UIImage
    var caption: String? = nil
    var username: String
    var comments: [String] = []
    var likes: [String] = []
    var identifier: String?
    
    init(image: UIImage, caption: String = "", username: String, comments: [String] = [], likes: [String] = []){
        
        self.image = image
        self.caption = caption
        self.username = username
        self.comments = comments
        self.likes = likes
        
    }
}

func == (lhs: Post, rhs: Post) -> Bool {
    return (lhs.username == rhs.username) && (lhs.identifier == rhs.identifier)
   
    }
    








//Post
//
//Create a 'Post' model struct that will hold a pointer to an image, optional caption, username, array of comments, array of likes.
//
//Create a Post.swift file and define a new Post struct
//Add properties for imageEndPoint, caption, username, comments, likes, and optional identifier
//note: Since a Post can exist without a caption, caption is an optional property
//Add a memberwise initializer that takes parameters for each property
//Set a default parameter nil for optional properties, and empty arrays for the commments and likes
//Implement the Equatable protocol by comparing the username and identifier