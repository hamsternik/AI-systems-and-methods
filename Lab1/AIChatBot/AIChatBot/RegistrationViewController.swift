//
//  RegistrationViewController.swift
//  AIChatBot
//
//  Created by Nikita Khomitsevich on 10/6/16.
//  Copyright © 2016 cybervisiontech. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController, UITextFieldDelegate {
    
    var person: Person?
    
    @IBOutlet weak var nameTextField: UITextField! {
        didSet { nameTextField?.delegate = self }
    }
    
    @IBOutlet weak var surnameTextField: UITextField! {
        didSet { surnameTextField?.delegate = self }
    }
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.person = Person()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(RegistrationViewController.dismissKeyboard))
        self.view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        self.nameTextField.resignFirstResponder()
        self.surnameTextField.resignFirstResponder()
    }
    
    // MARK: UITextFieldDelegate
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        return true
//    }
//    
    // MARK: Support Methods
    
    func isEmptyTextField(tf: UITextField) -> Bool {
        if tf.text == nil || tf.text == "" {
            return true
        }
        return false
    }
    
    // MARK: IBActions
    
    @IBAction func nameEditingDidEnd(_ sender: AnyObject) {
        let tf = sender as! UITextField
        self.person?.name = tf.text
    }
    
    @IBAction func surnameEditingDidEnd(_ sender: AnyObject) {
        let tf = sender as! UITextField
        self.person?.surname = tf.text
    }
    
    @IBAction func registerPerson(_ sender: AnyObject) {
        if !isEmptyTextField(tf: self.nameTextField) && !isEmptyTextField(tf: self.surnameTextField) {
            let chatViewController = ChatViewController()
            self.navigationController?.pushViewController(chatViewController, animated: true)
        }
    }
}
