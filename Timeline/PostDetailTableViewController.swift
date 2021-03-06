//
//  PostDetailTableViewController.swift
//  Timeline
//
//  Created by Eric Mead on 11/3/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import UIKit

class PostDetailTableViewController: UITableViewController {
    
    var post: Post!
    
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var imageViewOutlet: UIImageView!
    
    @IBOutlet weak var commentsLabel: UILabel!

    @IBAction func likeButtonTapped(sender: UIBarButtonItem) {
        
        print("like button tapped")
        
        PostController.addLikeToPost(post) { (success, post) -> Void in
            if let post = post {
                self.updateWithPost(post)
            }
 
        }
    }
    
    @IBAction func addCommentButtonTapped(sender: UIButton) {
        
        let commentAlert = UIAlertController(title: "Add Comment", message: nil, preferredStyle: .Alert)
        
        commentAlert.addTextFieldWithConfigurationHandler { (textfield) -> Void in
            textfield.placeholder = "Comment"
        }
        
        commentAlert.addAction(UIAlertAction(title: "Add Comment", style: .Default, handler: { (action) -> Void in
            
            if let text = commentAlert.textFields?.first?.text {
                
                PostController.addCommentWithTextToPost(text, post: self.post, completion: { (success, post) -> Void  in
                    
                    if let post = post {
                        self.updateWithPost(post)
                    }
                })
            }
        }))
        
        commentAlert.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: nil))
        
        presentViewController(commentAlert, animated: true, completion: nil)
        
    }
    
    func updateWithPost(post: Post) {
        
        self.post = post
        
        self.likesLabel.text = "\(post.likes.count) likes"
        self.commentsLabel.text = "\(post.comments.count) comments"
        
        ImageController.imageForIdentifier(post.imageEndPoint) { (image) -> Void in
            self.imageViewOutlet.image = image
        }
        
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Post detail view loaded")
        if let post = post {
            updateWithPost(post)
        } else {
            dismissViewControllerAnimated(true, completion: nil)
        }


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
