//
//  DetailViewController.swift
//  Movie Finder
//
//  Created by Avinash on 9/13/15.
//  Copyright (c) 2015 Avinash Jain. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var data = ["", ""]
    var actor = ""
    
    var on = [""]

    @IBOutlet weak var oscar: UISwitch!
    
    @IBOutlet weak var gg: UISwitch!
    
    @IBOutlet weak var imdb: UISwitch!
    
    @IBOutlet weak var np: UISwitch!
    
    @IBAction func next(sender: AnyObject) {
        
        performSegueWithIdentifier("togenre", sender: nil)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "togenre" {
            
            var vc = segue.destinationViewController as! GenreViewController
            
            on.removeAtIndex(0)
            
            
            if oscar.on == true {
                on.append("oscar_nominees")
            }
            
            if gg.on == true {
                on.append("golden_globe_nominees")
            }
            
            if imdb.on == true {
                on.append("top_1000")
            }
            
            if np.on == true {
                on.append("now-playing")
            }
            
            
            vc.data = data
            vc.actor = actor
            vc.detail = on
            
            print(vc.data)
            print(vc.detail)
            
        }
        
    }

}
