//
//  PostController.swift
//  Timeline
//
//  Created by Eric Mead on 11/3/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import Foundation


class PostController {

    
    static func fetchTimelineForUser(user: User, completion: ([Post]?)-> Void){
        
    }
    static func addPost(image: String, caption: String? , completion: (success: Bool, post: Post?) ){
        
    }
    static func postFromIdentifier(identifier: String, completion: (post: Post?)-> Void ){
        
    }
    static func postsForUser(user: User, completion: ([Post]?) -> Void ){
        
    }
    static func deletePost(post: Post){
        
    }
    static func addCommentWithTextToPost(comment: String, post: Post, completion: (success: Bool, post: Post?)-> Void){
        
    }
    static func deleteComment(comment: String, completion: (success: Bool, post: Post?)-> Void){
        
    }
    static func addLikeToPost(like: Like, completion: (success: Bool, post: Post?)){
        
    }
    static func deleteLike(like: Like, completion: (success: Bool, post: Post?) -> Void){
        
    }
    static func orderPosts(originalArray: [Post]) -> [Post] {
        return []
    }
    
    static func mockPosts() -> [Post?]{
    
        let post1 = Post(image: "K1l4125TYvKMc7rcp5e", caption: "Whoa man", username: "jim1", comments: ["nice pic"], likes: ["one"])
        
        let post2 = Post(image: "K1l4125TYvKMc7rcp5f", caption: "Wow man", username: "mary4", comments: ["nice"], likes: ["two"])
        
        let post3 = Post(image: "K1l4125TYvKMc7rcp5g", caption: "Nice man", username: "freddymac", comments: ["cool pic"], likes: ["three"])
        
        return [post1, post2, post3]
    }
    
        
}

//2. Define a static function `fetchTimelineForUser` that takes a user and completion closure with an array of `Post`object  parameter.
//3. Define a static function `addPost` that takes an image, optional caption, and completion closure with a success Boolean parameter and optional `Post` parameter.
//4. Define a static function `postFromIdentifier` that takes an identifier and completion closure with optional `Post` parameter.
//5. Define a static function `postsForUser` that takes a `User` and completion closure with optional array of `Post` objects parameter.
//6. Define a static function `deletePost` that takes a `Post`.
//7. Define a static function `addCommentWithTextToPost` that takes a `String`, `Post`, and completion closure with a success Boolean parameter and optional `Post` parameter.
//8. Define a static function `deleteComment` that takes a `Comment` and completion closure with a success Boolean parameter and optional `Post` parameter.
//9. Define a static function `addLikeToPost` that takes a `Post`, and completion closure with a success Boolean parameter and optional `Post` parameter.
//10. Define a static function `deleteLike` that takes a `Like` and completion closure with a success Boolean parameter and optional `Post` parameter.
//11. Define a static function `orderPosts` that takes an array of `Post` objects and returns a sorted array of `Post` objects. For now, return an empty array.
//    12. Define a static function `mockPosts()` function that returns an array of sample posts.
//13. Implement the `mockPosts()` function by returning an array of at least 3 initalized posts.
//* note: Use a static string `-K1l4125TYvKMc7rcp5e` as the sample image identifier.
//14. Use the `mockPosts()` function to implement staged completion closures in the rest of your static functions.