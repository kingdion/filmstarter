//
//  FSProjectBox.swift
//  filmstarter
//
//  Created by Dion Misic on 27/5/19.
//  Copyright © 2019 Dion Misic. All rights reserved.
//

import Foundation
import UIKit

class FSProjectBox : UIView
{
    var projectId : String;
    var projectName : String;
    var productionTeam : String;
    var projectDescription : String;
    var isActive : Bool;
    var projectBoxes : [FSProjectBox]?;
    
    init(projectId : String,
         projectName : String,
         productionTeam : String,
         description : String,
         isActive : Bool)
    {
        self.projectId = projectId
        self.projectName = projectName;
        self.productionTeam = productionTeam;
        self.projectDescription = description;
        self.isActive = isActive;
        
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100));
        
        self.layer.borderColor = UIColor.lightGray.cgColor;
        self.layer.borderWidth = 1.0;
        self.layer.cornerRadius = 20.0;
        
        if (!isActive)
        {
            self.backgroundColor = UIColor.lightGray;
        }
        
        setupBoxLabels();
        setupGesture();
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
                project.isActive = true;
                project.backgroundColor = UIColor.white;
            }
            else
            {
                project.isActive = false;
                project.backgroundColor = UIColor.lightGray;
            }
        }
    }
}
