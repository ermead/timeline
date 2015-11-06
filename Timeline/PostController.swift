//
//  PostController.swift
//  Timeline
//
//  Created by Eric Mead on 11/3/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import Foundation
import UIKit


class PostController {

    
    static func fetchTimelineForUser(user: User, completion: (posts: [Post]?)-> Void){
        
        UserController.followedByUser(user) { (followed) -> Void in
        
        if let followed = followed {
            
            var allPosts: [Post] = []
            
            let dispatchGroup = dispatch_group_create()
            
            dispatch_group_enter(dispatchGroup)
            
            postsForUser(UserController.sharedController.currentUser.username, completion: { (posts) -> Void in
                
                if let posts = posts {
                    allPosts += posts
                }
                
                dispatch_group_leave(dispatchGroup)
            })
            
            for user in followed {
                
                dispatch_group_enter(dispatchGroup)
                
                postsForUser(user.username, completion: { (posts) -> Void in
                    
                    if let posts = posts {
                        allPosts += posts
                    }
                    
                    dispatch_group_leave(dispatchGroup)
                })
            }
            
            dispatch_group_notify(dispatchGroup, dispatch_get_main_queue(), { () -> Void in
                
                let orderedPosts = orderPosts(allPosts)
                
                completion(posts: orderedPosts)
            })
        }
        }
       
    }
    
    
    static func addPost(image: UIImage, caption: String?, completion: (post: Post?) -> Void) {
        
        ImageController.uploadImage(image) { (identifier) -> Void in
            
            if let identifier = identifier {
                var post = Post(imageEndPoint: identifier, caption: caption)
                post.save()
                completion(post: post)
            } else {
                completion(post: nil)
            }
        }

    }
    static func postFromIdentifier(identifier: String, completion: (post: Post?)-> Void ){
        
        FirebaseController.dataAtEndpoint("posts/\(identifier)") { (data) -> Void in
            
            if let data = data as? [String: AnyObject] {
                let post = Post(json: data, identifier: identifier)
                
                completion(post: post)
            } else {
                completion(post: nil)
            }
        }

        
    }
    static func postsForUser(username: String, completion: (posts: [Post]?) -> Void ){
        FirebaseController.base.childByAppendingPath("posts").queryOrderedByChild("username").queryEqualToValue(username).observeSingleEventOfType(.Value, withBlock: { snapshot in
            
            
            if let postDictionaries = snapshot.value as? [String: AnyObject] {
                
                let posts = postDictionaries.flatMap({Post(json: $0.1 as! [String : AnyObject], identifier: $0.0)})
                
                let orderedPosts = orderPosts(posts)
                
                completion(posts: orderedPosts)
                
            } else {
                
                completion(posts: nil)
            }
        })
    }
    static func deletePost(post: Post, completion: (success: Bool) -> Void) {
        
        post.delete()
        
        completion(success: true)
        
    }
    static func addCommentWithTextToPost(text: String, post: Post, completion: (success: Bool, post: Post?)-> Void){
        
        if let postIdentifier = post.identifier {
            
            var comment = Comment(username: UserController.sharedController.currentUser.username, text: text, postIdentifier: postIdentifier)
            comment.save()
            
            PostController.postFromIdentifier(comment.postIdentifier) { (post) -> Void in
                completion(success: true, post: post)
            }
        } else {
            
            var post = post
            post.save()
            var comment = Comment(username: UserController.sharedController.currentUser.username, text: text, postIdentifier: post.identifier!)
            comment.save()
            
            PostController.postFromIdentifier(comment.postIdentifier) { (post) -> Void in
                completion(success: true, post: post)
            }
        }
    }
    static func deleteComment(comment: Comment, completion: (success: Bool, post: Post?)-> Void){
        
        comment.delete()
        
        PostController.postFromIdentifier(comment.postIdentifier) { (post) -> Void in
            completion(success: true, post: post)
        }

        
    }
    static func addLikeToPost(post: Post, completion: (success: Bool, post: Post?) -> Void){
        
        if let postIdentifier = post.identifier {
            
            var like = Like(username: UserController.sharedController.currentUser.username, postIdentifier: postIdentifier)
            like.save()
            
        } else {
            
            var post = post
            post.save()
            var like = Like(username: UserController.sharedController.currentUser.username, postIdentifier: post.identifier!)
            like.save()
        }
        
        PostController.postFromIdentifier(post.identifier!, completion: { (post) -> Void in
            completion(success: true, post: post)
        })
    }
    
    static func deleteLike(like: Like, completion: (success: Bool, post: Post?) -> Void){
        
        like.delete()
        
        PostController.postFromIdentifier(like.postIdentifier) { (post) -> Void in
            completion(success: true, post: post)
        }
        
    }
    
    static func orderPosts(posts: [Post]) -> [Post] {
        // sorts posts chronologically using Firebase identifiers
        return posts.sort({$0.0.identifier > $0.1.identifier})
    }
    
    static func mockPosts() -> [Post]{
    
        let sampleImageIdentifier = "-K1l4125TYvKMc7rcp5e"
        
        let like1 = Like(username: "darth", postIdentifier: "1234")
        let like2 = Like(username: "look", postIdentifier: "4566")
        let like3 = Like(username: "em0r0r", postIdentifier: "43212")
        
        let comment1 = Comment(username: "ob1kenob", text: "use the force", postIdentifier: "1234")
        let comment2 = Comment(username: "darth", text: "join the dark side", postIdentifier: "4566")
        
        let post1 = Post(imageEndPoint: sampleImageIdentifier, caption: "Nice shot!", comments: [comment1, comment2], likes: [like1, like2, like3])
        let post2 = Post(imageEndPoint: sampleImageIdentifier, caption: "Great lookin' kids!")
        let post3 = Post(imageEndPoint: sampleImageIdentifier, caption: "Love the way she looks when she smiles like that.")
        
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