//
//  ViewController.swift
//  TahirUzun_FinalProject
//
//  Created by Tahir Uzun on 3/14/20.
//  Copyright © 2020 Tahir Uzun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.tick) , userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }
    // Clock
    @IBOutlet weak var clockLabel: UILabel!
    var timer = Timer()
    
    
    @objc func tick() {
        clockLabel?.text = DateFormatter.localizedString(from: NSDate() as Date, dateStyle: .none, timeStyle: .medium)
    }
    
}


