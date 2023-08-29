//
//  APIEndpoints.swift
//  WaltonWhilCloud
//
//  Created by Shahriar Mahmud on 11/17/21.
//

import Foundation
import Alamofire
import SwiftyJSON


//MARK: Login
enum LoginEndPoint: Endpoint {
    
    case login(mobile: String, password: String, uuid: String)
    case signup(mobile: String, password: String, confirmPassword: String, otp: Int, name: String, uuid: String)
    case checkUser(mobile: String)
    case logout
    case accDeactivate
    case resetPassword(mobile: String, password: String, confirmPassword: String, otp: Int)
    case resetRequest(mobile: String)
    case reportIssue(mobile: String, details: String)
    case setFcmToken(token: String)
    case checkPassword(password: String)
    
    var method: HTTPMethod {
        switch self {
        case .login, .signup, .checkUser, .logout, .resetRequest, .resetPassword, .reportIssue, .setFcmToken, .accDeactivate, .checkPassword:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .login:
            return KBasePath + OauthPath.login.rawValue + Helper.getQueryParams()
        case .signup:
            return KBasePath + OauthPath.signup.rawValue + Helper.getQueryParams()
        case .checkUser:
            return KBasePath + OauthPath.userCheck.rawValue + Helper.getQueryParams()
        case .logout:
            return KBasePath + OauthPath.logout.rawValue + Helper.getQueryParams()
        case .resetRequest:
            return KBasePath + OauthPath.setPassResetRequest.rawValue + Helper.getQueryParams()
        case .resetPassword:
            return KBasePath + OauthPath.resetPassword.rawValue + Helper.getQueryParams()
        case .reportIssue:
            return KBasePath + OauthPath.reportIssue.rawValue + Helper.getQueryParams()
        case .setFcmToken:
            return KBasePath + OauthPath.setFcmToken.rawValue + Helper.getQueryParams()
        case .accDeactivate:
            return KBasePath + OauthPath.accDeactivate.rawValue + Helper.getQueryParams()
        case .checkPassword:
            return KBasePath + OauthPath.checkPassword.rawValue + Helper.getQueryParams()
        }
    }
    
    var query: [String: Any]? {
        switch self {
        case .login(let mobile, let password, let uuid):
            return ["mobile": mobile, "password": password, "uuid": uuid]
        case .signup(let mobile, let password, let confirmPassword, let otp, let name, let uuid):
            return ["mobile": mobile, "otp": otp, "password": password, "confirm_password": confirmPassword, "name": name, "uuid": uuid]
        case .checkUser(let mobile):
            return ["mobile": mobile]
        case .logout, .accDeactivate:
            return nil
        case .resetRequest(let mobile):
            return ["mobile": mobile]
        case .resetPassword(let mobile, let password, let confirmPassword, let otp):
            return ["mobile": mobile, "otp": otp, "new_password": password, "confirm_password": confirmPassword]
        case .reportIssue(let mobile, let details):
            return ["mobile": mobile, "description": details]
        case .setFcmToken(let token):
            return ["token": token]
        case .checkPassword(let password):
            return ["password": password]
        }
    }
}
