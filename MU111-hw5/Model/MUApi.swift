//
//  MUApi.swift
//  MU111-hw3
//
//  Created by Danilenko Evgeny on 24.10.14.
//  Copyright (c) 2014 Danilenko Evgeny. All rights reserved.
//

import UIKit
import Alamofire

var instance: MUApi?

class MUApi: NSObject {
    
    struct StaticHelper {
        static var instance: MUApi?
        static var token: dispatch_once_t = 0
    }
    
    class func sharedInstance() -> MUApi {
        dispatch_once(&StaticHelper.token, { () -> Void in
            StaticHelper.instance = MUApi()
        })
        
        return StaticHelper.instance!
    }
    
    private func parseLectures(lecturesArray: NSArray) -> [Lecture] {
        
        var resultLectures: [Lecture] = []
        
        for lectureItem in lecturesArray {
            if let lectureName = lectureItem["name"] as? String {
                var resultLecture = Lecture()
                resultLecture.name = lectureName
                
                if let details = lectureItem["description"] as? String {
                    resultLecture.details = details
                }
                if let movieURL = lectureItem["video"] as? String {
                    resultLecture.movieURL = movieURL
                }

                resultLectures += [resultLecture]
            }
        }
        
        
        return resultLectures
        
    }
    
    func getLectures(success:([Lecture])->()) {
        
        Alamofire.request(.GET, "http://weekly.master-up.net/api/mu/lectures/").responseJSON { (_, _, json, error) -> Void in
            success(self.parseLectures(json as NSArray))
        }
        
        /* вариант с использованием NSURLSession
        //качаем
        
        var request = NSMutableURLRequest(URL: NSURL(string: "http://weekly.master-up.net/api/mu/lectures/"))
        
        var session = NSURLSession.sharedSession()
        
        
        var task = session.dataTaskWithRequest(request, completionHandler: { (data, _, error) -> Void in
        
        //парсим наши данные не в освновном потоке
        var error: NSError?
        
        var json: AnyObject! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableLeaves, error: &error)
        
        
        
        if let lecturesArray = json as? NSArray{
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
        success(resultLectures)
        })
        
        })
        
        task.resume()
        */
    }
}