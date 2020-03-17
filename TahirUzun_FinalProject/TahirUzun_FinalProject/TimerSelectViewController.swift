//
//  TimerSelectViewController.swift
//  TahirUzun_FinalProject
//
//  Created by Tahir Uzun on 3/17/20.
//  Copyright © 2020 Tahir Uzun. All rights reserved.
//

import Foundation
import UIKit

class TimerSelectViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        pickerView.delegate = self
        pickerView.dataSource = self
    }

    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet weak var timerLabel: UILabel!
    
    var hour: Int = 0
    var minutes: Int = 0
    var seconds: Int = 0
    
    // Count Down
    var hour2: Int = 0
    var minutes2: Int = 0
    var seconds2:Int = 0
    var timer = Timer()
    var isTimerRunning = false
    var resumeTapped:Bool = false
    
    @IBAction func countDownStart(_ sender: UIButton) {
        theSeconds2()
        runTimer()
    }
    @IBAction func countDownPause(_ sender: UIButton) {
        if self.resumeTapped == false {
             timer.invalidate()
             self.resumeTapped = true
        } else {
             runTimer()
             self.resumeTapped = false
        }
    }
    @IBAction func countDownReset(_ sender: Any) {
        timer.invalidate()
        timerLabel.text = "00:00:00"
    }
    
    func runTimer() {
         timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(TimerSelectViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    func theSeconds2() {
        seconds2 = pickerView.selectedRow(inComponent: 2)
    }
    
    @objc func updateTimer() {
        seconds2 = seconds2 - 1
        timerLabel.text = "\(seconds2)"
    }
    
}

     extension TimerSelectViewController: UIPickerViewDelegate, UIPickerViewDataSource {

         func numberOfComponents(in pickerView: UIPickerView) -> Int {
             return 3
         }

         func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
             switch component {
             case 0:
                 return 25
             case 1, 2:
                 return 60
             default:
                 return 0
             }
         }

         func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
             return pickerView.frame.size.width/3
         }

         func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
             switch component {
             case 0:
                 return "\(row) hr"
             case 1:
                 return "\(row) min"
             case 2:
                 return "\(row) sec"
             default:
                 return ""
             }
         }
         func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
             switch component {
             case 0:
                 hour = row
             case 1:
                 minutes = row
             case 2:
                 seconds = row
             default:
                 break;
             }
            timerLabel.text = "\(hour):\(minutes):\(seconds)"
            
         }
     }
