//
//  Comments.swift
//  Timeline
//
//  Created by Eric Mead on 11/3/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import Foundation

struct Comment: Equatable, FirebaseType {
    
    private let PostKey = "post"
    private let UserKey = "username"
    private let TextKey = "text"
    
    let username: String
    let text: String
    let postIdentifier: String
    var identifier: String?
    
    init(username: String, text: String, postIdentifier: String, identifier: String? = nil) {
        
        self.postIdentifier = postIdentifier
        self.username = username
        self.text = text
        self.identifier = identifier
    }
    
    // MARK: FirbaseType
    
    var endpoint: String {
        
        return "/posts/\(self.postIdentifier)/comments/"
    }
    
    var jsonValue: [String: AnyObject] {
        
        return [PostKey: self.postIdentifier, UserKey: self.username, TextKey: self.text]
    }
    
    init?(json: [String: AnyObject], identifier: String) {
        
        guard let postIdentifier = json[PostKey] as? String,
            let username = json[UserKey] as? String,
            let text = json[TextKey] as? String else {
                
                self.postIdentifier = ""
                self.username = ""
                self.text = ""
                
                return nil
        }
        
        self.postIdentifier = postIdentifier
        self.username = username
        self.text = text
        self.identifier = identifier
    }
    
}

func ==(lhs: Comment, rhs: Comment) -> Bool {
    
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