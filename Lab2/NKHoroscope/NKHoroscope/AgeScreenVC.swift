//
//  AgeScreenVC.swift
//  NKHoroscope
//
//  Created by Nikita Khomitsevich on 9/23/16.
//  Copyright © 2016 cybervisiontech. All rights reserved.
//

import UIKit

internal let AgeScreenSegue = "AgeScreenSegue"

class AgeScreenVC: UIViewController, UITextFieldDelegate {

    var person: Person!
    
    @IBOutlet weak var dayUpButton: UIButton!
    @IBOutlet weak var dayDownButton: UIButton!
    @IBOutlet weak var dayTextField: UITextField! {
        didSet { dayTextField.delegate = self }
    }
    
    @IBOutlet weak var monthUpButton: UIButton!
    @IBOutlet weak var monthDownButton: UIButton!
    @IBOutlet weak var monthTextField: UITextField! {
        didSet {
            monthTextField.delegate = self
        }
    }
    
    @IBOutlet weak var yearUpButton: UIButton!
    @IBOutlet weak var yearDownButton: UIButton!
    @IBOutlet weak var yearTextField: UITextField! {
        didSet {
            yearTextField.delegate = self
        }
    }

    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(AgeScreenVC.dismissKeyboard))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        self.dayTextField.resignFirstResponder()
        self.monthTextField.resignFirstResponder()
        self.yearTextField.resignFirstResponder()
    }
    
    // MARK: Navigation
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == AgeScreenSegue && isEmptyTextField(self.dayTextField) && isEmptyTextField(self.monthTextField) && isEmptyTextField(self.yearTextField) {
            return true
        }
        return false
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let day = Int(dayTextField.text!)
        let month = Int(monthTextField.text!)
        let year = Int(yearTextField.text!)
        let birthday = Birthday(day: day!, month: month!, year: year!)
        
        let destination = segue.destinationViewController as! HoroscopeSignInfoVC
        destination.person = Person(name: self.person.name, surname: self.person.surname, birthday: birthday)
    }
    
    // MARK: IBActions
    
    // Day
    @IBAction func dayEditingAction(sender: AnyObject) {
        self.dayMinVal(self.dayTextField)
        self.dayMaxVal(self.dayTextField)
    }
    
    @IBAction func dayUp(sender: AnyObject) {
        self.increaseDateVal(self.dayTextField)
        
        self.dayMinVal(self.dayTextField)
        self.dayMaxVal(self.dayTextField)
    }
    
    @IBAction func dayDown(sender: AnyObject) {
        self.decreaseDateVal(self.dayTextField)
        
        self.dayMinVal(self.dayTextField)
        self.dayMaxVal(self.dayTextField)
    }
    
    // Month
    @IBAction func monthEdtingAction(sender: AnyObject) {
        self.monthMinVal(self.monthTextField)
        self.monthMaxVal(self.monthTextField)
    }
    
    @IBAction func monthUp(sender: AnyObject) {
        self.increaseDateVal(self.monthTextField)
        
        self.monthMinVal(self.monthTextField)
        self.monthMaxVal(self.monthTextField)
    }
    
    @IBAction func monthDown(sender: AnyObject) {
        self.decreaseDateVal(self.monthTextField)
        
        self.monthMinVal(self.monthTextField)
        self.monthMaxVal(self.monthTextField)
    }
    
    // Year
    @IBAction func yearEditingAction(sender: AnyObject) {
        self.yearMinVal(self.yearTextField)
        self.yearMaxVal(self.yearTextField)
    }
    
    @IBAction func yearUp(sender: AnyObject) {
        self.increaseDateVal(self.yearTextField)
        
        self.yearMinVal(self.yearTextField)
        self.yearMaxVal(self.yearTextField)
    }
    
    @IBAction func yearDown(sender: AnyObject) {
        self.decreaseDateVal(self.yearTextField)
        
        self.yearMinVal(self.yearTextField)
        self.yearMaxVal(self.yearTextField)
    }
    
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    // MARK: Support Methods
    
    func isEmptyTextField(tf: UITextField) -> Bool {
        if tf.text != nil && tf.text != "" && self.isNumber(tf) {
            return true
        }
        
        return false
    }
    
    func isNumber(tf: UITextField) -> Bool {
        if let text = tf.text {
            if let _ = Int(text) {
                return true
            }
        }
        
        return false
    }
    
    // Plus/Minus Operations
    
    func increaseDateVal(tf: UITextField) {
        if let text = tf.text {
            if let val = Int(text) {
                tf.text = "\(val + 1)"
            }
        }
    }
    
    func decreaseDateVal(tf: UITextField) {
        if let text = tf.text {
            if let val = Int(text) {
                tf.text = "\(val - 1)"
            }
        }
    }
    
    // Checking
    
    func dayMinVal(day: UITextField) {
        if let text = day.text {
            if let val = Int(text) {
                if val < 1 {
                    day.text = "1"
                }
            }
        }
    }
    
    func dayMaxVal(day: UITextField) {
        if let text = day.text {
            if let val = Int(text) {
                if val > 31  {
                    day.text = "31"
                }
            }
        }
    }
    
    func monthMinVal(month: UITextField) {
        if let text = month.text {
            if let val = Int(text) {
                if val < 1 {
                    month.text = "1"
                }
            }
        }
    }
    
    func monthMaxVal(month: UITextField) {
        if let text = month.text {
            if let val = Int(text) {
                if val > 12 {
                    month.text = "12"
                }
            }
        }
    }
    
    func yearMinVal(year: UITextField) {
        if let text = year.text {
            if let val = Int(text) {
                if val < 1950 {
                    year.text = "1950"
                }
            }
        }
    }
    
    func yearMaxVal(year: UITextField) {
        if let text = year.text {
            if let val = Int(text) {
                if val > 2016 {
                    year.text = "2016"
                }
            }
        }
    }

}
