//
//  UserController.swift
//  Timeline
//
//  Created by Eric Mead on 11/3/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import Foundation


class UserController {
    
    var currentUser: String? = nil
    
    static let sharedController = UserController()
    
    static func userForIdentifier(identifier: String, completion: (user: User?) -> Void) {
    
    }
    
    static func fetchAllUsers(completion: [User])->Void {
        
    }
    
    static func followUser(user: User, completion: (success: Bool)-> Void) {
        
    }
    
    static func userFollowsUser(user: User, checkAgainstUser: User, completion: ([User]?, success: Bool)-> Void) {
        
        
    }
    
    static func followedByUser(user: User, completion: ([User]?)-> Void) {
        
    }
    
    static func authenticateUser(email: String, password: String, completion: (success: Bool, user: User?)->Void) {
        
    }
    
    static func createUser(email: String, username: String, bio: String?, url: String?, completion: (success: Bool, user: User?)-> Void){
        
    }
    
    static func updateUser(user: User, username: String, bio: String?, url: String?, completion: (success: Bool, user: User?)-> Void){
        
    }
    
    static func logOutCurrentUser(){
        
    }
    
    static func mockUsers() -> [User] {
        
        let jim = User(username: "jim1", bio: "I am a guy", url: "www.jim.com", identifier: "12345")
        let mary = User(username: "mary45", bio: "I am a girl", url: "www.mary.com", identifier: "45678")
        let fred = User(username: "freddy44", bio: "I am a person", url: "www.freddymac.com", identifier: "98765")
        
        return [jim, mary, fred]
    }
    
    
}










//2. Add a `currentUser: User!` property that returns the current user as an implicitly unwrapped optional.
//* note: The current user's authentication details will be stored locally or set during initialization, so this can be a synchronous property.
//* note: Implicitly unwrapped optionals can be treated as optionals for checking, and as regular functions, we are building an assumption that if there is no user, the login/signup screen will be presented until there is one.
//3. Set the default value of `currentUser` property to nil.
//4. Add a static `sharedController` property that will help serve our `currentUser` consistently through the app.
//5. Define a static function `userForIdentifier` that takes an identifier and completion closure with an optional User parameter.
//
//One time sample included:
//
//```static func userForIdentifier(identifier: String, completion: (user: User?) -> Void) {
//    
//}
//```
//
//6. Define a static function `fetchAllUsers` that takes a completion closure with an array of User parameter.
//7. Define a static function `followUser` that takes a user and completion closure with a success Boolean parameter.
//8. Define a static function `userFollowsUser` that takes a user, and a user to check against, and a completion closure with a follows Boolean parameter.
//9. Define a static function `followedByUser` that takes a user and completion closure with an optional array of Users parameter.
//10. Define a static function `authenticateUser` that takes an email, password, and completion closure with a success Boolean parameter and optional User parameter.
//* note: Will be used to authenticate against our Firebase database of users.
//11. Define a static function `createUser` that takes an email, username, password, optional bio, optional url, and completion closure with a success Boolean parameter and optional User parameter.
//* note: Will be used to create a user in Firebase.
//12. Define a static function `updateUser` that takes a user, username, optional bio, optional url, and completion closure with a success Boolean parameter and optional User parameter.
//13. Define a static function `logOutCurrentUser` that takes no parameters.
//14. Define a static function `mockUsers()` that returns an array of sample users.
//15. Implement the `mockUsers()` function by returning an array of at least 3 initialized users
//16. Use the `mockUsers()` function to implement staged completion closures in the rest of your static functions with completion closures.
//17. Update the initialization of the `currentUser` to the result of the first mock user.