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
    static func serverURLString(forAPI: String) -> String {
        guard let api = APIKeys.apiKeys[forAPI] else {
            fatalError("☠️ Called API \(forAPI) is not defined ERROR: \(APIErrors.invalidAPIDeclaration)")
        }
        guard let serverURL = api["ServerURL"] as? String else {
            fatalError("☠️ ServerURL of API call \(forAPI) is not defined ERROR: \(APIErrors.invalidAPIBaseURL)")
        }
        return serverURL
    }
}
