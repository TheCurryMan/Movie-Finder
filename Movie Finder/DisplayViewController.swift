//
//  DisplayViewController.swift
//  Movie Finder
//
//  Created by Avinash Jain on 9/2/15.
//  Copyright (c) 2015 Avinash Jain. All rights reserved.
//

import Foundation
import UIKit


class CustomTableViewCell : UITableViewCell {

    @IBOutlet var movieImage: UIImageView!

    @IBOutlet var movieName: UILabel!
    

   
}


class DisplayViewController : UIViewController,UITableViewDataSource, UITableViewDelegate {


    @IBOutlet var tableView: UITableView!
    
    var movieList = [] as [String]
    
    var imageURLs = [] as [String]
    
    var empty = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var nib = UINib(nibName: "CustomMovieCell", bundle: nil)
        
        tableView.registerNib(nib, forCellReuseIdentifier: "customCell")
        
        
        print(movieList)
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if empty == true {
            
            return 1
        }
        
        else {
            return movieList.count
            
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:CustomTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("customCell") as! CustomTableViewCell
        
        if empty == true {
        
            cell.movieName.text = "No movies found"
        }
        
        else {
        
        cell.movieName.text = movieList[indexPath.row]
        let url = NSURL(string: imageURLs[indexPath.row])
        let data = NSData(contentsOfURL: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
        cell.movieImage.image = UIImage(data: data!)
        
        }
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        print("You selected cell #\(indexPath.row)!")
    }


}