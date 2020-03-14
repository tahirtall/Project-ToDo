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
        getCurrentTime()
        // Do any additional setup after loading the view.
    }
    
    // Clock Button
    @IBOutlet weak var clockButtonLabel: UIButton!
    var timer = Timer()
    private func getCurrentTime() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.clockButton(_:)) , userInfo: nil, repeats: true)
    }
    @IBAction func clockButton(_ sender: UIButton) {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        clockButtonLabel.setTitle(formatter.string(from: Date()), for: .normal)
    }
    
}

