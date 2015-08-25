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
    
    var urlContentArray = [""]
    
    var deply = false
    
    var finalArray = [" "]
    
    @IBOutlet var keywords: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    func getMovieData() {
        
        var keyword = keywords.text
        
        var keywordArray = keyword.componentsSeparatedByString(",")

        
        var array = [""]
        //print(self.finalArray)
        
        for i in self.finalArray {
            
            var url2 = NSURL(string: "https://www.wikipedia.org"+i)
            
            //println(url2 )
            
            if url2 != nil {
                
                //print("PEACE")
                
                var task2 = NSURLSession.sharedSession().dataTaskWithURL(url2!, completionHandler: { (data2, response2, error2) -> Void in
                    
                    print()
                    
                    if error2 == nil {
                        
                        var movieContent = NSString(data: data2, encoding: NSUTF8StringEncoding) as NSString!
                        
                        //print(movieContent)
                        
                        dispatch_async(dispatch_get_main_queue()) {
                            
                            

                        
                        
                        for key in keywordArray {
                            
                            print(key)
                            
                            if movieContent.lowercaseString.rangeOfString(key) != nil {
                                println("exists")
                                println("\n \n \n \n \n \n er got the movie, or atleast one")
                                println(i)
                            }
                            else {
                                println("Movie doesn't fit")
                            } }
                            
                        }
                       
                        
                    }
                    
                })
                
                if self.deply == true {
                    task2.resume() }
                
                
            }
            
            
        }
        //print(array)
    
    
    }
    
    
















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
        
            
            
    
    
    }

    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
}

