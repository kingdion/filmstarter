//
//  TeamViewController.swift
//  filmstarter
//
//  Created by Dion Misic on 16/5/19.
//  Copyright © 2019 Dion Misic. All rights reserved.
//

import Foundation
import UIKit

class TeamViewController : FSBaseViewController {
    override func viewDidLoad()
    {
        self.firstColor = UIColor(hex: "#f2693c");
        self.secondColor = UIColor(hex: "#f1407e");
        
        super.includeScrollView = true;
        super.isProtectedView = true;
        super.includeLogo = true;
        super.viewDidLoad();
        self.view.backgroundColor = UIColor.white;
        
        setupHeaderAndInput();
    }
    
    func setupHeaderAndInput()
    {
        let headerLabel = FSLabel(frame: scrollView!.bounds);
        headerLabel.font = UIFont(name: "MyriadPro-Bold", size: 42);
        headerLabel.text = "Team";
        headerLabel.kerning = -1.75;
        headerLabel.textColor = UIColor.white;
        
        self.view.addSubview(headerLabel);
        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false;
        headerLabel.topAnchor.constraint(equalTo: logo.bottomAnchor).isActive = true;
        headerLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true;
        headerLabel.leadingAnchor.constraint(equalTo: scrollView!.leadingAnchor, constant: 20).isActive = true;

        let usernameInput = FSInput();
        usernameInput.placeholder = "Username"
        usernameInput.translatesAutoresizingMaskIntoConstraints = false;
        
        self.view.addSubview(usernameInput);
        
        usernameInput.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20).isActive = true;
        usernameInput.leadingAnchor.constraint(equalTo: scrollView!.leadingAnchor, constant: 20).isActive = true;
        usernameInput.trailingAnchor.constraint(equalTo: scrollView!.trailingAnchor, constant: -20).isActive = true;
        usernameInput.heightAnchor.constraint(equalToConstant: 60).isActive = true;
        usernameInput.centerXAnchor.constraint(equalTo: scrollView!.centerXAnchor).isActive = true;
    }
}
