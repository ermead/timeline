//
//  UserSearchTableViewController.swift
//  Timeline
//
//  Created by Eric Mead on 11/3/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import UIKit

class UserSearchTableViewController: UITableViewController, UISearchResultsUpdating {
    
    var usersDataSource: [User] = []
    var searchController: UISearchController!

    @IBOutlet weak var modeSegmentedControl: UISegmentedControl!
    
    enum ViewMode: Int {
        
        case Friends
        case All
        
        func users(completion: (users:[User]?) -> Void) {
            
            switch self {
                
            case .Friends:
               UserController.followedByUser(UserController.sharedController.currentUser, completion: { (followers) -> Void in
                completion(users: followers)
               })
                
            case .All:
              UserController.fetchAllUsers({ (users) -> Void in
                completion(users: users)
              })
            }
        }
    }
    
    var mode:ViewMode {

        return ViewMode(rawValue: modeSegmentedControl.selectedSegmentIndex)!
    
    }
    
  
    
    func updateViewForMode(mode: ViewMode) {
        
        mode.users { (users) -> Void in
            
            if let users = users {
                self.usersDataSource = users
            } else {
                self.usersDataSource = []
            }
            
            self.tableView.reloadData()
        }
    }
    
    @IBAction func segmentedControlSwitched(sender: UISegmentedControl) {

        updateViewForMode(mode)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpSearchController()

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

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.usersDataSource.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("friendsCell", forIndexPath: indexPath)
        
        let user = self.usersDataSource[indexPath.row]
        
        cell.textLabel?.text = user.username

        return cell
    }
    
    func setUpSearchController(){
        
        let resultsController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("userSearchResults")
        
        searchController = UISearchController(searchResultsController: resultsController)
        searchController.searchResultsUpdater = self
        searchController.searchBar.sizeToFit()
        searchController.hidesNavigationBarDuringPresentation = false
        tableView.tableHeaderView = searchController.searchBar
        
        definesPresentationContext = true
    
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        
        let searchTerm = searchController.searchBar.text!.lowercaseString
        
        let resultsViewController = searchController.searchResultsController as! UserListSearchResultsTableViewController
        
        resultsViewController.usersDataSource = self.usersDataSource.filter({$0.username.lowercaseString.containsString(searchTerm)})
        resultsViewController.tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let sender = sender as! UITableViewCell
        
        var selectedUser: User
        
        // if we get an indexPath from the search results controller, use that userDataSource
        // else, use self.userDataSource
        
        if let indexPath = (searchController.searchResultsController as? UserListSearchResultsTableViewController)?.tableView.indexPathForCell(sender) {
            
            let usersDataSource = (searchController.searchResultsController as! UserListSearchResultsTableViewController).usersDataSource
            
            selectedUser = usersDataSource[indexPath.row]
        } else {
            
            let indexPath = tableView.indexPathForCell(sender)!
            selectedUser = self.usersDataSource[indexPath.row]
        }
        
        let destinationViewController = segue.destinationViewController as! ProfileViewController
        
        destinationViewController.user = selectedUser
        
        
    }

    
    
//    Add a function setUpSearchController() that will initialize and assign settings to the UISearchController
//    Implement the function by capturing an instance of the Search Results scene as a resultsController in Main.storyboard using the scene's identifier, initializing the UISearchController with the the resultsController, setting the searchResultsUpdater to self, and setting the search controller's search bar as the header of the tableView
//    Call the setUpSearchController() function in the viewDidLoad()
//    Adopt the SearchResultsUpdating protocol and add the required updateSearchResultsForSearchController(searchController: UISearchController) function
//    Implement the SearchResultsUpdating function by capturing the text in the search bar and assigning the search controller's usersDataSource to a filtered array of User objects where the username contains the search term, then reload the result view's tableView
//    note: Use self.usersDataSource as the source of the filtered array
//    note: You may want to convert the search term and usernames to lowercase using .lowercaseString to avoid case sensitive search results


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


