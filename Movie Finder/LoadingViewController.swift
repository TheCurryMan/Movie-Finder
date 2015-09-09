//
//  LoadingViewController.swift
//  Movie Finder
//
//  Created by Avinash Jain on 9/5/15.
//  Copyright (c) 2015 Avinash Jain. All rights reserved.
//

import UIKit

        

class LoadingViewController: UIViewController {
    
    var activityIndicator : UIActivityIndicatorView = UIActivityIndicatorView()
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0, 0, 50, 50))
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.White
        activityIndicator.color = UIColor.blackColor()
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
        getMovieData()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var actor = ""
    
    var plot = ""
    
    var reldate1 = ""
    
    var reldate2 = ""
    
    
    
    var urlContentArray = [""]
    
    var finalArray = [" "]
    
    var listOfMovies = [" "]
    
    var urlOfImages = [" "]
    
    
    
    func getMovieData() {
        
        var ans = "Hello"
        
        var keyword = self.actor
        
        //print("Something should be happening")
        
        let keyword1 = keyword.stringByReplacingOccurrencesOfString(" ", withString: "%20", options: nil, range: nil)
        
        var url2 = NSURL(string: "http://www.imdb.com/search/name?name="+keyword1)
        
        println(url2)
        
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
        
        var plotVal = self.plot
        
        var reld1 = self.reldate1
        
        var reld2 = self.reldate2
        
        
        var url2 = NSURL(string: "http://www.imdb.com/search/title?plot=" + plotVal+"&release_date=" + reld1 + "," + reld2 + "&sort=year,desc&title_type=feature&role=" + actor)
        
        println(url2)
        
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
    
    
    

    

}
