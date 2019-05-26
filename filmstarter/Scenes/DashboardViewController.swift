//
//  DashboardController.swift
//  filmstarter
//
//  Created by Dion Misic on 16/5/19.
//  Copyright © 2019 Dion Misic. All rights reserved.
//

import Foundation
import UIKit

/*
    The core navigation of the film "projects". This is the main
    functionality control of the app - allowing the user to
    interact with functionalities on the project. Since the tab bar
    is primarily at the user level, this dashboard is the entry to
    the content side of things.

    Setsup the basic menu boxes, their gradients, icons and presents
    them in the display. The buttons themself simply direct the
    application flow to the next controller.
*/


class DashboardViewController: FSBaseViewController {
    
    override func viewDidLoad()
    {
        super.includeLogo = false;
        super.includeScrollView = true;
        super.viewDidLoad();
        
        self.view!.backgroundColor = UIColor.white;
        
        setupUserDetailsAndNavigation();
    }
    
    func setupUserDetailsAndNavigation()
    {
        logo = UIImageView(image: UIImage(named: "logo.png"));
        logo.translatesAutoresizingMaskIntoConstraints = false;
        
        scrollView!.addSubview(logo);
        
        logo.topAnchor.constraint(equalTo: scrollView!.topAnchor, constant: 15).isActive = true;
        logo.leadingAnchor.constraint(equalTo: scrollView!.leadingAnchor, constant: 15).isActive = true;
        logo.heightAnchor.constraint(equalToConstant: 50).isActive = true;
        logo.widthAnchor.constraint(equalToConstant: 180).isActive = true;
        
        let projectNameLabel = FSLabel(frame: scrollView!.bounds);
        projectNameLabel.font = UIFont(name: "MyriadPro-Bold", size: 44);
        projectNameLabel.text = "Harry Potter";
        projectNameLabel.kerning = -2;
        
        scrollView!.addSubview(projectNameLabel);
        
        projectNameLabel.translatesAutoresizingMaskIntoConstraints = false;
        projectNameLabel.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 10).isActive = true;
        projectNameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true;
        projectNameLabel.leadingAnchor.constraint(equalTo: scrollView!.leadingAnchor, constant: 15).isActive = true;
        
        let productionTeamLabel = FSLabel(frame: scrollView!.bounds);
        productionTeamLabel.font = UIFont(name: "MyriadPro-Bold", size: 28);
        productionTeamLabel.text = "Warner Brothers";
        productionTeamLabel.textColor = UIColor.gray;
        productionTeamLabel.kerning = -1.75;
        
        scrollView!.addSubview(productionTeamLabel);
        
        productionTeamLabel.translatesAutoresizingMaskIntoConstraints = false;
        productionTeamLabel.topAnchor.constraint(equalTo: projectNameLabel.bottomAnchor).isActive = true;
        productionTeamLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true;
        productionTeamLabel.leadingAnchor.constraint(equalTo: scrollView!.leadingAnchor, constant: 15).isActive = true;
        
        let horizontalLine = UIView(frame: scrollView!.bounds);
        horizontalLine.backgroundColor = UIColor.lightGray;
        
        scrollView!.addSubview(horizontalLine);
        
        horizontalLine.translatesAutoresizingMaskIntoConstraints = false;
        horizontalLine.topAnchor.constraint(equalTo: productionTeamLabel.bottomAnchor).isActive = true;
        horizontalLine.heightAnchor.constraint(equalToConstant: 1.5).isActive = true;
        horizontalLine.widthAnchor.constraint(equalToConstant: self.view.frame.width / 1.5).isActive = true;
        horizontalLine.leadingAnchor.constraint(equalTo: scrollView!.leadingAnchor, constant: 15).isActive = true;

        /*
         Since we are insetting all of the views to be 15pixels from
         each of the edges, we calculate our safe width to account for that.
         
         We also create an image inset that's 1/6th of the screen size to push the
         icons into the middle of the button and have ample padding around
         the side of the icon.
        */
        let safeWidth = (self.scrollView!.frame.width - 30)
        let squareLength = safeWidth / 2;
        let imageInset = squareLength / 4;
        let imageEdgeInset = UIEdgeInsets(top: imageInset, left: imageInset, bottom: imageInset, right: imageInset);
        
        let homeButton = FSButton(frame: CGRect(x: 0, y: 0, width: squareLength, height: squareLength));
        let teamButton = FSButton(frame: CGRect(x: 0, y: 0, width: squareLength, height: squareLength));
        let resourcesButton = FSButton(frame: CGRect(x: 0, y: 0, width: squareLength, height: squareLength));
        let newsButton = FSButton(frame: CGRect(x: 0, y: 0, width: squareLength, height: squareLength));
        let settingsButton = FSButton(frame: CGRect(x: 0, y: 0, width: squareLength * 2, height: squareLength / 1.5));
        
        homeButton.translatesAutoresizingMaskIntoConstraints = false;
        homeButton.cornerMask = [.layerMinXMinYCorner]
        homeButton.titleColor = "#ffffff";
        homeButton.firstColor = "#f1407e";
        homeButton.secondColor = "#f2693c";
        
        teamButton.translatesAutoresizingMaskIntoConstraints = false;
        teamButton.cornerMask = [.layerMaxXMinYCorner]
        teamButton.titleColor = "#ffffff";
        teamButton.firstColor = "#01e3ff";
        teamButton.secondColor = "#0390fd";
        
        resourcesButton.translatesAutoresizingMaskIntoConstraints = false;
        resourcesButton.cornerMask = []
        resourcesButton.titleColor = "#ffffff";
        resourcesButton.firstColor = "#d75efc";
        resourcesButton.secondColor = "#9e2ffe";
        
        newsButton.translatesAutoresizingMaskIntoConstraints = false;
        newsButton.cornerMask = []
        newsButton.titleColor = "#ffffff";
        newsButton.firstColor = "#fddb0a";
        newsButton.secondColor = "#f89404";
        
        settingsButton.translatesAutoresizingMaskIntoConstraints = false;
        settingsButton.cornerMask = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        settingsButton.titleColor = "#ffffff";
        settingsButton.firstColor = "#696969";
        settingsButton.secondColor = "#2d2d2d";
        
        scrollView!.addSubview(homeButton);
        
        homeButton.setImage(UIImage(named: "users.png"), for: .normal)
        homeButton.imageView?.contentMode = .scaleToFill;
        homeButton.imageEdgeInsets = imageEdgeInset;
        
        homeButton.topAnchor.constraint(equalTo: horizontalLine.bottomAnchor, constant: 15).isActive = true;
        homeButton.leadingAnchor.constraint(equalTo: scrollView!.leadingAnchor, constant: 15).isActive = true;
        homeButton.heightAnchor.constraint(equalToConstant: squareLength).isActive = true;
        homeButton.widthAnchor.constraint(equalToConstant: squareLength).isActive = true;
        
        scrollView!.addSubview(teamButton);
        
        teamButton.setImage(UIImage(named: "calendar.png"), for: .normal)
        teamButton.imageView?.contentMode = .scaleToFill;
        teamButton.imageEdgeInsets = imageEdgeInset;
        
        teamButton.topAnchor.constraint(equalTo: horizontalLine.bottomAnchor, constant: 15).isActive = true;
        teamButton.leadingAnchor.constraint(equalTo: homeButton.trailingAnchor).isActive = true;
        teamButton.trailingAnchor.constraint(equalTo: scrollView!.trailingAnchor, constant: -15).isActive = true;
        teamButton.heightAnchor.constraint(equalToConstant: squareLength).isActive = true;
        teamButton.widthAnchor.constraint(equalToConstant: squareLength).isActive = true;
        
        scrollView!.addSubview(resourcesButton);
        
        resourcesButton.setImage(UIImage(named: "paperclip.png"), for: .normal)
        resourcesButton.imageView?.contentMode = .scaleToFill;
        resourcesButton.imageEdgeInsets = imageEdgeInset;
        
        resourcesButton.topAnchor.constraint(equalTo: homeButton.bottomAnchor).isActive = true;
        resourcesButton.leadingAnchor.constraint(equalTo: scrollView!.leadingAnchor, constant: 15).isActive = true;
        resourcesButton.heightAnchor.constraint(equalToConstant: squareLength).isActive = true;
        resourcesButton.widthAnchor.constraint(equalToConstant: squareLength).isActive = true;
        
        scrollView!.addSubview(newsButton);
        
        newsButton.setImage(UIImage(named: "newspaper.png"), for: .normal)
        newsButton.imageView?.contentMode = .scaleToFill;
        newsButton.imageEdgeInsets = imageEdgeInset;
        
        newsButton.topAnchor.constraint(equalTo: homeButton.bottomAnchor).isActive = true;
        newsButton.trailingAnchor.constraint(equalTo: scrollView!.trailingAnchor, constant: -15).isActive = true;
        newsButton.heightAnchor.constraint(equalToConstant: squareLength).isActive = true;
        newsButton.widthAnchor.constraint(equalToConstant: squareLength).isActive = true;
        
        scrollView!.addSubview(settingsButton);
        
        settingsButton.setImage(UIImage(named: "cogs.png"), for: .normal)
        settingsButton.imageView?.contentMode = .scaleToFill;
        settingsButton.imageEdgeInsets = UIEdgeInsets(top: imageInset,
                                                      left: imageInset * 5,
                                                      bottom: imageInset,
                                                      right: imageInset * 5);
        
        settingsButton.topAnchor.constraint(equalTo: resourcesButton.bottomAnchor).isActive = true;
        settingsButton.trailingAnchor.constraint(equalTo: scrollView!.trailingAnchor, constant: -15).isActive = true;
        settingsButton.heightAnchor.constraint(equalToConstant: squareLength).isActive = true;
        settingsButton.widthAnchor.constraint(equalToConstant: safeWidth).isActive = true;
        
        let scrollViewAnchor = UIView(frame: scrollView!.bounds);

        scrollView!.addSubview(scrollViewAnchor);

        scrollViewAnchor.translatesAutoresizingMaskIntoConstraints = false;
        scrollViewAnchor.topAnchor.constraint(equalTo: settingsButton.bottomAnchor).isActive = true;
        scrollViewAnchor.bottomAnchor.constraint(equalTo: scrollView!.bottomAnchor).isActive = true;
        scrollViewAnchor.heightAnchor.constraint(equalToConstant: 50).isActive = true;
        scrollViewAnchor.leadingAnchor.constraint(equalTo: scrollView!.leadingAnchor, constant: 15).isActive = true;
    }
}
