//
//  Endpoint.swift
//  WaltonWhilCloud
//
//  Created by Shahriar Mahmud on 11/17/21.
//

import Foundation
import Alamofire

/**
 *  Protocol for all endpoints to conform to.
 */
protocol Endpoint {
    var method: HTTPMethod { get }
    var path: String { get }
    var query: [String: Any]? { get }
    var encoding: ParameterEncoding { get }
}

extension Endpoint {
    var encoding: ParameterEncoding { get{return JSONEncoding.default} set {} }
}
