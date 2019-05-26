//
//  FSBaseViewController.swift
//  filmstarter
//
//  Created by Dion Misic on 24/5/19.
//  Copyright © 2019 Dion Misic. All rights reserved.
//

import Foundation
import UIKit

class FSBaseViewController : UIViewController
{
    var contentView : UIView? = nil;
    var scrollView : UIScrollView? = nil;
    var logo = UIImageView(image: UIImage(named: "logo-white.png"));
    
    var includeLogo : Bool = false;
    var includeScrollView : Bool = false;
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        
        setupMainView();
        
        if (includeLogo)
        {
            setupMainLogo();
        }
        
        if (includeScrollView)
        {
            setupScrollView();
        }
    }
    
    func setupMainView()
    {
        contentView = UIView(frame: self.view.bounds);
        contentView!.translatesAutoresizingMaskIntoConstraints = false;
        
        self.view.addSubview(contentView!);
        
        contentView!.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true;
        contentView!.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true;
        contentView!.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true;
        contentView!.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true;
    }
    
    func setupMainLogo()
    {
        logo.translatesAutoresizingMaskIntoConstraints = false;
        
        contentView!.addSubview(logo);
        
        logo.centerXAnchor.constraint(equalTo: contentView!.centerXAnchor).isActive = true;
        logo.centerYAnchor.constraint(equalTo: contentView!.centerYAnchor, constant: -100).isActive = true;
        logo.heightAnchor.constraint(equalToConstant: 50).isActive = true;
        logo.widthAnchor.constraint(equalToConstant: 180).isActive = true;
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
