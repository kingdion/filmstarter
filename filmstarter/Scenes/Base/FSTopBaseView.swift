//
//  FSTopBaseView.swift
//  filmstarter
//
//  Created by Dion Misic on 16/5/19.
//  Copyright © 2019 Dion Misic. All rights reserved.
//

import Foundation
import UIKit

/*

 A base view built ontop of the already
 established base views to setup the page
 headers for all of the inner-core parts
 of the application. Rather than duplicating
 the view logic x4, this makes it easier to
 set a gradient background for the top and add
 a header name.
 
*/
class FSTopBaseView : FSBaseViewController
{
    let mainView = UIView();
    var firstColor : UIColor? = nil;
    var secondColor : UIColor? = nil;
    var headerName : String? = nil;
    
    override func viewDidLoad()
    {
        super.includeScrollView = true;
        super.isProtectedView = true;
        super.includeLogo = false;
        super.viewDidLoad();
        self.view.backgroundColor = UIColor.white;
        
        setupHeaderAndInput();
    }
    
    func setupHeaderAndInput()
    {
        var backgroundGradient : CAGradientLayer;
        backgroundGradient = [firstColor!, secondColor!].gradient
            {
                gradient in
                gradient.startPoint = CGPoint(x: 0.3, y: 1);
                gradient.endPoint = CGPoint(x: 1, y: 0.3);
                return gradient;
        }
        
        backgroundGradient.frame = contentView!.bounds;
        contentView!.layer.insertSublayer(backgroundGradient, at: 0);
        
        logo.translatesAutoresizingMaskIntoConstraints = false;
        
        scrollView!.addSubview(logo);
        
        logo.topAnchor.constraint(equalTo: self.view!.safeAreaLayoutGuide.topAnchor).isActive = true;
        logo.leadingAnchor.constraint(equalTo: scrollView!.leadingAnchor, constant: 15).isActive = true;
        logo.heightAnchor.constraint(equalToConstant: 50).isActive = true;
        logo.widthAnchor.constraint(equalToConstant: 180).isActive = true;
        
        activityIndicator.hidesWhenStopped = true;
        
        scrollView!.addSubview(activityIndicator);
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false;
        activityIndicator.topAnchor.constraint(equalTo: logo.topAnchor).isActive = true;
        activityIndicator.trailingAnchor.constraint(equalTo: self.view!.safeAreaLayoutGuide.trailingAnchor, constant: -15).isActive = true;
        
        let headerLabel = FSLabel(frame: scrollView!.bounds);
        headerLabel.font = UIFont(name: "MyriadPro-Bold", size: 42);
        headerLabel.text = self.headerName!;
        headerLabel.kerning = -1.75;
        headerLabel.textColor = UIColor.white;
        
        self.view.addSubview(headerLabel);
        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false;
        headerLabel.topAnchor.constraint(equalTo: logo.bottomAnchor).isActive = true;
        headerLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true;
        headerLabel.leadingAnchor.constraint(equalTo: scrollView!.leadingAnchor, constant: 15).isActive = true;
        
        mainView.backgroundColor = UIColor.white;
        
        self.view.addSubview(mainView);
        
        mainView.translatesAutoresizingMaskIntoConstraints = false;
        mainView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 15).isActive = true;
        mainView.leadingAnchor.constraint(equalTo: scrollView!.leadingAnchor).isActive = true;
        mainView.trailingAnchor.constraint(equalTo: scrollView!.trailingAnchor).isActive = true;
        mainView.bottomAnchor.constraint(equalTo: scrollView!.bottomAnchor).isActive = true;
    }
}
