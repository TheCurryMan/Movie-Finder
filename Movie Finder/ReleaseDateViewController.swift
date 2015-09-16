//
//  ReleaseDateViewController.swift
//  Movie Finder
//
//  Created by Avinash Jain on 9/11/15.
//  Copyright (c) 2015 Avinash Jain. All rights reserved.
//

import UIKit

class ReleaseDateViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    var nothing = false
    
    @IBOutlet var reldate1: UITextField!
    

    @IBOutlet var reldate2: UITextField!
    
    @IBAction func next(sender: AnyObject) {
        
        performSegueWithIdentifier("toactor", sender: nil)
        
        
    }
    
    @IBAction func skip(sender: AnyObject) {
        
        self.nothing = true
        performSegueWithIdentifier("toactor", sender: nil)
        
        
    }
    
    
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "toactor" {
            
            if nothing == true {
            
                var vc = segue.destinationViewController as! ActorViewController
                
                
                var d1 = ""
                var d2 = ""
                
                var array = [d1,d2] as [String]
                
                print(array)
                
                vc.data = array
            
            }
            
            else {
            
            var vc = segue.destinationViewController as! ActorViewController
            
            
            var d1 = self.reldate1.text
            var d2 = self.reldate2.text
            
            var array = [d1,d2] as [String]
            
            print(array)
            
            vc.data = array
                
            }
            
        }

}

}
