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
    
    var ans = "1"
    
    @IBOutlet weak var actor: UITextField!
    
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
    
    
    @IBAction func searchPressed(sender: AnyObject) {
        getMovieData()
        
        println("THISISISIISIS ISISISIISIS SPARTATATATA")
        
    }
    
    
    
    
    func getMovieData() -> (String){
        
        var keyword = "Tom Cruise"
        
        print("Something should be happening")
        
            let keyword1 = keyword.stringByReplacingOccurrencesOfString(" ", withString: "%20", options: nil, range: nil)
            
            var url2 = NSURL(string: "http://www.imdb.com/search/name?name="+keyword1)
            
            println(url2)
            
            if url2 != nil {
                
                
                
                print("PEACE")
                
                var task = NSURLSession.sharedSession().dataTaskWithURL(url2!, completionHandler: { (data2, response2, error2) -> Void in
                    
                    println("We've got to here")
                    
                    if error2 == nil {
                        
                        println("Hello")
                        
                        var movieContent = NSString(data: data2, encoding: NSUTF8StringEncoding) as NSString!
                        
                        //print(movieContent)
                        
                        dispatch_async(dispatch_get_main_queue()) {
                            
                            var keywordArray = movieContent.componentsSeparatedByString("href=\"/name/")
                            
                            print(keywordArray[1])
                            
                            var final = keywordArray[1] as! String
                            
                            var finalArray = final.componentsSeparatedByString("/")
                            
                            println(finalArray)
                            
                            println(finalArray[0])
                            
                            ans = finalArray[0]
                            
                            
                            /*
                        
                        
                        for key in keywordArray {
                            
                            print(key)
                            
                            if movieContent.lowercaseString.rangeOfString(key) != nil {
                                println("exists")
                                println("\n \n \n \n \n \n er got the movie, or atleast one")
                                println(i)
                            }
                            else {
                                println("Movie doesn't fit")
                            } } */
                            
                        }
                       
                        
                    }
                    
                })
                
                task.resume()
            }
            
            
        
        //print(array)
    
    
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
