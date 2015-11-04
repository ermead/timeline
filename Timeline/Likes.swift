//
//  Likes.swift
//  Timeline
//
//  Created by Eric Mead on 11/3/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import Foundation

struct Like: Equatable {
    
    var username: String
    var postIdentifier: String
    var identifier: String?
    
    init(username: String, postIdentifier: String, identifier: String = ""){
        
        self.username = username
        self.postIdentifier = postIdentifier
        self.identifier = identifier
    }
   
}

func == (lhs: Like, rhs: Like)-> Bool {
    
    return (lhs.username == rhs.username) && (lhs.identifier == rhs.identifier)
    
    }









//Like
//
//Create a 'Like' model struct that will hold a username, and reference to the parent Post.
//
//Create a Like.swift class file and define a new Like struct
//Add properties for username, postIdentifier, and optional identifier
//Add a memberwise initializer that takes parameters for each property
//Set a default parameter nil for optional properties
//Implement the Equatable protocol by comparing the username and identifier
//The model objects will later conform to a FirebaseType protocol that will ease working with Firebase. You will add the required properties and functions at that point.
