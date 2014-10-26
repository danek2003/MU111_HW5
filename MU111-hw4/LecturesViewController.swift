//
//  TableViewController.swift
//  MU111-hw3
//
//  Created by Danilenko Evgeny on 16.10.14.
//  Copyright (c) 2014 Danilenko Evgeny. All rights reserved.
//

import UIKit

class LecturesViewController: UITableViewController {

    var lectureList: [Lecture] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        MUApi.sharedInstance().getLectures{(lectures)->() in
            self.lectureList = lectures
            self.tableView.reloadData()
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

   
     override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return lectureList.count
    
    }
    
     override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell  = tableView.dequeueReusableCellWithIdentifier("lectureCell", forIndexPath: indexPath) as UITableViewCell
       
        var lecture = lectureList[indexPath.row]
      
        cell.textLabel.text = lecture.name
        
        return cell
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    

}
