//
//  LecturesDetailViewController.swift
//  MU111-hw3
//
//  Created by Danilenko Evgeny on 24.10.14.
//  Copyright (c) 2014 Danilenko Evgeny. All rights reserved.
//

import UIKit
import MediaPlayer




class LecturesDetailViewController: UIViewController {
   
    var moviePlayer:MPMoviePlayerController!

    var lecture : Lecture? = nil

    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        hud.labelText = "Loading";
        
        if let currentLecture = lecture {
        title = currentLecture.name
        lectureDetails.text = currentLecture.details
        }
   
        MBProgressHUD.hideAllHUDsForView(self.view, animated: true)

    

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBOutlet weak var lectureDetails: UITextView!
    
    @IBAction func playAction(sender: AnyObject) {
        if let currentLecture = lecture {
            var urll = currentLecture.movieURL
            println (urll)
        
            if let urlVideo = urll {
                
              
                
             //   var url:NSURL = NSURL(string: "http://jplayer.org/video/m4v/Big_Buck_Bunny_Trailer.m4v")!
                var url:NSURL = NSURL(string: urlVideo)!
                
                moviePlayer = MPMoviePlayerController(contentURL: url)
                
                moviePlayer.view.frame = CGRect(x: 20, y: 100, width: 200, height: 150)
                
                  self.view.addSubview(moviePlayer.view)
                moviePlayer.fullscreen = true
                
                moviePlayer.controlStyle = MPMovieControlStyle.Fullscreen
                moviePlayer.view.removeFromSuperview()
                
            }
            
        }

    }
}
