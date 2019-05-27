//
//  FSProtectedViewController.swift
//  filmstarter
//
//  Created by Dion Misic on 27/5/19.
//  Copyright © 2019 Dion Misic. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

/*

    A base controller built atop of UIViewController to query the server
    for the validity of the client's token. If it's valid, it'll let the user
    view the page. Otherwise, it'll redirect them back to the homepage.
 
    Making it a base class allows us to re-use this functionality with
    a simple boolean value.
 
*/
class FSProtectedViewController : UIViewController
{
    var isProtectedView : Bool = false;
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        
        if (isProtectedView)
        {
            AuthenticationManager
                .sessionManager
                .request("https://filmstarter.dionmisic.com/valid-token",
                         method: .get).responseJSON {
                            response in
                            
                            do
                            {
                                let json = try JSON(data: response.data!);
                                
                                if (json["success"].bool! == true)
                                {
                                    return;
                                }
                                else
                                {
                                    self.present(HomeViewController(), animated: true);
                                }
                            }
                            catch
                            {
                                self.present(HomeViewController(), animated: true);
                            }
            }
        }
    }
}
