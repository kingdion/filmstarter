//
//  HomeViewController.swift
//  filmstarter
//
//  Created by Dion Misic on 16/5/19.
//  Copyright © 2019 Dion Misic. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: FSBaseViewController {
    override func viewDidLoad()
    {
        setupBackground();
        
        super.includeLogo = true;
        super.includeScrollView = false;
        super.viewDidLoad();
        
        setupButtons();
    }
    
    func setupButtons()
    {
        let loginButton = FSButton(frame: contentView!.bounds);
        loginButton.setTitle("Login", for: UIControl.State.normal);
        loginButton.translatesAutoresizingMaskIntoConstraints = false;
        loginButton.titleColor = "#f2693c";
        loginButton.firstColor = "#ffffff";
        loginButton.secondColor = "#dcdcdc";
        
        contentView!.addSubview(loginButton);
        
        loginButton.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 10).isActive = true;
        loginButton.leadingAnchor.constraint(equalTo: contentView!.leadingAnchor, constant: 20).isActive = true;
        loginButton.trailingAnchor.constraint(equalTo: contentView!.trailingAnchor, constant: -20).isActive = true;
        loginButton.heightAnchor.constraint(equalToConstant: 60).isActive = true;
        loginButton.centerXAnchor.constraint(equalTo: contentView!.centerXAnchor).isActive = true;
        loginButton.addTarget(self, action: #selector(loginButtonTapInside), for: .touchUpInside);
        
        let registerButton = FSButton(frame: contentView!.bounds);
        registerButton.setTitle("Register", for: UIControl.State.normal);
        registerButton.translatesAutoresizingMaskIntoConstraints = false;
        registerButton.titleColor = "#f2693c";
        registerButton.firstColor = "#ffffff";
        registerButton.secondColor = "#dcdcdc";
        
        contentView!.addSubview(registerButton);
        
        registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10).isActive = true;
        registerButton.leadingAnchor.constraint(equalTo: contentView!.leadingAnchor, constant: 20).isActive = true;
        registerButton.trailingAnchor.constraint(equalTo: contentView!.trailingAnchor, constant: -20).isActive = true;
        registerButton.heightAnchor.constraint(equalToConstant: 60).isActive = true;
        registerButton.centerXAnchor.constraint(equalTo: contentView!.centerXAnchor).isActive = true;
        registerButton.addTarget(self, action: #selector(registerButtonTapInside), for: .touchUpInside);
    }
    
    @objc func loginButtonTapInside()
    {
        let loginScreen = LoginViewController();
        self.present(loginScreen, animated: true);
    }
    
    @objc func registerButtonTapInside()
    {
        let registerScreen = RegisterViewController();
        self.present(registerScreen, animated: true);
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
