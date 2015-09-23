//
//  CalculateViewController.swift
//  Movie Finder
//
//  Created by Avinash on 9/13/15.
//  Copyright (c) 2015 Avinash Jain. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var data = []
    var detail = []
    var genre = ""
    var actor = ""
    var empty = false
    
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
        
        
        if actor != "" {
        
        getMovieData()
        
        }
        
        else {
            
            getMovieName("")
        
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var urlContentArray = [""]
    
    var finalArray = [" "]
    
    var listOfMovies = [" "]
    
    var urlOfImages = [" "]
    
    
    
    func getMovieData() {
        
        
        var ans = "Hello"
        
        var keyword = actor
        
        //print("Something should be happening")
        
        var keyword1 = keyword.stringByReplacingOccurrencesOfString(" ", withString: "%20", options: [], range: nil)
        
        var url2 = NSURL(string: "http://www.imdb.com/search/name?name="+keyword1)
        
        print(url2)
        
        //println(url2)
        
        if url2 != nil {
            
            
            
            //print("PEACE")
            
            var task = NSURLSession.sharedSession().dataTaskWithURL(url2!, completionHandler: { (data2, response2, error2) -> Void in
                
                //println("We've got to here")
                
                if error2 == nil {
                    
                    //println("Hello")
                    
                    var movieContent = NSString(data: data2!, encoding: NSUTF8StringEncoding) as NSString!
                    
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
        
        
        
        
     print(name)
        
        if genre == "" && actor == "" && data.count == 0 && detail.count == 00 {
            
            empty = true
        }
        else {

        
        performFinalSearch(name)
        
        
        }
        
        
        
        
    }
    
    
    func performFinalSearch(actor: String) {
        
        var reld1 = ""
        
        var reld2 = ""
        
        
        
        if data != [] {
        
            reld1 = data[0] as! String + ","
            
            reld2 = data[1] as! String
        }
        
        
        var str = ""
        
        print("Namaste")
        
       
        
        for i in detail {
        
            str = str + (i as! String) + ","
            
            str.substringToIndex(str.endIndex.predecessor())
        
        }
        
        print("Hola amigo")
       
        
        
        var url2 = NSURL(string: "http://www.imdb.com/search/title?genres=" + genre + "&groups=" + str + "&release_date=" + reld1 + reld2 + "&sort=year,desc&title_type=feature&role=" + actor)
            
            
        
        print(url2)
        
        //println(url2)
        
        if url2 != nil {
            
            
            
            //print("PEACE")
            
            let task = NSURLSession.sharedSession().dataTaskWithURL(url2!, completionHandler: { (data2, response2, error2) -> Void in
                
                //println("We've got to here")
                
                if error2 == nil {
                    
                    //println("Hello")
                    
                    let movieContent = NSString(data: data2!, encoding: NSUTF8StringEncoding) as NSString!
                    
                    //print(movieContent)
                    
                    dispatch_async(dispatch_get_main_queue()) {
                        
                        
                        var keywordArray = movieContent.componentsSeparatedByString("even detailed")
                        
                        var keywordArray2 = movieContent.componentsSeparatedByString("odd detailed")
                        
                        self.listOfMovies = [" "]
                        self.listOfMovies.removeAtIndex(0)
                        
                        self.urlOfImages = [" "]
                        self.urlOfImages.removeAtIndex(0)
                        
                        print(keywordArray.count)
                        print(keywordArray2.count)
                        
                        for (index, value) in keywordArray.enumerate() {
                            
                            print("Hello")
                            
                            if index % 2 != 0 {
                                
                                if index <= keywordArray.count {
                                    
                                    var final = keywordArray[index] 
                                    
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
                                
                                
                                if index <= keywordArray.count {
                                    
                                    if keywordArray.count != keywordArray2.count && index == keywordArray2.count{
                                        
                                        
                                        print("End of chain")
                                        
                                    }
                                    
                                    else {
                                    
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
                                    
                                }
                                
                                print(self.listOfMovies)
                                
                                
                                
                            }
                            
                            print("Namaste")
                            
                            
                            
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
        
        print(self.listOfMovies)
        
        self.performSegueWithIdentifier("movies", sender: nil)
        
        
        
    }
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "movies" {
            
            let vc = segue.destinationViewController as!  DisplayViewController
            
            if empty == true || self.listOfMovies.count == 0{
                
                vc.empty == true
            }
            
            else {
            vc.movieList = self.listOfMovies
            
            vc.imageURLs = self.urlOfImages
                
            }
            
            
            
        }
    }

}
