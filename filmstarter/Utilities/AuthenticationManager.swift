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

class AuthenticationManager
{
    static let sessionManager = SessionManager();
    
    static func setup()
    {
        sessionManager.adapter = JWTAdapter();
        JWTAdapter.accessToken = UserDefaults.standard.string(forKey: UniversalStyles.UserDefaults.TokenKey)!;
    }
    
    static func setToken(token : String)
    {
        UserDefaults.standard.set(token, forKey: UniversalStyles.UserDefaults.TokenKey);
        JWTAdapter.accessToken = token;
    }
}
