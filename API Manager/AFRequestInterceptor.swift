//
//  AFRequestInterceptor.swift
//  WaltonWhilCloud
//
//  Created by Shahriar Mahmud on 11/17/21.
//

import Foundation
import Alamofire
import SVProgressHUD

final class AFRequestInterceptor: Alamofire.RequestInterceptor {
    
    private var accessToken: String
    var isFirstAuthenticationFailed = true
    var presentedAlert: UIAlertController?
    
    // https://github.com/Alamofire/Alamofire/issues/2998
    typealias AdapterResult = Swift.Result<URLRequest, Error>
    
    init(token:String) {
        self.accessToken = token
    }
    
    func retry(_ request: Request, for session: Session, dueTo error: Error, json: String, completion: @escaping (RetryResult) -> Void) {
        guard let response = request.task?.response as? HTTPURLResponse, let errorCode = APIError(rawValue: response.statusCode) else {
            /// The request did not fail due to a 401 Unauthorized response.
            /// Return the original error and don't retry the request.
            isFirstAuthenticationFailed = true
            return completion(.doNotRetryWithError(error))
        }
        
        switch errorCode {
        case .unauthorized:
            DLog("******** Get Access Token ********")
            handleUnauthorizedUser()
            return completion(.doNotRetry)
            
        case .customerDoesNotExist:
            DLog("******** Get Access Token ********")
            return completion(.doNotRetry)
            
        case .timeOut:
            DLog("******** REQUEST TIME OUT ********")
            DLog("Retry Count = \(request.retryCount)")
            DLog("requested URL = \(String(describing: response.url))")
            if request.retryCount == 3 {
                return completion(.doNotRetry) }
            return completion(.retryWithDelay(1.0)) // retry after 1 second
        case .invalidParam:
            DLog("************ ============ ************")
            DLog("******* WRONG PARAMETER SEND TO API *******")
            completion(.doNotRetry)
        case .notFound:
            DLog("************ ============ ************")
            DLog("******* NOT FOUND IN SERVER *******")
            completion(.doNotRetry)
        case .dependencyFail:
            DLog("************ ============ ************")
            DLog("******* BACKEND FAILD FOR DEPENDENCY *******")
            completion(.doNotRetry)
        case .serverProblem:
            DLog("************ ============ ************")
            DLog("******* BACKEND INTERNAL SERVER PROBLEM *******")
            completion(.doNotRetry)
        case .preconditioned:
            DLog("************ ============ ************")
            DLog("******* PRE CONDITION FAILED *******")
            completion(.doNotRetry)
        case .sessionExpired:
            DLog("************ ============ ************")
            DLog("******* SESSION EXPIRED *******")
            
//            handleUnauthorizedUser()
            completion(.doNotRetry)
        }
    }
    
    private func handleUnauthorizedUser() {
//        DispatchQueue.main.async { [weak self] in
//            DLog("Go to login from auth handler")
//            let keyWindow = UIApplication.shared.windows.first { $0.isKeyWindow }
//            guard let kWindow = keyWindow else {return}
//            guard let topVC = kWindow.visibleViewController() else {return}
//            if topVC.isKind(of: WCPreLoginVC.self) {
//                DLog("Already In login Controller")
//                return
//            }
//            self?.goToLogin()
//        }
    }
}


/**
 use the bellow code, if refresh token mechanism needs to implement
 use the refreshToken method only
 if unauthorized request (401)
 */

/**
 // Get the access token, and retry the api call
 refreshToken { [weak self] result in
 guard let self = self else { return }
 
 switch result {
 case .success(let token):
 self.accessToken = token
 /// After updating the token we can safily retry the original request.
 completion(.retry)
 case .failure(let error):
 completion(.doNotRetryWithError(error))
 }
 }
 */

/**
 private func refreshToken(_ completion:@escaping CompletionHandler<Any>) {
 // Here call the api to get access token.
 // set isRefreshing = false in api completion block
 }
 */

