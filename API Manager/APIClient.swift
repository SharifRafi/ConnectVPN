//
//  APIClient.swift
//  WaltonWhilCloud
//
//  Created by Shahriar Mahmud on 11/17/21.
//

/**
 Cheet sheet
 https://codewithchris.com/alamofire/
 */

import Foundation
import Alamofire
import SwiftyJSON


public enum Result<T> {
    case success(T)
    case failure(ErrorResponse)
}

typealias CompletionHandler<T> = (Result<T>) -> ()
public typealias ErrorResponse = (Int, Data?, Error)


class APIClient {
    //static let shared = APIClient()
    private static var privateShared : APIClient?
    
    class var shared: APIClient {
        guard let uwShared = privateShared else {
            privateShared = APIClient()
            return privateShared!
        }
        return uwShared
    }
    
    class func destroy() {
        privateShared = nil
    }
    
    private init() {}
    
    deinit {
        DLog("deinit singleton")
    }
    
    func wcHeaders() -> HTTPHeaders {
        let token = Helper.getStringData(key: Constants.wcToken)
        let header: HTTPHeaders = ["Content-Type" : "application/json","Authorization" : "Bearer " + token, "X-RequestHash" : Helper.getSignSaltForHeader()]
        return header
    }
    
    private let sessionManager: Session = {
        let configuration = URLSessionConfiguration.af.default
        /*
         This configuration is the same as URLSessionConfiguration.default,
         but also includes Alamofire's default headers.
         */
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 120
        
        // Authorization header added in AFRequestInterceptor class
        let afInterceptor = AFRequestInterceptor(token: "")
        
        #if DEBUG
        return Session(configuration: configuration, interceptor: afInterceptor, eventMonitors: [AFRequestMonitor()])
        #else
        return Session(configuration: configuration, interceptor: afInterceptor)
        #endif
        
        
    }()
}

extension APIClient {
    /// Returns a specific Object or Error
    func objectAPICall<T: Decodable>(apiEndPoint: Endpoint, modelType: T.Type,
                                     completion: @escaping CompletionHandler<T>) {
        sessionManager.request(apiEndPoint.path, method: apiEndPoint.method, parameters: apiEndPoint.query, encoding: apiEndPoint.encoding, headers: wcHeaders())
            .validate(statusCode: 200..<300)
            .responseDecodable { (response: AFDataResponse<T>) in
                switch response.result {
                case .success(let value):
                    completion(Result.success(value))
                case .failure(let error):
                    DLog(error.localizedDescription)
                    guard let statusCode = response.response?.statusCode else {
                        let unKnownError = ErrorResponse(-999, response.data, error)
                        let error = error.localizedDescription
                        if error.contains("The Internet connection appears to be offline"){
                            DispatchQueue.main.async {
//                                Helper.showCustomAlert(title: "No Internet Connection", msg: "Please check your internet connectivity", alertType: .somethingWroong)
                                Helper.showAlertWithTitle(title: "No Internet Connection", description: "Please check your internet connectivity")
                            }
                        }else{
                            DispatchQueue.main.async {
                                Helper.showAlertWithTitle(title: "", description: "Something went wrong. Please try again later.")
                            }
//                            Helper.showCustomAlert(title: "Something went wrong", msg: "Something went wrong. Please try again later.", alertType: .somethingWroong)
                        }
                        completion(Result.failure(unKnownError))
                        return
                    }
                    let mError = ErrorResponse(statusCode, response.data, error)
                    
                    let json = JSON(response.data ?? Data())
                    var msg = json["error"]["message"].stringValue
                    let code = json["result_code"].intValue
                    if msg.isEmpty{
                        msg = response.error?.localizedDescription ?? "Something went wrong"
                    }
                    if code == 11{
                        Helper.showCustomAlertWithOkAction(title: "Session Expired", msg: "Please Login Again", alertType: .fail) {
                            let fcmToken = Helper.getStringData(key: Constants.wcFCMToken)
                            let defaults = UserDefaults.standard
                            defaults.dictionaryRepresentation().keys.forEach { defaults.removeObject(forKey: $0) }
                            Helper.saveData(data: fcmToken, key: Constants.wcFCMToken)
                            RootVCHelper.setToDashboardVC()
                        }
                    }else{
                        Helper.showCustomAlert(title: "Error", msg: msg, alertType: .fail)
                    }
                    
                    completion(Result.failure(mError))
                }
            }
    }
    
    /// Returns array of specific Object or Error
    func arrayObjectAPICall<T: Decodable>(apiEndPoint: Endpoint, modelType: T.Type, completion: @escaping CompletionHandler<[T]>) {
        sessionManager.request(apiEndPoint.path, method: apiEndPoint.method, parameters: apiEndPoint.query, encoding: apiEndPoint.encoding)
            //.debugLog()
            .validate(statusCode: 200..<300)
            .responseDecodable { (response: AFDataResponse<[T]>) in
                switch response.result {
                case .success(let value):
                    completion(Result.success(value))
                case .failure(let error):
                    DLog(error.localizedDescription)
                    guard let statusCode = response.response?.statusCode else {
                        let unKnownError = ErrorResponse(-999, response.data, error)
                        completion(Result.failure(unKnownError))
                        return
                    }
                    let mError = ErrorResponse(statusCode, response.data, error)
                    let json = JSON(response.data ?? Data())
                    let msg = json["error"]["message"].stringValue
                    if statusCode != 401{
                        Helper.showCustomAlert(title: "Error", msg: msg, alertType: .fail)
                    }
                    completion(Result.failure(mError))
                }
            }
    }
    
    /// Returns JSON or Error
    func makeAPICall(apiEndPoint: Endpoint, completion: @escaping CompletionHandler<Any>) {
        sessionManager.request(apiEndPoint.path, method: apiEndPoint.method, parameters: apiEndPoint.query, encoding: apiEndPoint.encoding, headers: wcHeaders())
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    completion(Result.success(value))
                case .failure(let error):
                    DLog(error.localizedDescription)
                    guard let statusCode = response.response?.statusCode else {
                        let unKnownError = ErrorResponse(-999, response.data, error)
                        let error = error.localizedDescription
                        if error.contains("The Internet connection appears to be offline"){
                            DispatchQueue.main.async {
                                Helper.showAlertWithTitle(title: "No Internet Connection", description: "Please check your internet connectivity")
                            }
                        }else{
                            DispatchQueue.main.async {
                                Helper.showAlertWithTitle(title: "", description: "Something went wrong. Please try again later.")
                            }
                        }
                        completion(Result.failure(unKnownError))
                        return
                    }
                    let mError = ErrorResponse(statusCode, response.data, error)
                    let json = JSON(response.data ?? Data())
                    var msg = json["error"]["message"].stringValue
                    let code = json["result_code"].intValue
                    if msg.isEmpty{
                        msg = response.error?.localizedDescription ?? "Something Went Wrong"
                    }
                    if code == 11{
                        Helper.showCustomAlertWithOkAction(title: "Session Expired", msg: "Please Login Again", alertType: .fail) {
                            let fcmToken = Helper.getStringData(key: Constants.wcFCMToken)
                            let defaults = UserDefaults.standard
                            defaults.dictionaryRepresentation().keys.forEach { defaults.removeObject(forKey: $0) }
                            Helper.saveData(data: fcmToken, key: Constants.wcFCMToken)
                            RootVCHelper.setToDashboardVC()
                        }
                    }else{
                        Helper.showCustomAlert(title: "Error", msg: msg, alertType: .fail)
                    }
                    completion(Result.failure(mError))
                }
            }.responseString { jsonString in
                DLog(jsonString)
            }
    }
    
}

extension APIClient {
    func download(url: URL, optionalFileName name: String, progress: @escaping ((Double) -> Void), completion: @escaping ((Bool,URL?) -> Void)) {
        
        let destination: DownloadRequest.Destination = { (temporaryURL, response) in
            let directoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let fileName = response.suggestedFilename ?? name
            let file = directoryURL.appendingPathComponent(fileName, isDirectory: false)
            //DLog("Given file Path = \(file)")
            return (file, [.createIntermediateDirectories, .removePreviousFile])
        }
        
        //if session manager don't work user AF instead.
        //And use headers after .get, headers: additionalHeaders
        sessionManager.download(url, method: .get, to: destination)
            .downloadProgress { (dwnldProgress) in
                progress(dwnldProgress.fractionCompleted)
            }.response { (dwnldResponse) in
                if let givnUrl = dwnldResponse.fileURL {
                    //DLog("Given URL = \(givnUrl)")
                    completion(true, givnUrl)
                } else {
                    completion(false, nil)
                }
            }
    }
    
//    func
}
