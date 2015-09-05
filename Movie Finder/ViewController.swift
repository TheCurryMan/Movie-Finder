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


/*


@IBAction func searchPressed(sender: UIButton) {
    
        var keyword = keywords.text
    
        var keywordArray = keyword.componentsSeparatedByString(",")
        
        
        if keyword != "" {
        
            print("search pressed")
        
                for i in 0...10 {
            
                    var year = 2016-i
            
            
        
                    var url = NSURL(string:"http://en.wikipedia.org/wiki/List_of_American_films_of_"+String(stringInterpolationSegment: year))
            
                    print("\n")
                    print(url!)
            
                        if url != nil {
                
                            var task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in

                                //print("hello")
                                var urlError = false
                    
                                //print(error)
                    
                                    if error == nil {
                        
                                        var urlContent = NSString(data: data, encoding: NSUTF8StringEncoding) as NSString!
                        
                                        self.urlContentArray = urlContent.componentsSeparatedByString("<i><a href=\"") as! [String]
                        
                                        //self.urlContentArray.removeAtIndex(0)
                                        var newArray = [[" "], [" "]]
                                        newArray.removeAll(keepCapacity: false)
                        
                    
                        
                                        for i in self.urlContentArray {
                            
                                            newArray.append(i.componentsSeparatedByString("\""))
                            
                        
                                        }
                                        
                                        //print(newArray)
                        
                                        for i in newArray {
                        
                                            var new : String = i[0]
                            
                                            new.stringByReplacingOccurrencesOfString(" title=<!DOCTYPE html>", withString: " ")
                                            
                                            
                            
                                            self.finalArray.append(new)
                        
                                        }
                                        
                                        
                                        self.deply = true
                                        self.getMovieData()
                                        //print(self.finalArray)
                        
                                                           }
                    
                                

            
                }
                                
                )
                
                task.resume()
                
            }
            
        
        
            
}

}
        
            
     */
    
    
    

    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }

}
