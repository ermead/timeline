//
//  User.swift
//  Timeline
//
//  Created by Eric Mead on 11/3/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import Foundation

struct User: Equatable {
    var username: String
    var bio: String?
    var url: String?
    var identifier: String
    
    
    init(username: String, bio: String = "", url: String = "", identifier: String){
        
            self.username = username
            self.bio = bio
            self.url = url
            self.identifier = identifier

    }
}

func == (lhs: User, rhs: User) -> Bool {
    
    return (lhs.username == rhs.username) && (lhs.identifier == rhs.identifier)
}


//Create a 'User' model struct that will hold a username, optional bio, and optional url.
//
//Create a User.swift file and define a new User struct
//Add properties for username, bio, url, and optional identifier
//note: Since a User can exist without a bio or url, bio and url are optional properties
//Add a memberwise initializer that takes parameters for each property
//Set a default parameter nil for optional properties
//Implement the Equatable protocol by comparing the username and identifier