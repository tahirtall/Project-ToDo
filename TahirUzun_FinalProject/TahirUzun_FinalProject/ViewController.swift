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
    }
    
    // Main Menu Clock
    @IBOutlet weak var clockLabel: UILabel!
    var timer = Timer()
    @objc func tick() {
        clockLabel?.text = DateFormatter.localizedString(from: NSDate() as Date, dateStyle: .none, timeStyle: .medium)
    }
    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var AddButton: UIButton!
    @IBOutlet weak var taskLabel: UITextView!
    @IBOutlet weak var newListButton: UIButton!
    
    
    var addButtonTag:Int = 4
    var newListButtonTag:Int = 5
    var isEmpty:Bool = true
    var isEmpty2:Bool = true
    
    // Add Task
    @IBAction func addtask(_ sender: UIButton) {
        if sender.tag == 4 {
            if (taskTextField.text?.isEmpty == false) {
                isEmpty = false
                if taskLabel.text == "No Tasks" {
                    taskLabel.text = ""
                }
                taskLabel.text = taskTextField.text! + "\n" + taskLabel.text!
                taskTextField.text = ""
            }
            else {
                isEmpty = true
            }
        }
        if isEmpty == true {
            if sender.tag == 4 {
                let alert = UIAlertController(title: "Missing Input", message: "Make sure task field is not empty", preferredStyle: .alert)
                let okAlert = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                alert.addAction(okAlert)
                self.present(alert, animated: true, completion: nil)
            }
        }
        if sender.tag == newListButtonTag {
            if taskLabel.text != "No Tasks" {
                isEmpty2 = false
                taskLabel.text = ""
                taskLabel.text = "No Tasks"
            }
        }
    }
    
    
}



