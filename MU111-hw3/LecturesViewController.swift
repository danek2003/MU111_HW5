//
//  TableViewController.swift
//  MU111-hw3
//
//  Created by Danilenko Evgeny on 16.10.14.
//  Copyright (c) 2014 Danilenko Evgeny. All rights reserved.
//

import UIKit

class LecturesViewController: UITableViewController {

        var myCellData = ["Ячейка 1","Ячейка 2","Ячейка 3","Ячейка 4","Ячейка 5","Ячейка 6","Ячейка 7","Ячейка 8","Ячейка 9","Ячейка 10"]
        var myCellDetails = ["Детальки ячейки 1", "Детальки ячейки 2", "Детальки ячейки 3", "Детальки ячейки 4", "Детальки ячейки 5", "Детальки ячейки 6", "Детальки ячейки 7", "Детальки ячейки 8", "Детальки ячейки 9", "Детальки ячейки 10",]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // if user loggetIn != true {
        // показываем авторизацию
        
    //    let navAuthentication: UINavigationController = UIStoryboard(name: "Login", bundle: nil).instantiateInitialViewController() as UINavigationController
        
    //    navigationController?.presentViewController(navAuthentication, animated: true, completion: nil)
        



        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
       //  #warning Potentially incomplete method implementation.
       //  Return the number of sections.
        return 10
    }

    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        // Мои эксперименты
            return myCellData.count
        
        
       // return 0
    }
    
///Стырил код... Нифига не понял как эти методы объявлять и откуда о их существовании нужно узнавать
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("lecturesCell", forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel?.text = myCellData[indexPath.row]
        cell.detailTextLabel?.text = myCellDetails[indexPath.row]
        
        
        return cell
    }

    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }


    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            println("Тут как-то надо удалить ячейки? но у меня код падает ")
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            println("А тут видимо можно как-то их вставить ?! ")

            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    

    
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    

}
