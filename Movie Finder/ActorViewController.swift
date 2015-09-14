//
//  ActorViewController.swift
//  Movie Finder
//
//  Created by Avinash Jain on 9/11/15.
//  Copyright (c) 2015 Avinash Jain. All rights reserved.
//

import UIKit

class ActorViewController: UIViewController {
    
    var data = ["", ""]

    @IBOutlet weak var actor: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func next(sender: AnyObject) {
        
        performSegueWithIdentifier("todetail", sender: nil)
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "todetail" {
            
            var vc = segue.destinationViewController as! DetailViewController
            
            var act = actor.text
            
            
            vc.data = data
            vc.actor = act
            
        }
        
    }


}
