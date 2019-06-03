//
//  FSProjectBox.swift
//  filmstarter
//
//  Created by Dion Misic on 27/5/19.
//  Copyright © 2019 Dion Misic. All rights reserved.
//

import Foundation
import SwiftyJSON
import UIKit

class FSProjectBox : UIView
{
    var projectId : String;
    var projectName : String;
    var productionTeam : String;
    var projectDescription : String;
    var role : String;
    var isActive : Bool;
    var projectBoxes : [FSProjectBox]?;
    var backgroundGradient : CAGradientLayer;
    
    init(projectId : String,
         projectName : String,
         productionTeam : String,
         description : String,
         role : String,
         isActive : Bool)
    {
        self.projectId = projectId
        self.projectName = projectName;
        self.productionTeam = productionTeam;
        self.projectDescription = description;
        self.role = role;
        self.isActive = isActive;
        self.backgroundGradient = [UIColor(hex: "#f1407e"), UIColor(hex: "#f2693c")].gradient
        {
            gradient in
                gradient.startPoint = CGPoint(x: 0.3, y: 1);
                gradient.endPoint = CGPoint(x: 1, y: 0.3);
                return gradient;
        }
        
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100));
        
        self.layer.borderColor = UIColor.lightGray.cgColor;
        self.layer.borderWidth = 0.3;
        self.layer.cornerRadius = 20.0;
        
        setupBoxLabels();
        setupGesture();
        setupGradient();
        
        if (isActive)
        {
            setActive(self);
        }
        else
        {
            unsetActive(self);
        }
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupBoxLabels()
    {
        let nameLabel = FSLabel(frame: self.bounds);
        nameLabel.font = UIFont(name: "MyriadPro-Bold", size: 20);
        nameLabel.text = self.projectName;
        nameLabel.kerning = -0.5;
        
        self.addSubview(nameLabel);
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false;
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true;
        nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true;
        nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true;
        
        let teamLabel = FSLabel(frame: self.bounds);
        teamLabel.font = UIFont(name: "MyriadPro-Regular", size: 15);
        teamLabel.text = self.productionTeam;
        teamLabel.kerning = -0.45;
        
        self.addSubview(teamLabel);
        
        teamLabel.translatesAutoresizingMaskIntoConstraints = false;
        teamLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true;
        teamLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true;
        teamLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true;
        
        let roleLabel = FSLabel(frame: self.bounds);
        roleLabel.font = UIFont(name: "MyriadPro-Bold", size: 15);
        roleLabel.text = self.role;
        roleLabel.kerning = -0.45;
        
        self.addSubview(roleLabel);
        
        roleLabel.translatesAutoresizingMaskIntoConstraints = false;
        roleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true;
        roleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true;
        roleLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true;
    }
    
    func setupGesture()
    {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.toggleActive));
        self.addGestureRecognizer(gesture);
    }
    
    @objc func toggleActive(sender : UITapGestureRecognizer)
    {
        for project in projectBoxes!
        {
            if (project.projectId == self.projectId)
            {
                setActive(project);
            }
            else
            {
                unsetActive(project);
            }
        }
    }
    
    func setActive(_ project : FSProjectBox)
    {
        project.isActive = true;
        project.backgroundGradient.opacity = 1.0;
        setAllTextColours(project: project, color: UIColor.white);
        project.layer.borderColor = UIColor.clear.cgColor;
        
        let parameters = ["project_id": project.projectId];
        AuthenticationManager
            .sessionManager
            .request("https://filmstarter.dionmisic.com/projects/select", method: .post, parameters: parameters);
    }
    
    func unsetActive(_ project : FSProjectBox)
    {
        project.isActive = false;
        project.backgroundGradient.opacity = 0.0;
        project.tintColor = UIColor.black;
        setAllTextColours(project: project, color: UIColor.black);
        project.layer.borderColor = UIColor.lightGray.cgColor;
    }
    
    func setAllTextColours(project : FSProjectBox, color : UIColor)
    {
        for sub in project.subviews
        {
            if (sub.isKind(of: UILabel.self))
            {
                (sub as! UILabel).textColor = color;
            }
        }
    }
    
    func setupGradient()
    {
        backgroundGradient.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 30, height: 75);
        backgroundGradient.cornerRadius = 20.0;
        backgroundGradient.opacity = 0.0;
        self.layer.insertSublayer(backgroundGradient, at: 0);
        self.layer.cornerRadius = 20.0;
    }
}
