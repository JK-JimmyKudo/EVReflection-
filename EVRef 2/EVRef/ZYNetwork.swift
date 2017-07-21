//
//  ZYNetwork.swift
//  EVR
//
//  Created by DFSJ on 2017/7/14.
//  Copyright © 2017年 dfsj. All rights reserved.
//

import UIKit
import Alamofire
import Foundation
import SystemConfiguration
import Alamofire
import EVReflection
import SwiftyJSON

//创建请求类枚举
enum RequestType: Int {
    case requestTypeGet
    case requestTypePost
    case requestTypeDelegate
}

//关于网络检测枚举
let ReachabilityStatusChangedNotification = "ReachabilityStatusChangedNotification"


enum ReachabilityType: CustomStringConvertible {
    case WWAN
    case WiFi
    
    var description: String {
        switch self {
        case .WWAN: return "WWAN"
        case .WiFi: return "WiFi"
        }
    }
}


enum ReachabilityStatus: CustomStringConvertible  {
    case Offline
    case Online(ReachabilityType)
    case Unknown
    
    var description: String {
        switch self {
        case .Offline: return "Offline"
        case .Online(let type): return "Online (\(type))"
        case .Unknown: return "Unknown"
        }
    }
}

//创建一个闭包(注:oc中block)
typealias sendVlesClosure = (AnyObject?, NSError?)->Void
typealias uploadClosure = (AnyObject?, NSError?,Int64?,Int64?,Int64?)->Void

class ZYNetwork: NSObject {

    static let shared = ZYNetwork.init()
    private override init() {}
}

extension ZYNetwork{

    //网络请求中的GET,Post,DELETE
    func PPrequest<T: NSObject>(type:RequestType ,URLString:String, Parameter:[String:AnyObject], block: @escaping (T?, NSError?) -> Void) where T: EVReflectable {
//        if (!self.checkConnect()) {
//            return
//        }
        switch type {
        case .requestTypeGet:
            
            Alamofire.request(URLString, method: .get, parameters: Parameter as [String : Any])
                .responseJSON { (response) in/*这里使用了闭包*/

//                    print( "response", response)


                    //获取结果
//                    switch response.result {
//                    case .success:
                        guard let data = response.data else {
                            
//                            print(response.result.error!)
                            
                            return
                        }
//                        print("解析",data)
                let rawString = String(data: data, encoding: .utf8)
                
                let tempJson = JSON(parseJSON: rawString!)
                    
                let object = T(json: tempJson.rawString()!)
                        
                block(object, nil)
                        
                    
//                        
//                let json :NSDictionary = try! JSONSerialization.jsonObject(with: data as Data, options: []) as! NSDictionary
////                        print("json解析",json)
//                guard  let array = json["data"] as? Array<Any> else {return }
//                        
//                        
//                        
//                        
//                        print("json解析",array)
//                        
//                        //将结果回调出去
////                        finishedCallback(data)
//                    case .failure(let nserror):
//                        print("error: \(nserror)")
//                    }
                    
                    
                    
//                    print("解析",array)
            }
            
            break
            
        case .requestTypePost:

            Alamofire.request(URLString, method: .post, parameters: Parameter)
            .responseJSON { (response) in/*这里使用了闭包*/

                print("response",response)

            }
            break
        case .requestTypeDelegate:
        
            Alamofire.request(URLString, method: .delete, parameters: Parameter)
                .responseJSON { (response) in/*这里使用了闭包*/
            }
            break
        }
    }
}

extension ZYNetwork{




}
