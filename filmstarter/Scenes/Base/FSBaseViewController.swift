//
//  FSBaseViewController.swift
//  filmstarter
//
//  Created by Dion Misic on 24/5/19.
//  Copyright © 2019 Dion Misic. All rights reserved.
//

import Foundation
import UIKit

/*
    A base view wrapper for the UIViewController
    to perform basic setup which is universal across all views.
    Since we want responsive views that turn into scrollviews
    when required, it makes sense to not duplicate code
    and have one class which always sets this up the right way
    since they are often difficult to implement programatically
    and responsively.
*/

class FSBaseViewController : FSProtectedViewController
{
    var contentView : UIView? = nil;
    var scrollView : UIScrollView? = nil;
    var logo = UIImageView(image: UIImage(named: "logo-white.png"));
    
    var includeLogo : Bool = false;
    var includeScrollView : Bool = false;
    
    var firstColor : UIColor? = nil;
    var secondColor : UIColor? = nil;
    
    var header : UIView? = nil;
    
    let activityIndicator = UIActivityIndicatorView(style: .whiteLarge);
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        
        setupMainView();
        
        if (includeScrollView)
        {
            setupScrollView();
        }
        
        if (includeLogo)
        {
            setupMainLogo();
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
        header = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height/4));
        
        scrollView!.addSubview(header!);
        
        header!.translatesAutoresizingMaskIntoConstraints = false;
        header!.topAnchor.constraint(equalTo: scrollView!.topAnchor).isActive = true;
        header!.leadingAnchor.constraint(equalTo: scrollView!.leadingAnchor).isActive = true;
        header!.trailingAnchor.constraint(equalTo: scrollView!.trailingAnchor).isActive = true;
        
        if (firstColor != nil && secondColor != nil)
        {
            let backgroundWrapper = UIView(frame: CGRect(x: 0,
                                                         y: 0,
                                                         width: header!.frame.width,
                                                         height: header!.frame.height));
            
            let backgroundGradient = [firstColor!, secondColor!].gradient
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
        
        logo.translatesAutoresizingMaskIntoConstraints = false;
        
        header!.addSubview(logo);
        
        logo.topAnchor.constraint(equalTo: scrollView!.safeAreaLayoutGuide.topAnchor).isActive = true;
        logo.leadingAnchor.constraint(equalTo: scrollView!.leadingAnchor, constant: 15).isActive = true;
        logo.heightAnchor.constraint(equalToConstant: 50).isActive = true;
        logo.widthAnchor.constraint(equalToConstant: 180).isActive = true;
        
        activityIndicator.hidesWhenStopped = true;
        
        scrollView!.addSubview(activityIndicator);
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false;
        activityIndicator.topAnchor.constraint(equalTo: logo.topAnchor).isActive = true;
        activityIndicator.trailingAnchor.constraint(equalTo: self.view!.safeAreaLayoutGuide.trailingAnchor, constant: -15).isActive = true;
    }
    
    func startLoadingAnimation(color : UIColor = UIColor.white)
    {
        activityIndicator.color = color;
        activityIndicator.startAnimating();
    }
    
    func stopLoadingAnimation()
    {
        activityIndicator.stopAnimating();
    }
    
    func setupScrollView()
    {
        scrollView = UIScrollView(frame: contentView!.bounds);
        scrollView!.translatesAutoresizingMaskIntoConstraints = false;
        
        contentView!.addSubview(scrollView!);
        
        scrollView!.topAnchor.constraint(equalTo: contentView!.topAnchor).isActive = true;
        scrollView!.widthAnchor.constraint(equalTo: contentView!.widthAnchor).isActive = true;
        scrollView!.bottomAnchor.constraint(equalTo: contentView!.bottomAnchor).isActive = true;
        scrollView!.leadingAnchor.constraint(equalTo: contentView!.leadingAnchor).isActive = true;
        scrollView!.trailingAnchor.constraint(equalTo: contentView!.trailingAnchor).isActive = true;
    }
}
