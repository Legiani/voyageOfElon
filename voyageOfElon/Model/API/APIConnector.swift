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
}

class getAllLaunches: baseAPITask {
    
    public override init() {
        super.init()

        let server = APIKeys.serverURLString(forAPI: API)
        URL = server + "/launches/past"
        
    }
}

class getLaunch: baseAPITask {
    
    public init(id: String) {
        super.init()

        let server = APIKeys.serverURLString(forAPI: API)
        URL = server + "/launches/\(id)"

    }
}

class getCrew: baseAPITask {
    
    public init(id: String) {
        super.init()

        let server = APIKeys.serverURLString(forAPI: API)
        URL = server + "/crew/\(id)"

    }
}

class getRocket: baseAPITask {
    
    public init(id: String) {
        super.init()

        let server = APIKeys.serverURLString(forAPI: API)
        URL = server + "/rockets/\(id)"

    }
}


