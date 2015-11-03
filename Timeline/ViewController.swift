//
//  ViewController.swift
//  Timeline
//
//  Created by Eric Mead on 11/3/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//Add a UITabBarController container view controller as the root view controller.
//Add a UITableViewController Timeline view controller, embed it in a UINavigationController, add a + button as the right bar button, and add it to the UITabBarController, update the UITabBarItem to describe the scene.
//note: The + button will be used to add photos.
//Add a TimelineTableViewController.swift subclass of UITableViewController and assign it to the Timeline scene.
//Add a UITableViewController Post Detail view controller, add a segue to it from a cell in the table view of the Timeline scene.
//Add a PostDetailTableViewController.swift subclass of UITableViewController and assign it to the Post Detail scene.
//Add a UITableViewController User List / Search view controller, embed it in a UINavigationController, add a segmented control as the title view for the navigation bar with 'Friends' and 'Add Friend' segment titles, and add it to the UITabBarController, update the UITabBarItem to describe the scene.
//note: This view will be used for search and for listing friends.
//Add a UserSearchTableViewController.swift subclass of UITableViewController and assign it to the User List/Search scene.

//Add a UIViewController User Detail / Profile view controller, embed it in a UINavigationController, and add it to the UITabBarController, update the UITabBarItem to describe the scene. Now, add a segue from a table view cell of the User Search view directly to the User Detail / Profile view controller (bypass it's UINavigationController).
//Add a ProfileViewController.swift subclass of UIViewController and assign it to the Profile scene.

//Add a UITableViewController Add Photo table view controller, embed in UINavigationController, add a segue to it from the Timeline scene UIBarButtonItem.
//note: We will use a static table view for our Add Photo view, static table views should be used sparingly, but they can be useful for a table view that will never change, such as a basic form.
//Add a AddPhotoTableViewController.swift subclass of UITableViewController and assign it to the Add Photo scene.
//Add a UIViewController Login / Signup Picker view controller, embed it in a UINavigationController, add a login button and a sign up button, add a Present Modally segue to it from the UITabBarController

//Add a LoginSignupPickerViewController.swift subclass of UIViewController and assign it to the Login / Signup Picker scene
//Add a UIViewController Login / Signup view controler, add a segue to it from the login and signup buttons on the Login / Signup Picker scene
//Add a LoginSignupViewController.swift subclass of UIViewcontroller and assign it to the Login / Signup scene
