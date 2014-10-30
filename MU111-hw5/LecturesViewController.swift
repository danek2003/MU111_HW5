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
       
        var hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        hud.color = UIColor.grayColor()
        hud.mode = MBProgressHUDModeIndeterminate
        hud.labelText = "Loading";
        
        MUApi.sharedInstance().getLectures{(lectures)->() in
          
            MBProgressHUD.hideAllHUDsForView(self.view, animated: true)
            
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
        
        var cell  = tableView.dequeueReusableCellWithIdentifier("lectureCell", forIndexPath: indexPath) as TestTableCell
       
        var lecture = lectureList[indexPath.row]
      
        cell.textLabel.text = lecture.name
        
        return cell
    }
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
        if segue.identifier == "lectureDetails" {
            let detailsViewController = segue.destinationViewController as LecturesDetailViewController
            let indexPath = self.tableView.indexPathForCell(sender as TestTableCell)!
            let lecture = lectureList[indexPath.row]
            
            detailsViewController.lecture = lecture
            
        }
    }
    

}
