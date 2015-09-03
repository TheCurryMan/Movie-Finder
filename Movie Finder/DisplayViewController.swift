//
//  DisplayViewController.swift
//  Movie Finder
//
//  Created by Avinash Jain on 9/2/15.
//  Copyright (c) 2015 Avinash Jain. All rights reserved.
//

import Foundation
import UIKit


class DisplayViewController : UIViewController,UITableViewDataSource {


    @IBOutlet var tableView: UITableView!
    
    var movieList = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        println(movieList)
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        
        cell.textLabel!.text = movieList[indexPath.row] as! String
        
        return cell
    }


}