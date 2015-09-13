//
//  ViewController.swift
//  Movie Finder
//
//  Created by Avinash Jain on 5/24/15.
//  Copyright (c) 2015 Avinash Jain. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    

    @IBOutlet weak var plot: UITextField!
    
    @IBOutlet weak var actor: UITextField!
    
    @IBOutlet weak var reldate1: UITextField!
    
    @IBOutlet weak var reldate2: UITextField!
    
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func searchPressed(sender: AnyObject) {
        performSegueWithIdentifier("loading", sender: nil)
        
        
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "loading" {
        
            var vc = segue.destinationViewController as! LoadingViewController
            
            vc.actor = self.actor.text
            
            vc.plot = self.plot.text
            
            vc.reldate1 = self.reldate1.text
            vc.reldate2 = self.reldate2.text
            
        
        
        
        }
        
    }

    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
}

}





    
    


