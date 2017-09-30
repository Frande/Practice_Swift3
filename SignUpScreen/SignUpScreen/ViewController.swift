//
//  ViewController.swift
//  SignUpScreen
//
//  Created by Tama on 2017. 9. 30..
//  Copyright © 2017년 Tama. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var idTextField: UIView!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var telTextField: UITextField!
    @IBOutlet var blogTextField: UITextField!
    
    @IBOutlet var resultTextView: UITextView!
    
    @IBAction func signUpAction(_ sender: AnyObject) {
        resultTextView.text = "\(nameTextField.text!) 님 가입을 축하합니다."
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        print("textFieldShouldReturn")
//        nameTextField.resignFirstResponder()
//        idTextField.resignFirstResponder()
//        passwordTextField.resignFirstResponder()
//        telTextField.resignFirstResponder()
//        blogTextField.resignFirstResponder()
        
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("touchesBegan")
        self.view.endEditing(true)
    }
    
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("touchesMoved")
//    }
//
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("touchesEnded")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        nameTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

