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
    
    
    @IBOutlet var reldate1: UITextField!
    

    @IBOutlet var reldate2: UITextField!
    
    @IBAction func next(sender: AnyObject) {
        
        performSegueWithIdentifier("toactor", sender: nil)
        
        
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "toactor" {
            
            var vc = segue.destinationViewController as! ActorViewController
            
            
            var d1 = self.reldate1.text
            var d2 = self.reldate2.text
            
            var array = [d1,d2] as [String]
            
            print(array)
            
            vc.data = array
            
        }

}

}
