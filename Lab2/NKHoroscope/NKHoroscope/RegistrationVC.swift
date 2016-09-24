//
//  ViewController.swift
//  NKHoroscope
//
//  Created by Nikita Khomitsevich on 9/23/16.
//  Copyright © 2016 cybervisiontech. All rights reserved.
//

import UIKit

internal let RegistrationSegue = "RegistrationSegue"

class RegistrationVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var name: UITextField! {
        didSet { name.delegate = self }
    }
    
    @IBOutlet weak var surname: UITextField! {
        didSet { surname.delegate = self }
    }
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(AgeScreenVC.dismissKeyboard))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        self.name.resignFirstResponder()
        self.surname.resignFirstResponder()
    }
    
    // MARK: Navigation
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
		if identifier == RegistrationSegue && isEmptyTextField(name) && isEmptyTextField(surname) {
            return true
        }
        return false
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination = segue.destinationViewController as! AgeScreenVC
        destination.person = Person(name: self.name.text!, surname: self.surname.text!)
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: Support Methods
    
    func isEmptyTextField(tf: UITextField) -> Bool {
        if tf.text == nil || tf.text == "" {
            return false
        }
        return true
    }
}
