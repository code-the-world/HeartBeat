//
//  ViewController.swift
//  HeartBeat
//
//  Created by Vishal on 7/27/15.
//  Copyright (c) 2015 Code the World. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var currentHeartbeat: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        calculateHeartBeat()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calculateHeartBeat() {
        let heartbeat = 100;
        self.currentHeartbeat.text = String(heartbeat);
    }
    
}

