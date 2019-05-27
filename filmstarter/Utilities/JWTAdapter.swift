//
//  JWTAdapter.swift
//  filmstarter
//
//  Created by Dion Misic on 27/5/19.
//  Copyright © 2019 Dion Misic. All rights reserved.
//

import Foundation
import Alamofire

/*
    Using Alamofire's RequestAdapters to inject a Bearer Authentication
    header to every request with the payload as the login-token - only
    when the url is our server "filmstarter.dionmisic.com", so incase
    we request from another url we don't apply the same logic.
*/
class JWTAdapter: RequestAdapter {
    public static var accessToken: String = "";
    
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest
    {
        var urlRequest = urlRequest
        
        if let urlString = urlRequest.url?.absoluteString, urlString.hasPrefix("https://filmstarter.dionmisic.com")
        {
            urlRequest.setValue("Bearer " + JWTAdapter.accessToken, forHTTPHeaderField: "Authorization")
        }
        
        return urlRequest
    }
}
