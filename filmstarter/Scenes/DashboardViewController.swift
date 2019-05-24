//
//  DashboardController.swift
//  filmstarter
//
//  Created by Dion Misic on 16/5/19.
//  Copyright © 2019 Dion Misic. All rights reserved.
//

import Foundation
import UIKit

class DashboardViewController: UIViewController {
    
    let logo = UIImageView(image: UIImage(named: "logo.png"));
    var contentView : UIView? = nil;
    var scrollView : UIScrollView? = nil;
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        self.view!.backgroundColor = UIColor.white;
        
        setupMainView();
        setupScrollView();
        setupMainLogo();
        
        let loginButton = FSButton(frame: scrollView!.bounds);
        loginButton.setTitle("Login", for: UIControl.State.normal);
        loginButton.translatesAutoresizingMaskIntoConstraints = false;
        loginButton.titleColor = "#ffffff";
        loginButton.firstColor = "#f1407e";
        loginButton.secondColor = "#f2693c";
        
        scrollView!.addSubview(loginButton);
        
        loginButton.leadingAnchor.constraint(equalTo: scrollView!.leadingAnchor, constant: 20).isActive = true;
        loginButton.trailingAnchor.constraint(equalTo: scrollView!.trailingAnchor, constant: -20).isActive = true;
        loginButton.heightAnchor.constraint(equalToConstant: 60).isActive = true;
        loginButton.centerXAnchor.constraint(equalTo: scrollView!.centerXAnchor).isActive = true;
        loginButton.topAnchor.constraint(equalTo: scrollView!.topAnchor, constant: 30).isActive = true;
        loginButton.addTarget(self, action: #selector(meme), for: .touchUpInside);
    }
    
    @objc func meme()
    {
        let teamViewScene = TeamViewController();
        
        let transition:CATransition = CATransition()
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        self.navigationController!.view.layer.add(transition, forKey: kCATransition)
        
        self.navigationController?.pushViewController(teamViewScene, animated: true);
        
    }
    
    func setupMainLogo()
    {
        logo.translatesAutoresizingMaskIntoConstraints = false;
        
        contentView!.addSubview(logo);
        
        logo.topAnchor.constraint(equalTo: contentView!.bottomAnchor, constant: 10);
        logo.leadingAnchor.constraint(equalTo: contentView!.leadingAnchor, constant: 15);
        logo.heightAnchor.constraint(equalToConstant: 50).isActive = true;
        logo.widthAnchor.constraint(equalToConstant: 180).isActive = true;
    }
    
    func setupMainView()
    {
        contentView = UIView(frame: self.view.bounds);
        contentView!.translatesAutoresizingMaskIntoConstraints = false;
        
        self.view.addSubview(contentView!);
        
        contentView!.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15).isActive = true;
        contentView!.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true;
        contentView!.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true;
        contentView!.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true;
    }
    
    func setupScrollView()
    {
        scrollView = UIScrollView(frame: contentView!.bounds);
        scrollView!.translatesAutoresizingMaskIntoConstraints = false;
        scrollView!.backgroundColor = UIColor.white;
        
        contentView!.addSubview(scrollView!);
        
        scrollView!.topAnchor.constraint(equalTo: contentView!.topAnchor).isActive = true;
        scrollView!.widthAnchor.constraint(equalTo: contentView!.widthAnchor).isActive = true;
        scrollView!.bottomAnchor.constraint(equalTo: contentView!.bottomAnchor).isActive = true;
        scrollView!.leadingAnchor.constraint(equalTo: contentView!.leadingAnchor).isActive = true;
        scrollView!.trailingAnchor.constraint(equalTo: contentView!.trailingAnchor).isActive = true;
    }
}
