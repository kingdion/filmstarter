//
//  HomeViewController.swift
//  filmstarter
//
//  Created by Dion Misic on 16/5/19.
//  Copyright © 2019 Dion Misic. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    var contentView : UIView? = nil;
    var scrollView : UIScrollView? = nil;
    let logo = UIImageView(image: UIImage(named: "logo-white.png"));
    
    var loginBox : UIView? = nil;
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        
        setupBackground();
        setupMainView();
        setupMainLogo();
        setupScrollView();
        
        setupLoginBox();
    }
    
    func setupLoginBox()
    {
        loginBox = UIView(frame: scrollView!.bounds);
        loginBox!.translatesAutoresizingMaskIntoConstraints = false;
        loginBox!.layer.cornerRadius = 35.0;
        loginBox!.setContentHuggingPriority(UILayoutPriority(1000), for: NSLayoutConstraint.Axis.vertical);
        loginBox!.setContentCompressionResistancePriority(UILayoutPriority(1000), for: NSLayoutConstraint.Axis.vertical);
        
        scrollView!.addSubview(loginBox!);
        
        loginBox!.centerXAnchor.constraint(equalTo: scrollView!.centerXAnchor).isActive = true;
        loginBox!.centerYAnchor.constraint(equalTo: scrollView!.centerYAnchor).isActive = true;
        loginBox!.topAnchor.constraint(equalTo: logo.bottomAnchor).isActive = true;
        loginBox!.leadingAnchor.constraint(equalTo: scrollView!.leadingAnchor).isActive = true;
        loginBox!.trailingAnchor.constraint(equalTo: scrollView!.trailingAnchor).isActive = true;
        
        let label = FSLabel(frame: loginBox!.bounds);
        label.kerning = -1;
        label.font = UIFont(name: "Helvetica-Bold", size: 32);
        label.text = "Log In.";
        
        loginBox!.addSubview(label);
        
        label.translatesAutoresizingMaskIntoConstraints = false;
        label.topAnchor.constraint(equalTo: loginBox!.topAnchor, constant: 40).isActive = true;
        label.heightAnchor.constraint(equalToConstant: 60).isActive = true;
        label.leadingAnchor.constraint(equalTo: loginBox!.leadingAnchor, constant: 20).isActive = true;
        
        let usernameInput = FSInput(frame: loginBox!.bounds);
        usernameInput.placeholder = "Username"
        usernameInput.translatesAutoresizingMaskIntoConstraints = false;
        usernameInput.autocorrectionType = .no;
        usernameInput.autocapitalizationType = .none;
        
        loginBox!.addSubview(usernameInput);
        
        usernameInput.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 15).isActive = true;
        usernameInput.leadingAnchor.constraint(equalTo: loginBox!.leadingAnchor, constant: 20).isActive = true;
        usernameInput.trailingAnchor.constraint(equalTo: loginBox!.trailingAnchor, constant: -20).isActive = true;
        usernameInput.heightAnchor.constraint(equalToConstant: 60).isActive = true;
        usernameInput.centerXAnchor.constraint(equalTo: loginBox!.centerXAnchor).isActive = true;
        
        let passwordInput = FSInput(frame: loginBox!.bounds);
        passwordInput.placeholder = "Password"
        passwordInput.translatesAutoresizingMaskIntoConstraints = false;
        passwordInput.autocorrectionType = .no;
        passwordInput.autocapitalizationType = .none;
        passwordInput.isSecureTextEntry = true;
        
        loginBox!.addSubview(passwordInput);
        
        passwordInput.topAnchor.constraint(equalTo: usernameInput.bottomAnchor, constant: 10).isActive = true;
        passwordInput.leadingAnchor.constraint(equalTo: loginBox!.leadingAnchor, constant: 20).isActive = true;
        passwordInput.trailingAnchor.constraint(equalTo: loginBox!.trailingAnchor, constant: -20).isActive = true;
        passwordInput.heightAnchor.constraint(equalToConstant: 60).isActive = true;
        passwordInput.centerXAnchor.constraint(equalTo: loginBox!.centerXAnchor).isActive = true;
        
        let loginButton = FSButton(frame: loginBox!.bounds);
        loginButton.setTitle("Login", for: UIControl.State.normal);
        loginButton.translatesAutoresizingMaskIntoConstraints = false;
        loginButton.titleColor = "#ffffff";
        loginButton.firstColor = "#f1407e";
        loginButton.secondColor = "#f2693c";
        
        loginBox!.addSubview(loginButton);
        
        loginButton.topAnchor.constraint(equalTo: passwordInput.bottomAnchor, constant: 10).isActive = true;
        loginButton.leadingAnchor.constraint(equalTo: loginBox!.leadingAnchor, constant: 20).isActive = true;
        loginButton.trailingAnchor.constraint(equalTo: loginBox!.trailingAnchor, constant: -20).isActive = true;
        loginButton.heightAnchor.constraint(equalToConstant: 55).isActive = true;
        loginButton.centerXAnchor.constraint(equalTo: loginBox!.centerXAnchor).isActive = true;
        
        let registerButton = FSButton(frame: loginBox!.bounds);
        registerButton.setTitle("Register", for: UIControl.State.normal);
        registerButton.translatesAutoresizingMaskIntoConstraints = false;
        registerButton.firstColor = "#e9e9e9";
        registerButton.secondColor = "#f2f2f2";
        
        loginBox!.addSubview(registerButton);
        
        registerButton.leadingAnchor.constraint(equalTo: loginBox!.leadingAnchor, constant: 20).isActive = true;
        registerButton.trailingAnchor.constraint(equalTo: loginBox!.trailingAnchor, constant: -20).isActive = true;
        registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10).isActive = true;
        registerButton.heightAnchor.constraint(equalToConstant: 55).isActive = true;
        registerButton.centerXAnchor.constraint(equalTo: loginBox!.centerXAnchor).isActive = true;
    }
    
    func setupScrollView()
    {
        scrollView = UIScrollView(frame: contentView!.bounds);
        scrollView!.translatesAutoresizingMaskIntoConstraints = false;
        scrollView!.contentSize.height = 2000;
        scrollView!.layer.cornerRadius = 35.0;
        scrollView!.backgroundColor = UIColor.white;
        
        contentView!.addSubview(scrollView!);
        
        scrollView!.leadingAnchor.constraint(equalTo: contentView!.leadingAnchor, constant: 15).isActive = true;
        scrollView!.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 25).isActive = true;
        scrollView!.bottomAnchor.constraint(equalTo: contentView!.bottomAnchor, constant: -15).isActive = true;
        scrollView!.trailingAnchor.constraint(equalTo: contentView!.trailingAnchor, constant: -15).isActive = true;
    }
    
    func setupMainView()
    {
        contentView = UIView(frame: self.view.bounds);
        contentView!.translatesAutoresizingMaskIntoConstraints = false;
        
        self.view.addSubview(contentView!);
        
        contentView!.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true;
        contentView!.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true;
        contentView!.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true;
        contentView!.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true;
    }
    
    func setupMainLogo()
    {
        logo.translatesAutoresizingMaskIntoConstraints = false;
        
        contentView!.addSubview(logo);
        
        logo.centerXAnchor.constraint(equalTo: contentView!.centerXAnchor).isActive = true;
        logo.heightAnchor.constraint(equalToConstant: 50).isActive = true;
        logo.widthAnchor.constraint(equalToConstant: 180).isActive = true;
        logo.topAnchor.constraint(equalTo: contentView!.topAnchor, constant: 40).isActive = true;
    }
    
    func setupBackground()
    {
        let backgroundWrapper = UIView(frame: CGRect(x: 0,
                                                     y: 0,
                                                     width: self.view.bounds.width,
                                                     height: self.view.bounds.height));
        
        let backgroundGradient = [UIColor(hex: "#f1407e"), UIColor(hex: "#f2693c")].gradient
        {
            gradient in
            gradient.startPoint = CGPoint(x: 0.3, y: 1)
            gradient.endPoint = CGPoint(x: 1, y: 0.3)
            return gradient
        }
        
        backgroundGradient.frame = backgroundWrapper.bounds;
        
        self.view.addSubview(backgroundWrapper);
        backgroundWrapper.layer.addSublayer(backgroundGradient);
        self.view.sendSubviewToBack(backgroundWrapper);
    }
}
