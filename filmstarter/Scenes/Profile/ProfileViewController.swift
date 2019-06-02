//
//  ProfileViewController.swift
//  filmstarter
//
//  Created by Dion Misic on 26/5/19.
//  Copyright © 2019 Dion Misic. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON
import Alamofire

class ProfileViewController : FSBaseViewController
{
    var username = "";
    var fullName = "";
    let logoutButton = FSButton(frame: CGRect());
    var projects : JSON = JSON();
    var projectBoxes : [FSProjectBox] = [FSProjectBox]();
    
    override func viewDidLoad()
    {
        super.includeLogo = true;
        logo = UIImageView(image: UIImage(named: "logo.png"));
        super.includeScrollView = true;
        super.isProtectedView = true;
        super.viewDidLoad();
        
        self.startLoadingAnimation(color: UIColor.gray);
        self.view!.backgroundColor = UIColor.white;
        
        populateUserData();
    }
    
    func populateUserData()
    {
        /*
            Query the database for the logged-in users'
            information to display them in the application.
            Save the results to variables, stop the loading
            animation, and populate the view.
        */
        AuthenticationManager
            .sessionManager
            .request("https://filmstarter.dionmisic.com/get-user",
                     method: .get).responseJSON {
                        response in
                        
                        do
                        {
                            let json = try JSON(data: response.data!); 
                            
                            if (json["success"].bool! == true)
                            {
                                self.username = json["user"]["username"].string!;
                                self.fullName = json["user"]["first_name"].string! + " " + json["user"]["last_name"].string!;
                            }
                        }
                        catch
                        {
                            return
                        }
        }
        
        AuthenticationManager
            .sessionManager
            .request("https://filmstarter.dionmisic.com/projects/get",
                     method: .get).responseJSON {
                        response in
                        
                        do
                        {
                            let json = try JSON(data: response.data!);
                            
                            if (json["success"].bool! == true)
                            {
                                self.projects = json["projects"];
                                self.setupUserDetailsAndNavigation();
                                self.stopLoadingAnimation();
                            }
                        }
                        catch
                        {
                            return
                        }
        }
    }
    
    func setupUserDetailsAndNavigation()
    {
        let usernameLabel = FSLabel(frame: scrollView!.bounds);
        usernameLabel.font = UIFont(name: "MyriadPro-Bold", size: 44);
        usernameLabel.text = username;
        usernameLabel.kerning = -2;
        
        scrollView!.addSubview(usernameLabel);
        
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false;
        usernameLabel.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 10).isActive = true;
        usernameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true;
        usernameLabel.leadingAnchor.constraint(equalTo: scrollView!.leadingAnchor, constant: 15).isActive = true;
        
        let fullnameLabel = FSLabel(frame: scrollView!.bounds);
        fullnameLabel.font = UIFont(name: "MyriadPro-Bold", size: 28);
        fullnameLabel.text = fullName;
        fullnameLabel.textColor = UIColor.gray;
        fullnameLabel.kerning = -1.75;
        
        scrollView!.addSubview(fullnameLabel);
        
        fullnameLabel.translatesAutoresizingMaskIntoConstraints = false;
        fullnameLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor).isActive = true;
        fullnameLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true;
        fullnameLabel.leadingAnchor.constraint(equalTo: scrollView!.leadingAnchor, constant: 15).isActive = true;
        
        let horizontalLine = UIView(frame: scrollView!.bounds);
        horizontalLine.backgroundColor = UIColor.lightGray;
        
        scrollView!.addSubview(horizontalLine);
        
        horizontalLine.translatesAutoresizingMaskIntoConstraints = false;
        horizontalLine.topAnchor.constraint(equalTo: fullnameLabel.bottomAnchor).isActive = true;
        horizontalLine.heightAnchor.constraint(equalToConstant: 1.5).isActive = true;
        horizontalLine.widthAnchor.constraint(equalToConstant: self.view.frame.width / 1.5).isActive = true;
        horizontalLine.leadingAnchor.constraint(equalTo: scrollView!.leadingAnchor, constant: 15).isActive = true;
        
        let projectsLabel = FSLabel(frame: scrollView!.bounds);
        projectsLabel.font = UIFont(name: "MyriadPro-Bold", size: 28);
        projectsLabel.text = "Projects";
        projectsLabel.textColor = UIColor.black;
        projectsLabel.kerning = -1.75;
        
        scrollView!.addSubview(projectsLabel);
        
        projectsLabel.translatesAutoresizingMaskIntoConstraints = false;
        projectsLabel.topAnchor.constraint(equalTo: horizontalLine.bottomAnchor, constant: 30).isActive = true;
        projectsLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true;
        projectsLabel.leadingAnchor.constraint(equalTo: scrollView!.leadingAnchor, constant: 15).isActive = true;
        
        for project in projects
        {
            let projectId = project.1["id"].string!;
            let name = project.1["name"].string!;
            let team = project.1["production_team"].string!;
            let description = project.1["description"].string!;
            let active = project.1["is_active"].bool!;
            let role = project.1["role"].string!;
            
            let box = FSProjectBox(projectId: projectId,
                                   projectName: name,
                                   productionTeam: team,
                                   description: description,
                                   isActive: active);
            
            scrollView!.addSubview(box);
            box.translatesAutoresizingMaskIntoConstraints = false;
            
            if (projectBoxes.count == 0)
            {
                box.topAnchor.constraint(equalTo: projectsLabel.bottomAnchor, constant: 10).isActive = true;
            }
            else
            {
                box.topAnchor.constraint(equalTo: projectBoxes.last!.bottomAnchor, constant: 10).isActive = true;
            }
            
            box.heightAnchor.constraint(equalToConstant: 75).isActive = true;
            box.leadingAnchor.constraint(equalTo: scrollView!.leadingAnchor, constant: 15).isActive = true;
            box.trailingAnchor.constraint(equalTo: scrollView!.trailingAnchor, constant: -15).isActive = true;
            projectBoxes.append(box);
        }
        
        for project in projectBoxes
        {
            project.projectBoxes = projectBoxes;
        }
        
        logoutButton.setTitle("Log Out", for: UIControl.State.normal);
        logoutButton.translatesAutoresizingMaskIntoConstraints = false;
        logoutButton.titleColor = "#ffffff";
        logoutButton.firstColor = "#f1407e";
        logoutButton.secondColor = "#f2693c";
        
        scrollView!.addSubview(logoutButton);
        
        if (projectBoxes.count == 0)
        {
            logoutButton.topAnchor.constraint(greaterThanOrEqualTo: horizontalLine.bottomAnchor, constant: 10).isActive = true;
        }
        else
        {
            logoutButton.topAnchor.constraint(greaterThanOrEqualTo: projectBoxes.last!.bottomAnchor, constant: 10).isActive = true;
        }

        logoutButton.leadingAnchor.constraint(equalTo: scrollView!.leadingAnchor, constant: 15).isActive = true;
        logoutButton.trailingAnchor.constraint(equalTo: scrollView!.trailingAnchor, constant: -15).isActive = true;
        logoutButton.heightAnchor.constraint(equalToConstant: 60).isActive = true;
        logoutButton.centerXAnchor.constraint(equalTo: scrollView!.centerXAnchor).isActive = true;
        logoutButton.bottomAnchor.constraint(equalTo: scrollView!.bottomAnchor, constant: -30).isActive = true;
        logoutButton.addTarget(self, action: #selector(logoutButtonTap), for: .touchUpInside);
    }
    
    @objc func logoutButtonTap()
    {
        /*
            Remove the token from the client and redirect
            them to the homepage to login again.
        */
        JWTAdapter.accessToken = "";
        self.present(HomeViewController(), animated: true);
    }
}
