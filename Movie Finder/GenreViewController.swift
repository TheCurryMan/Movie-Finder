//
//  GenreViewController.swift
//  Movie Finder
//
//  Created by Avinash on 9/13/15.
//  Copyright (c) 2015 Avinash Jain. All rights reserved.
//

import UIKit



class GenreViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var data = []
    var detail = []
    var on = [""]
    var actor = ""
    var nothing = false
    
    @IBOutlet weak var action: UISwitch!
    
    @IBOutlet weak var animation: UISwitch!
    
    @IBOutlet weak var comedy: UISwitch!
    
    @IBOutlet weak var crime: UISwitch!
    
    @IBOutlet weak var romance: UISwitch!
    
    @IBOutlet weak var scifi: UISwitch!
    
    @IBOutlet weak var thriller: UISwitch!
    
    
    @IBAction func next(sender: AnyObject) {
        
        performSegueWithIdentifier("tocalc", sender: nil)
    }
    
    @IBAction func skip(sender: AnyObject) {
        
        performSegueWithIdentifier("tocalc", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "tocalc" {
            
            on.removeAtIndex(0)
            
            var final = ""
            
            var genres = ["action", "animation", "comedy", "crime", "romance", "scifi", "thriller"]
            
            var genswitch = [action, animation, comedy, crime, romance, scifi, thriller]
            
            
            for (index, val) in genswitch.enumerate() {
            
                if val.on == true {
                    
                    final = genres[index]
                    break
                }
            }

            
            
            
            var vc = segue.destinationViewController as! CalculateViewController
            
            if nothing == true {
            
            vc.data = data
            vc.actor = actor
            vc.detail = detail
            vc.genre = ""
                
            }
            
            else {
            vc.data = data
            vc.actor = actor
            vc.detail = detail
            vc.genre = final
                
            }
            
            
        }
        
    }

}
