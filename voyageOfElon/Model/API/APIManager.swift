//
//  APIManager.swift
//  voyageOfElon
//
//  Created by Jakub Bednář on 13.09.2021.
//

import Foundation
import Alamofire

class APIManager {
    
    //General
    static let shared = APIManager()
    var sessionManager: Session = {
            return AF
    }()
    
    /**
     Send task to query information url
     
     - Returns: loading handler if wait to task finish
     - Returns: error handler in error format
     - Returns: complemention recived data
     */
    typealias completionHandler = (Data?) -> ()
    typealias errorHandler = (Error) -> ()
    typealias activityHandler =  (_ loading: Bool) -> ()
    
    func getJsonRequest(
        withRequest request: baseAPITask,
        completionHandler: @escaping completionHandler,
        errorHandler: @escaping errorHandler,
        loadingHandler: @escaping activityHandler)
    {
        loadingHandler(true)
        
        //Check Reachability
        guard NetworkReachabilityManager()!.isReachable else {
            loadingHandler(false)
            errorHandler(APIErrors.connectionNotFind)
            return
        }
   
        //Make request
        sessionManager.request( request.URL,
                    method: request.METHOD,
                    parameters: request.PARAMETERS,
                    encoding: request.ENCODING,
                    headers: request.HEADERS
        ).responseData { response in
            
            loadingHandler(false)

            switch response.result {
            case .success:
                completionHandler(response.data)
            case let .failure(error):
                print(error)
                errorHandler(error)
            }
        }
    }
}

