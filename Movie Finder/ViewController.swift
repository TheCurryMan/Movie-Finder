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
    
    func displayAlert(title: String, message: String){
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "Okay", style: .Default, handler: {(action) -> Void in
            
            
            //self.dismissViewControllerAnimated(true, completion: nil)
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }


    @IBOutlet weak var plot: UITextField!
    
    @IBOutlet weak var actor: UITextField!
    
    @IBOutlet weak var reldate1: UITextField!
    
    @IBOutlet weak var reldate2: UITextField!
    
    var urlContentArray = [""]
    
    var deply = false
    
    var finalArray = [" "]
    
    var listOfMovies = [" "]
    
    var urlOfImages = [" "]
   

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
        
        
    }
    
    
    
    
    func getMovieData() {
        
        var ans = "Hello"
        
        var keyword = self.actor.text
        
        //print("Something should be happening")
        
            let keyword1 = keyword.stringByReplacingOccurrencesOfString(" ", withString: "%20", options: nil, range: nil)
            
            var url2 = NSURL(string: "http://www.imdb.com/search/name?name="+keyword1)
            
            //println(url2)
            
            if url2 != nil {
                
                
                
                //print("PEACE")
                
                var task = NSURLSession.sharedSession().dataTaskWithURL(url2!, completionHandler: { (data2, response2, error2) -> Void in
                    
                    //println("We've got to here")
                    
                    if error2 == nil {
                        
                        //println("Hello")
                        
                        var movieContent = NSString(data: data2, encoding: NSUTF8StringEncoding) as NSString!
                        
                        //print(movieContent)
                        
                        dispatch_async(dispatch_get_main_queue()) {
                            
                            var keywordArray3 = movieContent.componentsSeparatedByString("href=\"/name/")
                            
                            //print(keywordArray[1])
                            
                            var final = keywordArray3[1] as! String
                            
                            var finalArray = final.componentsSeparatedByString("/")
                            
                            //println(finalArray)
                            
                            //println(finalArray[0])
                            
                            
                            
                            ans = finalArray[0] as String
                            
                            self.getMovieName(ans)
                            
                            
                            
                        }
                       
                        
                    }
                    
                })
                
                task.resume()
            }
            
            
        
        //print(array)
    
    
    }
    
    func getMovieName(name : String) {
    
    
        println(name)
        
        performFinalSearch(name)
        
        
        
        
        

    
    }
    
    
    func performFinalSearch(actor: String) {
        
        var plotVal = self.plot.text
        
        var reld1 = self.reldate1.text
        
        var reld2 = self.reldate2.text
        
    
        var url2 = NSURL(string: "http://www.imdb.com/search/title?plot=" + plotVal+"&release_date=" + reld1 + "," + reld2 + "&role=" + actor)
        
        //println(url2)
        
        if url2 != nil {
            
            
            
            //print("PEACE")
            
            var task = NSURLSession.sharedSession().dataTaskWithURL(url2!, completionHandler: { (data2, response2, error2) -> Void in
                
                //println("We've got to here")
                
                if error2 == nil {
                    
                    //println("Hello")
                    
                    var movieContent = NSString(data: data2, encoding: NSUTF8StringEncoding) as NSString!
                    
                    //print(movieContent)
                    
                    dispatch_async(dispatch_get_main_queue()) {
                        
                        
                        var keywordArray = movieContent.componentsSeparatedByString("even detailed")
                        
                        var keywordArray2 = movieContent.componentsSeparatedByString("odd detailed")
                        
                        self.listOfMovies = [" "]
                        self.listOfMovies.removeAtIndex(0)
                        
                        self.urlOfImages = [" "]
                        self.urlOfImages.removeAtIndex(0)
                        
                        for (index, value) in enumerate(keywordArray) {
                            
                            println("Hello")
                        
                            if index % 2 != 0 {
                                
                                if index <= keywordArray.count {
                                
                                var final = keywordArray[index] as! String
                                
                                var finalArray = final.componentsSeparatedByString("title=\"")
                                
                                var nameSec = finalArray[1] as String
                                
                                
                                var nameFinal = nameSec.componentsSeparatedByString("\">")
                                
                                
                                var nameDone = nameFinal[0]
                                    
                                var imgArr = final.componentsSeparatedByString("img src=\"")
                                    
                                var imgAr = imgArr[1].componentsSeparatedByString("\" ")

                                var iurl = imgAr[0] as String
                                
                                    self.listOfMovies.append(nameDone)
                                    
                                    self.urlOfImages.append(iurl)
                                
                                
                                
                                }
                                
                                
                                if index <= keywordArray2.count {
                                
                                var final2 = keywordArray2[index] as! String
                                
                                var finalArray2 = final2.componentsSeparatedByString("title=\"")
                                
                                
                                var nameSec2 = finalArray2[1] as String
                                
                                var nameFinal2 = nameSec2.componentsSeparatedByString("\">")
                                
                                var nameDone2 = nameFinal2[0]
                                    
                                    
                                    var imgArr = final2.componentsSeparatedByString("img src=\"")
                                    
                                    var imgAr = imgArr[1].componentsSeparatedByString("\" ")
                                    
                                    var iurl = imgAr[0] as String
                                
                                self.listOfMovies.append(nameDone2)
                                    
                                self.urlOfImages.append(iurl)

                                }
                                
                                println(self.listOfMovies)
                                
                                
                                
                            }
                            
                            println("Namaste")
                            
                            
                        
                        }
                        
                        self.seguePerform()
                        //self.displayAlert("Your movie is...", message: asd)
                        
                        
                        
                        
                    }
                    
                    
                }
                
            })
            
            task.resume()
        }
        

        
    
    }
    
    func seguePerform() {
    
        println(self.listOfMovies)
        
        self.performSegueWithIdentifier("movies", sender: nil)
        

    
    }




    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "movies" {
        
            let vc = segue.destinationViewController as!  DisplayViewController
            
            vc.movieList = self.listOfMovies
            
            vc.imageURLs = self.urlOfImages
        
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
