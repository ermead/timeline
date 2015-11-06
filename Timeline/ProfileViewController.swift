//
//  ProfileViewController.swift
//  Timeline
//
//  Created by Eric Mead on 11/3/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, ProfileHeaderCollectionReusableViewDelegate {
    
    var user: User!
    var userPosts: [Post] = []


    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.userPosts = PostController.mockPosts()
        print(userPosts)
     
        
        if user == nil{
            
            user = UserController.sharedController.currentUser
        }

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        UserController.userForIdentifier(user.identifier) { (user) -> Void in
            self.updateWithUser(user!)
        }

    }
    
    @IBAction func LogoutButtonTapped(sender: UIBarButtonItem) {
        
        UserController.logOutCurrentUser()
        tabBarController?.selectedViewController = tabBarController?.viewControllers![0]
    
    }
    
    
    func updateWithUser(user: User){
        self.user = user
        self.title = user.username
        
        if user != UserController.sharedController.currentUser {
            
            // as of writing there is no system way to remove a bar button item
            // disables and hides the button
            
            self.navigationItem.rightBarButtonItem?.enabled = false
            self.navigationItem.rightBarButtonItem?.tintColor = UIColor.clearColor()
            
            self.navigationItem.leftBarButtonItem?.enabled = false
            self.navigationItem.rightBarButtonItem?.tintColor = UIColor.clearColor()
        }
        
        PostController.postsForUser(user.username) { (posts) -> Void in
            
            if let posts = posts {
                self.userPosts = posts
                self.collectionView.reloadData()
            }
        }
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let item = collectionView.dequeueReusableCellWithReuseIdentifier("photoCell", forIndexPath: indexPath) as! ProfileImageCollectionViewCell
        
        let post = userPosts[indexPath.item]
        
        item.updateWithImageIdentifier(post.imageEndPoint)
       
        
        return item
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userPosts.count
    }
    

    
    func userTappedURLButton(sender: UIButton) {
        
    }
    
    func userTappedFollowActionButton(sender: UIButton) {
        
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        let view = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "profileHeaderView", forIndexPath: indexPath) as! ProfileHeaderCollectionReusableView
        
        view.delegate = self
        
        view.updateWithUser(user)
        
        return view
    }

    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toEditProfile" {
            
            if let destinationViewController = segue.destinationViewController as? LoginSignupViewController {
                
                _ = destinationViewController.view
                
                destinationViewController.updateWithUser(self.user)
            }
            
        }
//        if segue.identifier == "toPostDetail" {
//            let cell = sender as! UICollectionViewCell
//            
//            if let selectedIndex = collectionView.indexPathForCell(cell)?.item {
//                
//                if let destinationViewController = segue.destinationViewController as? PostDetailTableViewController {
//                    
//                    _ = destinationViewController.view
//                    
//                    destinationViewController.updateWithPost(userPosts[selectedIndex])
//                }
//            }
//        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
