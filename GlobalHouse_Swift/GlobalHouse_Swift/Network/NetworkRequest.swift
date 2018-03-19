//
//  NetworkRequest.swift
//  GlobalHouse_Swift
//
//  Created by 江奔 on 2018/3/14.
//  Copyright © 2018年 yueyi. All rights reserved.
//

import UIKit
import Alamofire

class NetworkRequest: NSObject {

    static let sharedInstance = NetworkRequest()
    private override init() {
    }
}

extension NetworkRequest {
    
    /// post
    ///
    /// - Parameters:
    ///   - urlString: url
    ///   - params: 请求参数
    ///   - success: 成功回调
    ///   - failture: 失败回调
    func postRequest(urlString: String,params: [String : Any]?,success: @escaping (_ response : [String : Any]) -> (),failure : @escaping (_ error :Error)->()) {
        Alamofire.request(urlString, method: .post, parameters: params, encoding: URLEncoding.httpBody, headers: nil).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                success(value as! [String : Any])

            case .failure(let error):
                failure(error)
            }
            
            
        }
    }
    
    /// get请求
    ///
    /// - Parameters:
    ///   - urlString: url
    ///   - params: 请求参数
    ///   - success: 成功回调
    ///   - failture: 失败回调
    func getRequest(urlString: String,params: [String : Any]?,success: @escaping (_ response : [String : Any]) -> (),failure : @escaping (_ error :Error)->()) {
        Alamofire.request(urlString, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                success(value as! [String : Any])
                
            case .failure(let error):
                failure(error)
            }
        }
    }
    
    
}
