//
//  AuthenticationManager.swift
//  filmstarter
//
//  Created by Dion Misic on 27/5/19.
//  Copyright © 2019 Dion Misic. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

/*
    A utitlity class to inject the token
    into every request to the server. Store the
    token into UserDefaults and retrieve when required.
*/
class AuthenticationManager
{
    static let sessionManager = SessionManager();
    
    static func setup()
    {
        sessionManager.adapter = JWTAdapter();
        let token = UserDefaults.standard.string(forKey: UniversalStyles.UserDefaults.TokenKey);
        
        if (token != nil)
        {
            JWTAdapter.accessToken = token!;
        }
    }
    
    static func setToken(token : String)
    {
        UserDefaults.standard.set(token, forKey: UniversalStyles.UserDefaults.TokenKey);
        JWTAdapter.accessToken = token;
    }
}
