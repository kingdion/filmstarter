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
        self.view.backgroundColor = UIColor.white;
        
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
        closeButton.addTarget(self, action: #selector(closeLoginButtonTap), for: .touchUpInside);
        
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
        subTitle.text = "Your account details are securely stored.";
        subTitle.numberOfLines = 0;
        
        registerBox!.addSubview(subTitle);
        
        subTitle.translatesAutoresizingMaskIntoConstraints = false;
        subTitle.topAnchor.constraint(equalTo: label.bottomAnchor).isActive = true;
        subTitle.leadingAnchor.constraint(equalTo: registerBox!.leadingAnchor, constant: 20).isActive = true;
        subTitle.trailingAnchor.constraint(equalTo: registerBox!.trailingAnchor, constant: -20).isActive = true;
        subTitle.centerXAnchor.constraint(equalTo: registerBox!.centerXAnchor).isActive = true;
        
        let usernameInput = FSInput(frame: registerBox!.bounds);
        usernameInput.placeholder = "Username"
        usernameInput.translatesAutoresizingMaskIntoConstraints = false;
        usernameInput.autocorrectionType = .no;
        usernameInput.autocapitalizationType = .none;
        
        registerBox!.addSubview(usernameInput);
        
        usernameInput.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant: 20).isActive = true;
        usernameInput.leadingAnchor.constraint(equalTo: registerBox!.leadingAnchor, constant: 20).isActive = true;
        usernameInput.trailingAnchor.constraint(equalTo: registerBox!.trailingAnchor, constant: -20).isActive = true;
        usernameInput.heightAnchor.constraint(equalToConstant: 60).isActive = true;
        usernameInput.centerXAnchor.constraint(equalTo: registerBox!.centerXAnchor).isActive = true;
        
        let passwordInput = FSInput(frame: registerBox!.bounds);
        passwordInput.placeholder = "Password"
        passwordInput.translatesAutoresizingMaskIntoConstraints = false;
        passwordInput.autocorrectionType = .no;
        passwordInput.autocapitalizationType = .none;
        passwordInput.isSecureTextEntry = true;
        
        registerBox!.addSubview(passwordInput);
        
        passwordInput.topAnchor.constraint(equalTo: usernameInput.bottomAnchor, constant: 10).isActive = true;
        passwordInput.leadingAnchor.constraint(equalTo: registerBox!.leadingAnchor, constant: 20).isActive = true;
        passwordInput.trailingAnchor.constraint(equalTo: registerBox!.trailingAnchor, constant: -20).isActive = true;
        passwordInput.heightAnchor.constraint(equalToConstant: 60).isActive = true;
        passwordInput.centerXAnchor.constraint(equalTo: registerBox!.centerXAnchor).isActive = true;
        
        let loginButton = FSButton(frame: registerBox!.bounds);
        loginButton.setTitle("Login", for: UIControl.State.normal);
        loginButton.translatesAutoresizingMaskIntoConstraints = false;
        loginButton.titleColor = "#ffffff";
        loginButton.firstColor = "#f1407e";
        loginButton.secondColor = "#f2693c";
        
        registerBox!.addSubview(loginButton);
        
        loginButton.topAnchor.constraint(greaterThanOrEqualTo: passwordInput.bottomAnchor, constant: 10).isActive = true;
        loginButton.leadingAnchor.constraint(equalTo: registerBox!.leadingAnchor, constant: 20).isActive = true;
        loginButton.trailingAnchor.constraint(equalTo: registerBox!.trailingAnchor, constant: -20).isActive = true;
        loginButton.heightAnchor.constraint(equalToConstant: 60).isActive = true;
        loginButton.centerXAnchor.constraint(equalTo: registerBox!.centerXAnchor).isActive = true;
        loginButton.bottomAnchor.constraint(equalTo: registerBox!.bottomAnchor, constant: -30).isActive = true;
        loginButton.addTarget(self, action: #selector(loginButtonTap), for: .touchUpInside);
    }
    
    @objc func closeLoginButtonTap()
    {
        self.dismiss(animated: true, completion: nil);
    }
    
    @objc func loginButtonTap()
    {
        self.dismiss(animated: true, completion: nil);
    }
}
