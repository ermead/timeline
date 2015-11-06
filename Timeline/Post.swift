//
//  Post.swift
//  Timeline
//
//  Created by Eric Mead on 11/3/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import Foundation
import UIKit

struct Post: Equatable, FirebaseType {
    
    private let UserKey = "username"
    private let ImageEndPointKey = "imageEndpoint"
    private let CaptionKey = "caption"
    private let CommentsKey = "comments"
    private let LikesKey = "likes"
    
    var imageEndPoint: String
    var caption: String?
    var username: String
    var comments: [Comment] = []
    var likes: [Like] = []
    var identifier: String?
    
    init(imageEndPoint: String, caption: String?, username: String = UserController.sharedController.currentUser.username, comments: [Comment] = [], likes: [Like] = [], identifier: String? = nil){
        
        self.imageEndPoint = imageEndPoint
        self.caption = caption
        self.username = username
        self.comments = comments
        self.likes = likes
        
    }
    
    // MARK: FirebaseType
    
    var endpoint: String  = "posts"
    
    var jsonValue: [String: AnyObject] {
        
        var json: [String: AnyObject] = [UserKey: self.username, ImageEndPointKey: self.imageEndPoint, CommentsKey: self.comments.map({$0.jsonValue}), LikesKey: self.likes.map({$0.jsonValue})]
        
        if let caption = self.caption {
            
            json.updateValue(caption, forKey: CaptionKey)
        }
        
        return json
    }
    
    init?(json: [String: AnyObject], identifier: String) {
        
        guard let username = json[UserKey] as? String,
            let imageEndPoint = json[ImageEndPointKey] as? String else {
                
                self.imageEndPoint = ""
                self.caption = ""
                self.username = ""
                self.identifier = ""
                
                return nil
        }
        
        self.imageEndPoint = imageEndPoint
        self.caption = json[CaptionKey] as? String
        self.username = username
        self.identifier = identifier
        
        if let commentDictionaries = json[CommentsKey] as? [String: AnyObject] {
            self.comments = commentDictionaries.flatMap({Comment(json: $0.1 as! [String : AnyObject], identifier: $0.0)})
        } else {
            self.comments = []
        }
        
        if let likeDictionaries = json[LikesKey] as? [String: AnyObject] {
            self.likes = likeDictionaries.flatMap({Like(json: $0.1 as! [String : AnyObject], identifier: $0.0)})
        } else {
            self.likes = []
        }
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