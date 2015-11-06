//
//  Comments.swift
//  Timeline
//
//  Created by Eric Mead on 11/3/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import Foundation

struct Comment: Equatable {
    
    var username: String
    var text: String
    var postIdentifier: String
    var identifier: String?
    
    init(username: String, text: String, postIdentifier: String, identifier: String = ""){
        
        self.username = username
        self.text = text
        self.postIdentifier = postIdentifier
        self.identifier = identifier
        
    }
    
}

func == (lhs: Comment, rhs: Comment) -> Bool {
    
    return (lhs.username == rhs.username) && (lhs.identifier == rhs.identifier)
}


//Comment
//
//Create a 'Comment' model struct that will hold a username, text, and reference to the parent Post.
//
//Create a Comment.swift class file and define a new Comment struct
//Add properties for username, text, postIdentifier, and optional identifier
//Add a memberwise initializer that takes parameters for each property
//Set a default parameter nil for optional properties
//Implement the Equatable protocol by comparing the username and identifier