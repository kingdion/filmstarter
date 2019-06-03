//
//  BottomTabBarViewController.swift
//  filmstarter
//
//  Created by Dion Misic on 26/5/19.
//  Copyright © 2019 Dion Misic. All rights reserved.
//

import Foundation
import UIKit

/*
    Essentially the core "control" of the applicaiton.
    Sets up a basic button tab view to navigate the application
    and set the views and links them to individual tabs.

    These tabs essentially serve as the form of navigation
    for the user profile, so the user can pick a project
    and then use the dashboard view to interact with it.
*/

class ButtonTabBarViewController : UITabBarController, UITabBarControllerDelegate
{
    let dashboard = DashboardViewController();
    let profile = ProfileViewController();
    let settings = SettingsViewController();
    
    override func viewDidLoad()
    {
        self.delegate = self;
        self.tabBar.barTintColor = UIColor(hex: "#2d2d2d");
        self.tabBar.tintColor = UIColor.white;
        
        dashboard.tabBarItem = UITabBarItem(title: "Dashboard", image: UIImage(named: "home.png"), tag: 0);
        profile.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "profile.png"), tag: 1);
        settings.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(named: "settings.png"), tag: 2);
        
        viewControllers = [profile, dashboard,  settings];
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController)
    {
        if (viewController.title! == "Dashboard")
        {
            (viewController as! DashboardViewController).reload();
        }
    }
}
