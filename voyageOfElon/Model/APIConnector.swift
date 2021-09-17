//
//  APIController.swift
//  voyageOfElon
//
//  Created by Jakub Bednář on 13.09.2021.
//

import Foundation
import Alamofire


class baseAPITask {
    var URL: String = ""
    var METHOD: HTTPMethod = .get
    
    var PARAMETERS: [String : Any] = [:]
    var HEADERS: HTTPHeaders = [:]
    var ENCODING: ParameterEncoding = URLEncoding.default

    var API: String = "SpaceXAPI"
    init() throws {}
}

class getAllLaunches: baseAPITask {
    
    override init() throws {
        do {
            try super.init()

            let server = try APIKeys.serverURLString(forAPI: API)
            URL = server + "/launches/past"
        } catch{
            throw error
        }
    }
}


