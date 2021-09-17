//
//  APIKey.swift
//  voyageOfElon
//
//  Created by Jakub Bednář on 13.09.2021.
//

import Foundation


@objc class APIKeys : NSObject {

    private static let apiKeys: Dictionary<String,Dictionary<String,Any>> = [
        "SpaceXAPI" : [
            "ServerURL"    : "https://api.spacexdata.com/latest",
            "APITokenHeader" : "",
            "APITokenKey" : ""
            
        ]
    ]
    
    /**
     return server URL (https://something.com/api)
     
    */
    static func serverURLString(forAPI: String) throws -> String {
        guard let api = APIKeys.apiKeys[forAPI] else {
            print("☠️ Called API \(forAPI) is not defined")
            throw APIErrors.invalidAPIDeclaration
        }
        guard let serverURL = api["ServerURL"] as? String else {
            print("☠️ ServerURL of API call \(forAPI) is not defined")
            throw APIErrors.invalidAPIBaseURL
        }
        return serverURL
    }

}
