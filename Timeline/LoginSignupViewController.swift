//
//  LoginSignupViewController.swift
//  Timeline
//
//  Created by Eric Mead on 11/3/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import UIKit

class LoginSignupViewController: UIViewController {

    @IBOutlet weak var usernameOutlet: UITextField!
    @IBOutlet weak var emailOutlet: UITextField!
    @IBOutlet weak var passwordOutlet: UITextField!
    @IBOutlet weak var bioOutlet: UITextField!
    @IBOutlet weak var weburlOutlet: UITextField!
    @IBOutlet weak var actionOutlet: UIButton!
    
    enum viewMode {
        
        case Login
        case Signup
        case Edit
    }
    
    var mode: viewMode = .Signup
    
    var user: User?
    
    func updateViewForMode(mode: viewMode) {
        
        switch mode {
            
        case .Login:    usernameOutlet.removeFromSuperview()
                        bioOutlet.removeFromSuperview()
                        weburlOutlet.removeFromSuperview()
                        actionOutlet.setTitle("Login", forState: .Normal)
            
        case .Signup:   actionOutlet.setTitle("Sign Up", forState: .Normal)
            
        case .Edit:     actionOutlet.setTitle("Update", forState: .Normal)
                        emailOutlet.removeFromSuperview()
                        passwordOutlet.removeFromSuperview()
            
                        if let user = self.user {
                            usernameOutlet.text = user.username
                            bioOutlet.text = user.bio
                            weburlOutlet.text = user.url
                
                        }
        }
    }
    
    var fieldsAreValid: Bool {
        
        switch mode {
            
        case .Login:  return !(emailOutlet.text!.isEmpty || passwordOutlet.text!.isEmpty)
 
            
        case .Signup: return !(usernameOutlet.text!.isEmpty || emailOutlet.text!.isEmpty || passwordOutlet.text!.isEmpty)
        
        case .Edit:   return !(usernameOutlet.text!.isEmpty)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViewForMode(mode)
        
        // Do any additional setup after loading the view.
    }

    @IBAction func actionButtonTapped(sender: UIButton) {
        if fieldsAreValid {
            switch mode {
                
            case .Signup:
                
                UserController.createUser(emailOutlet.text!, username: usernameOutlet.text!,  bio: bioOutlet.text, url: weburlOutlet.text, password: passwordOutlet.text!, completion: { (success, user) -> Void in
                        if success {
                        
                        self.dismissViewControllerAnimated(true, completion: nil)
                            
                    } else {
                        self.presentValidationAlertWithTitle("Unable to Create User", text: "Please check your information and try again.")
                    }
                })
                
            case .Login:
                
                UserController.authenticateUser(emailOutlet.text!, password: passwordOutlet.text!, completion: { (success, user) -> Void in
                    
                    if success {
                        self.dismissViewControllerAnimated(true, completion: nil)
                    } else {
                        self.presentValidationAlertWithTitle("Unable to Log In", text: "Please check your information and try again.")
                    }
                })
                
            case .Edit:
                
                UserController.updateUser(self.user!, username: self.usernameOutlet.text!, bio: self.bioOutlet.text, url:   self.weburlOutlet.text, completion: { (success, user) -> Void in
                    
                    if success {
                        self.dismissViewControllerAnimated(true, completion: nil)
                    } else {
                        self.presentValidationAlertWithTitle("Unable to Update User", text: "Please check your information and try again.")
                    }
                })
                
            }
        } else {
            
            self.presentValidationAlertWithTitle("Missing Information", text: "Please check your information and try again.")
        }
        
    }
    
    func updateWithUser(user: User) {
        
        self.user = user
        mode = .Edit
        
        updateViewForMode(mode)
    }
    
    func presentValidationAlertWithTitle(title: String, text: String) {
        
        let alert = UIAlertController(title: title, message: text, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
        presentViewController(alert, animated: true, completion: nil)
    }

    
   
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
