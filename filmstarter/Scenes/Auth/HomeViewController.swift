//
//  HomeViewController.swift
//  filmstarter
//
//  Created by Dion Misic on 16/5/19.
//  Copyright © 2019 Dion Misic. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

/*
     The base view controller of the program - the first entry point.
     Sets up the login and register buttons & the gradient background.
     Inherits the functionality of the FSBaseViewController, which sets
     up the scrollview & content view for convenience and to
     prevent code duplication.
 */

class HomeViewController: FSBaseViewController {
    override func viewDidLoad()
    {
        setupBackground();

        super.includeScrollView = true;
        super.viewDidLoad();
        
        setupLogo();
        setupButtons();
        checkAndSendToDashIfLoggedIn()
    }
    
    func checkAndSendToDashIfLoggedIn()
    {
        AuthenticationManager
            .sessionManager
            .request("https://filmstarter.dionmisic.com/valid-token",
                     method: .get).responseJSON {
                        response in
                        
                        do
                        {
                            let json = try JSON(data: response.data!);
                            print(json)
                            
                            if (json["success"].bool! == true)
                            {
                                let tabController = ButtonTabBarViewController();
                                let navigationController = FSNavigationController(rootViewController: tabController);
                                
                                self.present(navigationController, animated: true);
                            }
                            else
                            {
                                return
                            }
                        }
                        catch
                        {
                            return
                        }
        }
    }
    
    func setupLogo()
    {
        logo.translatesAutoresizingMaskIntoConstraints = false;
        
        scrollView!.addSubview(logo);
        
        logo.centerXAnchor.constraint(equalTo: scrollView!.centerXAnchor).isActive = true;
        logo.centerYAnchor.constraint(equalTo: scrollView!.centerYAnchor, constant: -100).isActive = true;
        logo.heightAnchor.constraint(equalToConstant: 50).isActive = true;
        logo.widthAnchor.constraint(equalToConstant: 180).isActive = true;
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
