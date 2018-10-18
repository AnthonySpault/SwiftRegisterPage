//
//  ViewController.swift
//  login page
//
//  Created by Anthony Spault on 10/10/2018.
//  Copyright © 2018 Anthony Spault. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // BACKGROUND
        let background = UIImage(named: "background.jpg")
        let backgroundView = UIImageView(image: background)
        backgroundView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        backgroundView.contentMode = .scaleAspectFill
        
        
        // LEGAL
        let ml = UILabel()
        ml.text = "Attention lors de l'inscription, vous devez payer 69,69€ HT à Anthony Spault, fabuleux créateur de cette application"
        ml.textColor = UIColor.white
        ml.frame = CGRect(x: 24, y: self.view.frame.height - 60, width: self.view.frame.width - 48, height: 36)
        ml.textAlignment = .center
        ml.font = ml.font.withSize(10)
        ml.lineBreakMode = .byWordWrapping
        ml.numberOfLines = 0;
        
        
        // BUTTON
        let validateButton = UIButton()
        validateButton.frame = CGRect(x: 24, y: ml.frame.origin.y - 70, width: self.view.frame.width - 48, height: 36)
        validateButton.setTitle("S'inscrire", for: .normal)
        validateButton.setTitleColor(UIColor.white, for: .normal)
        validateButton.backgroundColor = UIColor.purple
        validateButton.layer.cornerRadius = 7
//        validateButton.addTarget(self, action: "submitForm", for: .touchUpInside)
        
        
        // PASSWORD CONFIRM
        let passwordConfirm = TextField()
        passwordConfirm.text = nil
        passwordConfirm.placeholder = "Confirmer votre mot de passe"
        passwordConfirm.frame = CGRect(x: 24, y: validateButton.frame.origin.y - 60, width: self.view.frame.width - 48, height: 36)
        passwordConfirm.backgroundColor = UIColor.white
        passwordConfirm.layer.cornerRadius = 7
        passwordConfirm.alpha = 0.9
        passwordConfirm.keyboardAppearance = UIKeyboardAppearance.dark
        passwordConfirm.returnKeyType = UIReturnKeyType.join
        passwordConfirm.isSecureTextEntry = true
        passwordConfirm.tag = 5
        passwordConfirm.delegate = self
        
        
        // PASSWORD
        let password = TextField()
        password.text = nil
        password.placeholder = "Mot de passe"
        password.frame = CGRect(x: 24, y: passwordConfirm.frame.origin.y - 60, width: self.view.frame.width - 48, height: 36)
        password.backgroundColor = UIColor.white
        password.layer.cornerRadius = 7
        password.alpha = 0.9
        password.keyboardAppearance = UIKeyboardAppearance.dark
        password.returnKeyType = UIReturnKeyType.next
        password.isSecureTextEntry = true
        password.tag = 4
        password.delegate = self
        
        
        // EMAIL
        let email = TextField()
        email.text = nil
        email.placeholder = "Email"
        email.frame = CGRect(x: 24, y: password.frame.origin.y - 60, width: self.view.frame.width - 48, height: 36)
        email.backgroundColor = UIColor.white
        email.layer.cornerRadius = 7
        email.alpha = 0.9
        email.keyboardAppearance = UIKeyboardAppearance.dark;
        email.keyboardType = UIKeyboardType.emailAddress
        email.returnKeyType = UIReturnKeyType.continue
        email.tag = 3
        email.delegate = self
        
        
        // LASTNAME
        let lastname = TextField()
        lastname.text = nil
        lastname.placeholder = "Nom"
        lastname.frame = CGRect(x: 24, y: email.frame.origin.y - 60, width: self.view.frame.width - 48, height: 36)
        lastname.backgroundColor = UIColor.white
        lastname.layer.cornerRadius = 7
        lastname.alpha = 0.9
        lastname.keyboardAppearance = UIKeyboardAppearance.dark
        lastname.returnKeyType = UIReturnKeyType.continue
        lastname.tag = 2
        lastname.delegate = self
        
        
        // FIRSTNAME
        let firstname = TextField()
        firstname.text = nil
        firstname.placeholder = "Prénom"
        firstname.frame = CGRect(x: 24, y: lastname.frame.origin.y - 60, width: self.view.frame.width - 48, height: 36)
        firstname.backgroundColor = UIColor.white
        firstname.layer.cornerRadius = 7
        firstname.alpha = 0.9
        firstname.keyboardAppearance = UIKeyboardAppearance.dark
        firstname.returnKeyType = UIReturnKeyType.continue
        firstname.tag = 1
        firstname.delegate = self
        
        
        // LOGO
        let logo = UIImage(named: "logo.png")
        let logoView = UIImageView(image: logo)
        logoView.frame = CGRect(x: self.view.frame.width / 2 - 125, y: firstname.frame.origin.y - 400, width: 250, height: 305)
        
        
        
        
        self.view.addSubview(backgroundView)
        self.view.addSubview(ml)
        self.view.addSubview(validateButton)
        self.view.addSubview(passwordConfirm)
        self.view.addSubview(password)
        self.view.addSubview(email)
        self.view.addSubview(lastname)
        self.view.addSubview(firstname)
        self.view.addSubview(logoView)
    }
    
    func submitForm() {
        for view in self.view.subviews {
            if let textField = view as? UITextField {
                print(textField.placeholder! + " : " + textField.text!)
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        // Try to find next responder
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
            submitForm()
        }
        // Do not add a line break
        return false
    }
}

