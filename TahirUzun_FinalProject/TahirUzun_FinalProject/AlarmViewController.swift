//
//  AlarmViewController.swift
//  TahirUzun_FinalProject
//
//  Created by Tahir Uzun on 3/17/20.
//  Copyright © 2020 Tahir Uzun. All rights reserved.
//

import Foundation
import UIKit

class AlarmViewController: UIViewController {

override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
}
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var addAlarmButton: UIButton!
    @IBOutlet weak var Reset: UIButton!
    @IBOutlet weak var alarmTextField: UITextView!
    
    
    @IBAction func datePicked(_ sender: Any) {
        let dateFormatter = DateFormatter()

        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short

        let strDate = dateFormatter.string(from: datePicker.date)
        dateLabel.text = strDate
    }
    
    @IBAction func alarmButtonPressed(_ sender: UIButton) {
        if dateLabel.text != "" {
            if alarmTextField.text == "No Alarms" {
                alarmTextField.text = ""
            }
            alarmTextField.text = dateLabel.text! + "\n" + alarmTextField.text!
        }
        if dateLabel.text == "" {
            let alert2 = UIAlertController(title: "Missing Input", message: "Make sure task field is not empty", preferredStyle: .alert)
            let okAlert2 = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
            alert2.addAction(okAlert2)
            self.present(alert2, animated: true, completion: nil)
        }
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        alarmTextField.text = ""
        dateLabel.text = ""
        alarmTextField.text = "No Alarm"
    }
    
    
    
}
