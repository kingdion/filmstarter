//
//  RegisterViewController.swift
//  filmstarter
//
//  Created by Dion Misic on 23/5/19.
//  Copyright © 2019 Dion Misic. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class RegisterViewController : FSBaseViewController, UITextFieldDelegate
{
    var registerBox : UIView? = nil;
    let registerButton = FSButton(frame: CGRect());
    let firstNameInput = FSInput(frame: CGRect());
    let lastNameInput = FSInput(frame: CGRect());
    let emailInput = FSInput(frame: CGRect());
    let usernameInput = FSInput(frame: CGRect());
    let passwordInput = FSInput(frame: CGRect());
    
    override func viewDidLoad()
    {
        super.includeScrollView = true;
        super.includeLogo = false;
        super.viewDidLoad();
        self.hideKeyboardWhenTappedAround();
        
        firstNameInput.delegate = self;
        lastNameInput.delegate = self;
        emailInput.delegate = self;
        usernameInput.delegate = self;
        passwordInput.delegate = self;

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

        firstNameInput.placeholder = "First Name"
        firstNameInput.translatesAutoresizingMaskIntoConstraints = false;
        
        registerBox!.addSubview(firstNameInput);
        
        firstNameInput.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant: 20).isActive = true;
        firstNameInput.leadingAnchor.constraint(equalTo: registerBox!.leadingAnchor, constant: 20).isActive = true;
        firstNameInput.trailingAnchor.constraint(equalTo: registerBox!.trailingAnchor, constant: -20).isActive = true;
        firstNameInput.heightAnchor.constraint(equalToConstant: 60).isActive = true;
        firstNameInput.centerXAnchor.constraint(equalTo: registerBox!.centerXAnchor).isActive = true;
        
        lastNameInput.placeholder = "Last Name"
        lastNameInput.translatesAutoresizingMaskIntoConstraints = false;
        
        registerBox!.addSubview(lastNameInput);
        
        lastNameInput.topAnchor.constraint(equalTo: firstNameInput.bottomAnchor, constant: 10).isActive = true;
        lastNameInput.leadingAnchor.constraint(equalTo: registerBox!.leadingAnchor, constant: 20).isActive = true;
        lastNameInput.trailingAnchor.constraint(equalTo: registerBox!.trailingAnchor, constant: -20).isActive = true;
        lastNameInput.heightAnchor.constraint(equalToConstant: 60).isActive = true;
        lastNameInput.centerXAnchor.constraint(equalTo: registerBox!.centerXAnchor).isActive = true;

        emailInput.placeholder = "Email"
        emailInput.translatesAutoresizingMaskIntoConstraints = false;
        emailInput.keyboardType = .emailAddress;
        
        registerBox!.addSubview(emailInput);
        
        emailInput.topAnchor.constraint(equalTo: lastNameInput.bottomAnchor, constant: 10).isActive = true;
        emailInput.leadingAnchor.constraint(equalTo: registerBox!.leadingAnchor, constant: 20).isActive = true;
        emailInput.trailingAnchor.constraint(equalTo: registerBox!.trailingAnchor, constant: -20).isActive = true;
        emailInput.heightAnchor.constraint(equalToConstant: 60).isActive = true;
        emailInput.centerXAnchor.constraint(equalTo: registerBox!.centerXAnchor).isActive = true;

        usernameInput.placeholder = "Username"
        usernameInput.translatesAutoresizingMaskIntoConstraints = false;
        
        registerBox!.addSubview(usernameInput);
        
        usernameInput.topAnchor.constraint(equalTo: emailInput.bottomAnchor, constant: 10).isActive = true;
        usernameInput.leadingAnchor.constraint(equalTo: registerBox!.leadingAnchor, constant: 20).isActive = true;
        usernameInput.trailingAnchor.constraint(equalTo: registerBox!.trailingAnchor, constant: -20).isActive = true;
        usernameInput.heightAnchor.constraint(equalToConstant: 60).isActive = true;
        usernameInput.centerXAnchor.constraint(equalTo: registerBox!.centerXAnchor).isActive = true;
        
        passwordInput.placeholder = "Password"
        passwordInput.translatesAutoresizingMaskIntoConstraints = false;
        passwordInput.isSecureTextEntry = true;
        
        registerBox!.addSubview(passwordInput);
        
        passwordInput.topAnchor.constraint(equalTo: usernameInput.bottomAnchor, constant: 10).isActive = true;
        passwordInput.leadingAnchor.constraint(equalTo: registerBox!.leadingAnchor, constant: 20).isActive = true;
        passwordInput.trailingAnchor.constraint(equalTo: registerBox!.trailingAnchor, constant: -20).isActive = true;
        passwordInput.heightAnchor.constraint(equalToConstant: 60).isActive = true;
        passwordInput.centerXAnchor.constraint(equalTo: registerBox!.centerXAnchor).isActive = true;
        
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
    
    @objc func closeRegisterButtonTap()
    {
        self.dismiss(animated: true, completion: nil);
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        /*
             When the text input validates that it should return,
             move focus to the next element.
        */
        switch textField
        {
            case firstNameInput:
                lastNameInput.becomeFirstResponder();
            case lastNameInput:
                emailInput.becomeFirstResponder();
            case emailInput:
                usernameInput.becomeFirstResponder();
            case usernameInput:
                passwordInput.becomeFirstResponder();
            default:
                textField.resignFirstResponder();
        }
        
        return true
    }
    
    @objc func registerButtonTap()
    {
        /*
             Check that we have non-empty input data, start an
             activity indicator as a loading mechanism and make
             a request to our server with our register credentials.
         
             Decode the data using SwiftyJSON and show all errors
             as a top-level UIAlert (either register credential errors
             from the server or any others)
         
             On success, create & present the core application
             controller to the authenticated user.
        */
        registerButton.isEnabled = false;
        
        let firstName = firstNameInput.text!;
        let lastName = lastNameInput.text!;
        let username = usernameInput.text!;
        let password = passwordInput.text!;
        let email = emailInput.text!;
        
        if (username == "" || password == "" || email == "" || firstName == "" || lastName == "")
        {
            AlertHelper.showError(on: self, message: "No fields can be blank!");
        }
        
        let activityIndicator = UIActivityIndicatorView(style: .whiteLarge);
        activityIndicator.color = UIColor.gray;
        activityIndicator.hidesWhenStopped = true;
        
        registerBox!.addSubview(activityIndicator);
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false;
        activityIndicator.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 10).isActive = true;
        activityIndicator.leadingAnchor.constraint(equalTo: registerBox!.leadingAnchor, constant: 20).isActive = true;
        activityIndicator.trailingAnchor.constraint(equalTo: registerBox!.trailingAnchor, constant: -20).isActive = true;
        activityIndicator.centerXAnchor.constraint(equalTo: registerBox!.centerXAnchor).isActive = true;
        
        activityIndicator.startAnimating();
        
        let parameters = ["first-name": firstName,
                          "last-name": lastName,
                          "username": username,
                          "password": password,
                          "email": email]
        Alamofire.request("https://filmstarter.dionmisic.com/do-register",
                          method: .post, parameters: parameters).responseJSON {
                            response in
                            
                            activityIndicator.stopAnimating();
                            self.registerButton.isEnabled = true;
                            
                            do
                            {
                                let json = try JSON(data: response.data!);
                                
                                if (json["success"].bool! == true)
                                {
                                    let dashboardScreen = ButtonTabBarViewController();
                                    let navigationController = FSNavigationController(rootViewController: dashboardScreen);
                                    
                                    self.present(navigationController, animated: true);
                                }
                                else
                                {
                                    AlertHelper.showError(on: self, message: json["message"].string!);
                                }
                            }
                            catch
                            {
                                AlertHelper.showError(on: self, message: error.localizedDescription);
                            }
        }
    }
}
