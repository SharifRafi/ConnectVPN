//
//  APIError.swift
//  WaltonWhilCloud
//
//  Created by Shahriar Mahmud on 11/17/21.
//

import Foundation


enum APIError: Int {
    case sessionExpired       = 401
    case notFound             = 404
    case timeOut              = 408
    case preconditioned       = 412
    case invalidParam         = 422
    case dependencyFail       = 424
    case serverProblem        = 500
    case unauthorized         = 440
    case customerDoesNotExist = 400
}
