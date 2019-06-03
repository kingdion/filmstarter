//
//  TeamViewController.swift
//  filmstarter
//
//  Created by Dion Misic on 3/6/19.
//  Copyright © 2019 Dion Misic. All rights reserved.
//

import Foundation
import SwiftyJSON
import UIKit

class TeamViewController : FSTopBaseView
{
    let usernameInput = FSInput(frame: CGRect());
    var users : JSON = JSON();
    
    override func viewDidLoad()
    {
        self.firstColor = UIColor(hex: "#f1407e");
        self.secondColor = UIColor(hex: "#f2693c");
        self.headerName = "Team";
        
        super.viewDidLoad();
        
        populateUserData();
    }
    
    func populateUserData()
    {
        AuthenticationManager
            .sessionManager
            .request("https://filmstarter.dionmisic.com/projects/team/users",
                     method: .get).responseJSON {
                        response in
                        
                        do
                        {
                            let json = try JSON(data: response.data!);
                            
                            if (json["success"].bool! == true)
                            {
                                self.users = json["users"];
                                self.setupInput();
                                self.stopLoadingAnimation();
                            }
                        }
                        catch
                        {
                            return
                        }
        }
    }
    
    func setupInput()
    {
        let subTitle = FSLabel(frame: scrollView!.bounds);
        subTitle.font = UIFont(name: "MyriadPro-Bold", size: 20);
        subTitle.text = "ADD A USER";
        subTitle.numberOfLines = 0;
        
        mainView.addSubview(subTitle);
        
        subTitle.translatesAutoresizingMaskIntoConstraints = false;
        subTitle.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20).isActive = true;
        subTitle.leadingAnchor.constraint(equalTo: scrollView!.leadingAnchor, constant: 20).isActive = true;
        subTitle.trailingAnchor.constraint(equalTo: scrollView!.trailingAnchor, constant: -20).isActive = true;
        subTitle.centerXAnchor.constraint(equalTo: scrollView!.centerXAnchor).isActive = true;
        
        usernameInput.placeholder = "Username"
        usernameInput.translatesAutoresizingMaskIntoConstraints = false;
        
        mainView.addSubview(usernameInput);
        
        usernameInput.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant: 10).isActive = true;
        usernameInput.leadingAnchor.constraint(equalTo: scrollView!.leadingAnchor, constant: 20).isActive = true;
        usernameInput.trailingAnchor.constraint(equalTo: scrollView!.trailingAnchor, constant: -20).isActive = true;
        usernameInput.heightAnchor.constraint(equalToConstant: 60).isActive = true;
        usernameInput.centerXAnchor.constraint(equalTo: scrollView!.centerXAnchor).isActive = true;
        
        let addButton = FSButton();
        addButton.setTitle("Add to Project", for: UIControl.State.normal);
        addButton.translatesAutoresizingMaskIntoConstraints = false;
        addButton.titleColor = "#ffffff";
        addButton.firstColor = "#f1407e";
        addButton.secondColor = "#f2693c";
        
        mainView.addSubview(addButton);
        
        addButton.topAnchor.constraint(equalTo: usernameInput.bottomAnchor, constant: 10).isActive = true;
        addButton.leadingAnchor.constraint(equalTo: scrollView!.leadingAnchor, constant: 20).isActive = true;
        addButton.trailingAnchor.constraint(equalTo: scrollView!.trailingAnchor, constant: -20).isActive = true;
        addButton.heightAnchor.constraint(equalToConstant: 60).isActive = true;
        addButton.centerXAnchor.constraint(equalTo: scrollView!.centerXAnchor).isActive = true;
        addButton.addTarget(self, action: #selector(addButtonTap), for: .touchUpInside);
    }
    
    @objc func addButtonTap()
    {
        self.startLoadingAnimation();
        AuthenticationManager
            .sessionManager
            .request("https://filmstarter.dionmisic.com/projects/add",
                    method: .post, parameters: ["project_id": "test", "user_id": "test"]).responseJSON {
                    response in
                    
                    do
                    {
                        let json = try JSON(data: response.data!);
                        
                        if (json["success"].bool! == true)
                        {
                            self.stopLoadingAnimation();
                        }
                    }
                    catch
                    {
                        return
                    }
        }
    }
    
    
}
