//
//  ViewController.swift
//  TopApps
//
//  Created by Dani Arnaout on 9/1/14.
//  Edited by Eric Cerney on 9/27/14.
//  Copyright (c) 2014 Ray Wenderlich All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    DataManager.getTopAppsDataFromFileWithSuccess { (data) -> Void in
      // Get #1 app name using SwiftyJSON
      let json = JSON(data: data)
      if let appName = json["feed"]["entry"][0]["im:name"]["label"].string {
        println("SwiftyJSON: \(appName)")
      }
    }
    
    // Get the #1 app name from iTunes and SwiftyJSON
    DataManager.getTopAppsDataFromItunesWithSuccess { (iTunesData) -> Void in
      let json = JSON(data: iTunesData)
      if let appName = json["feed"]["entry"][0]["im:name"]["label"].string {
        println("NSURLSession: \(appName)")
      }
      // More soon...
      //1
      if let appArray = json["feed"]["entry"].array {
        //2
        var apps = [AppModel]()
        
        //3
        for appDict in appArray {
          var appName: String? = appDict["im:name"]["label"].string
          var appURL: String? = appDict["im:image"][0]["label"].string
          
          var app = AppModel(name: appName, appStoreURL: appURL)
          apps.append(app)
        }
        
        //4
        println(apps)
      }
    }
    
  }
}

