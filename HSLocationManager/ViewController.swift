//
//  ViewController.swift
//  HSLocationManager
//
//  Created by Hitesh on 03/06/19.
//  Copyright © 2019 Hitesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func exportLogFile(){
        HSLogger.logger.exportLogFile()
    }
    
    @IBAction func startTracking(sender:UIButton){
        if sender.isSelected{
            HSLocationTracking.shared().stopLocationTracking()
        }else{
            HSLocationTracking.shared().startLocationTracking()
        }
        sender.isSelected = !sender.isSelected
    }
}


