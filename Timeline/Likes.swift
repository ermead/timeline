//
//  Likes.swift
//  Timeline
//
//  Created by Eric Mead on 11/3/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import Foundation
struct Like: Equatable, FirebaseType {
    
    private let UserKey = "username"
    private let PostKey = "post"
    
    let username: String
    let postIdentifier: String
    var identifier: String?
    
    init(username: String, postIdentifier: String, identifier: String? = nil) {
        
        self.username = username
        self.postIdentifier = postIdentifier
        self.identifier = identifier
    }
    
    // MARK: FirebaseType
    
    var endpoint: String {
        
        return "/posts/\(self.postIdentifier)/likes/"
    }
    
    var jsonValue: [String: AnyObject] {
        
        return [UserKey: self.username, PostKey: self.postIdentifier]
    }
    
    init?(json: [String: AnyObject], identifier: String) {
        
        guard let postIdentifier = json[PostKey] as? String,
            let username = json[UserKey] as? String else {
                
                self.identifier = ""
                self.postIdentifier = ""
                self.username = ""
                
                return nil
        }
        
        self.postIdentifier = postIdentifier
        self.username = username
        self.identifier = identifier
    }
}

func ==(lhs: Like, rhs: Like) -> Bool {
    
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
