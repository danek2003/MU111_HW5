//
//  LecturesDetailViewController.swift
//  MU111-hw3
//
//  Created by Danilenko Evgeny on 24.10.14.
//  Copyright (c) 2014 Danilenko Evgeny. All rights reserved.
//

import UIKit

class LecturesDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var ImageView = UIImageView(frame: CGRectMake(60, 69, 200, 200))
        var url = NSURL(string: "http://images.apple.com/v/home/bg/images/osx_logo_large.png")
   
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)) { () -> Void in
        
            var dataImg = NSData(contentsOfURL: url!)
        
            var image = UIImage(data: dataImg!)
            
        
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
             
                ImageView.image = image

                self.view.addSubview(ImageView)
            
                println("ImageShow")

        })
            
        }
       println("Hi")
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
