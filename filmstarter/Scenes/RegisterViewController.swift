//
//  RegisterViewController.swift
//  filmstarter
//
//  Created by Dion Misic on 23/5/19.
//  Copyright © 2019 Dion Misic. All rights reserved.
//

import Foundation
import UIKit

class RegisterViewController : FSBaseViewController
{
    var registerBox : UIView? = nil;
    
    override func viewDidLoad()
    {
        super.includeScrollView = true;
        super.includeLogo = false;
        super.viewDidLoad();
        self.hideKeyboardWhenTappedAround();
        
        scrollView!.backgroundColor = UIColor.white;
        setupRegisterBox();
    }
    
    func setupRegisterBox()
    {
        registerBox = UIView(frame: scrollView!.bounds);
        registerBox!.translatesAutoresizingMaskIntoConstraints = false;
        registerBox!.setContentHuggingPriority(UILayoutPriority(1000), for: NSLayoutConstraint.Axis.vertical);
        registerBox!.setContentCompressionResistancePriority(UILayoutPriority(1000), for: NSLayoutConstraint.Axis.vertical);
        registerBox!.backgroundColor = UIColor.white;
        
        scrollView!.addSubview(registerBox!);
        
        registerBox!.leadingAnchor.constraint(equalTo: scrollView!.leadingAnchor).isActive = true;
        registerBox!.trailingAnchor.constraint(equalTo: scrollView!.trailingAnchor).isActive = true;
        registerBox!.topAnchor.constraint(equalTo: scrollView!.topAnchor).isActive = true;
        registerBox!.bottomAnchor.constraint(equalTo: scrollView!.bottomAnchor).isActive = true;
        registerBox!.widthAnchor.constraint(equalTo: scrollView!.widthAnchor).isActive = true;
        
        let closeButton = FSButton(frame: registerBox!.bounds);
        closeButton.setTitle("X", for: UIControl.State.normal);
        closeButton.translatesAutoresizingMaskIntoConstraints = false;
        closeButton.titleColor = "#ffffff";
        closeButton.firstColor = "#f1407e";
        closeButton.secondColor = "#f2693c";
        
        registerBox!.addSubview(closeButton);
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false;
        closeButton.topAnchor.constraint(equalTo: registerBox!.topAnchor, constant: 40).isActive = true;
        closeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true;
        closeButton.widthAnchor.constraint(equalToConstant: 50).isActive = true;
        closeButton.centerXAnchor.constraint(equalTo: registerBox!.centerXAnchor).isActive = true;
        closeButton.addTarget(self, action: #selector(closeRegisterButtonTap), for: .touchUpInside);
        
        let label = FSLabel(frame: registerBox!.bounds);
        label.font = UIFont(name: "MyriadPro-Bold", size: 42);
        label.text = "Register.";
        label.kerning = -1.75;
        
        registerBox!.addSubview(label);
        
        label.translatesAutoresizingMaskIntoConstraints = false;
        label.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 50).isActive = true;
        label.heightAnchor.constraint(equalToConstant: 60).isActive = true;
        label.leadingAnchor.constraint(equalTo: registerBox!.leadingAnchor, constant: 20).isActive = true;
        
        let subTitle = FSLabel(frame: registerBox!.bounds);
        subTitle.textColor = UIColor.lightGray;
        subTitle.font = UIFont(name: "MyriadPro-Regular", size: 16);
        subTitle.text = "Your account details will be encrypted and sent to the cloud.";
        subTitle.numberOfLines = 0;
        
        registerBox!.addSubview(subTitle);
        
        subTitle.translatesAutoresizingMaskIntoConstraints = false;
        subTitle.topAnchor.constraint(equalTo: label.bottomAnchor).isActive = true;
        subTitle.leadingAnchor.constraint(equalTo: registerBox!.leadingAnchor, constant: 20).isActive = true;
        subTitle.trailingAnchor.constraint(equalTo: registerBox!.trailingAnchor, constant: -20).isActive = true;
        subTitle.centerXAnchor.constraint(equalTo: registerBox!.centerXAnchor).isActive = true;
        
        let firstNameInput = FSInput(frame: registerBox!.bounds);
        firstNameInput.placeholder = "First Name"
        firstNameInput.translatesAutoresizingMaskIntoConstraints = false;
        
        registerBox!.addSubview(firstNameInput);
        
        firstNameInput.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant: 20).isActive = true;
        firstNameInput.leadingAnchor.constraint(equalTo: registerBox!.leadingAnchor, constant: 20).isActive = true;
        firstNameInput.trailingAnchor.constraint(equalTo: registerBox!.trailingAnchor, constant: -20).isActive = true;
        firstNameInput.heightAnchor.constraint(equalToConstant: 60).isActive = true;
        firstNameInput.centerXAnchor.constraint(equalTo: registerBox!.centerXAnchor).isActive = true;
        
        let lastNameInput = FSInput(frame: registerBox!.bounds);
        lastNameInput.placeholder = "Last Name"
        lastNameInput.translatesAutoresizingMaskIntoConstraints = false;
        
        registerBox!.addSubview(lastNameInput);
        
        lastNameInput.topAnchor.constraint(equalTo: firstNameInput.bottomAnchor, constant: 10).isActive = true;
        lastNameInput.leadingAnchor.constraint(equalTo: registerBox!.leadingAnchor, constant: 20).isActive = true;
        lastNameInput.trailingAnchor.constraint(equalTo: registerBox!.trailingAnchor, constant: -20).isActive = true;
        lastNameInput.heightAnchor.constraint(equalToConstant: 60).isActive = true;
        lastNameInput.centerXAnchor.constraint(equalTo: registerBox!.centerXAnchor).isActive = true;

        let emailInput = FSInput(frame: registerBox!.bounds);
        emailInput.placeholder = "Email"
        emailInput.translatesAutoresizingMaskIntoConstraints = false;
        emailInput.keyboardType = .emailAddress;
        
        registerBox!.addSubview(emailInput);
        
        emailInput.topAnchor.constraint(equalTo: lastNameInput.bottomAnchor, constant: 10).isActive = true;
        emailInput.leadingAnchor.constraint(equalTo: registerBox!.leadingAnchor, constant: 20).isActive = true;
        emailInput.trailingAnchor.constraint(equalTo: registerBox!.trailingAnchor, constant: -20).isActive = true;
        emailInput.heightAnchor.constraint(equalToConstant: 60).isActive = true;
        emailInput.centerXAnchor.constraint(equalTo: registerBox!.centerXAnchor).isActive = true;
        
        let usernameInput = FSInput(frame: registerBox!.bounds);
        usernameInput.placeholder = "Username"
        usernameInput.translatesAutoresizingMaskIntoConstraints = false;
        
        registerBox!.addSubview(usernameInput);
        
        usernameInput.topAnchor.constraint(equalTo: emailInput.bottomAnchor, constant: 10).isActive = true;
        usernameInput.leadingAnchor.constraint(equalTo: registerBox!.leadingAnchor, constant: 20).isActive = true;
        usernameInput.trailingAnchor.constraint(equalTo: registerBox!.trailingAnchor, constant: -20).isActive = true;
        usernameInput.heightAnchor.constraint(equalToConstant: 60).isActive = true;
        usernameInput.centerXAnchor.constraint(equalTo: registerBox!.centerXAnchor).isActive = true;
        
        let passwordInput = FSInput(frame: registerBox!.bounds);
        passwordInput.placeholder = "Password"
        passwordInput.translatesAutoresizingMaskIntoConstraints = false;
        passwordInput.isSecureTextEntry = true;
        
        registerBox!.addSubview(passwordInput);
        
        passwordInput.topAnchor.constraint(equalTo: usernameInput.bottomAnchor, constant: 10).isActive = true;
        passwordInput.leadingAnchor.constraint(equalTo: registerBox!.leadingAnchor, constant: 20).isActive = true;
        passwordInput.trailingAnchor.constraint(equalTo: registerBox!.trailingAnchor, constant: -20).isActive = true;
        passwordInput.heightAnchor.constraint(equalToConstant: 60).isActive = true;
        passwordInput.centerXAnchor.constraint(equalTo: registerBox!.centerXAnchor).isActive = true;
        
        let registerButton = FSButton(frame: registerBox!.bounds);
        registerButton.setTitle("Register", for: UIControl.State.normal);
        registerButton.translatesAutoresizingMaskIntoConstraints = false;
        registerButton.titleColor = "#ffffff";
        registerButton.firstColor = "#f1407e";
        registerButton.secondColor = "#f2693c";
        
        registerBox!.addSubview(registerButton);
        
        registerButton.topAnchor.constraint(greaterThanOrEqualTo: passwordInput.bottomAnchor, constant: 15).isActive = true;
        registerButton.leadingAnchor.constraint(equalTo: registerBox!.leadingAnchor, constant: 20).isActive = true;
        registerButton.trailingAnchor.constraint(equalTo: registerBox!.trailingAnchor, constant: -20).isActive = true;
        registerButton.heightAnchor.constraint(equalToConstant: 60).isActive = true;
        registerButton.centerXAnchor.constraint(equalTo: registerBox!.centerXAnchor).isActive = true;
        registerButton.bottomAnchor.constraint(equalTo: registerBox!.bottomAnchor, constant: -30).isActive = true;
        registerButton.addTarget(self, action: #selector(registerButtonTap), for: .touchUpInside);
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        return true;
    }
    
    @objc func closeRegisterButtonTap()
    {
        self.dismiss(animated: true, completion: nil);
    }
    
    @objc func registerButtonTap()
    {
        self.dismiss(animated: true, completion: nil);
    }
}
