//
//  LoginViewController.swift
//  filmstarter
//
//  Created by Dion Misic on 23/5/19.
//  Copyright © 2019 Dion Misic. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController : FSBaseViewController
{
    var loginBox : UIView? = nil;
    
    override func viewDidLoad()
    {
        super.includeLogo = false;
        super.includeScrollView = true;
        super.viewDidLoad();
        
        setupLoginBox()
    }
    
    func setupLoginBox()
    {
        loginBox = UIView(frame: scrollView!.bounds);
        loginBox!.translatesAutoresizingMaskIntoConstraints = false;
        loginBox!.setContentHuggingPriority(UILayoutPriority(1000), for: NSLayoutConstraint.Axis.vertical);
        loginBox!.setContentCompressionResistancePriority(UILayoutPriority(1000), for: NSLayoutConstraint.Axis.vertical);
        loginBox!.backgroundColor = UIColor.white;
        
        scrollView!.addSubview(loginBox!);
        
        loginBox!.leadingAnchor.constraint(equalTo: scrollView!.leadingAnchor).isActive = true;
        loginBox!.trailingAnchor.constraint(equalTo: scrollView!.trailingAnchor).isActive = true;
        loginBox!.topAnchor.constraint(equalTo: scrollView!.topAnchor).isActive = true;
        loginBox!.bottomAnchor.constraint(equalTo: scrollView!.bottomAnchor).isActive = true;
        loginBox!.widthAnchor.constraint(equalTo: scrollView!.widthAnchor).isActive = true;
        
        let closeButton = FSButton(frame: loginBox!.bounds);
        closeButton.setTitle("X", for: UIControl.State.normal);
        closeButton.translatesAutoresizingMaskIntoConstraints = false;
        closeButton.titleColor = "#ffffff";
        closeButton.firstColor = "#f1407e";
        closeButton.secondColor = "#f2693c";
        
        loginBox!.addSubview(closeButton);
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false;
        closeButton.topAnchor.constraint(equalTo: loginBox!.topAnchor, constant: 40).isActive = true;
        closeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true;
        closeButton.widthAnchor.constraint(equalToConstant: 50).isActive = true;
        closeButton.centerXAnchor.constraint(equalTo: loginBox!.centerXAnchor).isActive = true;
        closeButton.addTarget(self, action: #selector(closeLoginButtonTap), for: .touchUpInside);
        
        let label = FSLabel(frame: loginBox!.bounds);
        label.font = UIFont(name: "MyriadPro-Bold", size: 42);
        label.text = "Log In.";
        label.kerning = -1.75;
        
        loginBox!.addSubview(label);
        
        label.translatesAutoresizingMaskIntoConstraints = false;
        label.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 50).isActive = true;
        label.heightAnchor.constraint(equalToConstant: 60).isActive = true;
        label.leadingAnchor.constraint(equalTo: loginBox!.leadingAnchor, constant: 20).isActive = true;
        
        let subTitle = FSLabel(frame: loginBox!.bounds);
        subTitle.textColor = UIColor.lightGray;
        subTitle.font = UIFont(name: "MyriadPro-Regular", size: 16);
        subTitle.text = "Your account details are securely stored.";
        subTitle.numberOfLines = 0;
        
        loginBox!.addSubview(subTitle);
        
        subTitle.translatesAutoresizingMaskIntoConstraints = false;
        subTitle.topAnchor.constraint(equalTo: label.bottomAnchor).isActive = true;
        subTitle.leadingAnchor.constraint(equalTo: loginBox!.leadingAnchor, constant: 20).isActive = true;
        subTitle.trailingAnchor.constraint(equalTo: loginBox!.trailingAnchor, constant: -20).isActive = true;
        subTitle.centerXAnchor.constraint(equalTo: loginBox!.centerXAnchor).isActive = true;
        
        let usernameInput = FSInput(frame: loginBox!.bounds);
        usernameInput.placeholder = "Username"
        usernameInput.translatesAutoresizingMaskIntoConstraints = false;
        usernameInput.autocorrectionType = .no;
        usernameInput.autocapitalizationType = .none;
        
        loginBox!.addSubview(usernameInput);
        
        usernameInput.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant: 20).isActive = true;
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
        
        loginButton.topAnchor.constraint(greaterThanOrEqualTo: passwordInput.bottomAnchor, constant: 10).isActive = true;
        loginButton.leadingAnchor.constraint(equalTo: loginBox!.leadingAnchor, constant: 20).isActive = true;
        loginButton.trailingAnchor.constraint(equalTo: loginBox!.trailingAnchor, constant: -20).isActive = true;
        loginButton.heightAnchor.constraint(equalToConstant: 60).isActive = true;
        loginButton.centerXAnchor.constraint(equalTo: loginBox!.centerXAnchor).isActive = true;
        loginButton.bottomAnchor.constraint(equalTo: loginBox!.bottomAnchor, constant: -30).isActive = true;
        loginButton.addTarget(self, action: #selector(loginButtonTap), for: .touchUpInside);
    }
    
    @objc func closeLoginButtonTap()
    {
        self.dismiss(animated: true, completion: nil);
    }
    
    @objc func loginButtonTap()
    {
        /*
         On a successful login, create the navigation controller
         to become the main source of navigation. Since we want
         custom views, we make the navigation bar invisible.
        */
        let dashboardScreen = DashboardViewController();
        let navigationController = UINavigationController(rootViewController: dashboardScreen);
        
        navigationController.navigationBar.tintColor = UIColor.white;
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.isTranslucent = true
        navigationController.view.backgroundColor = .clear
        
        self.present(navigationController, animated: true);
    }
}
