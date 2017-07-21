//
//  ViewController.swift
//  EVRef
//
//  Created by DFSJ on 2017/7/17.
//  Copyright © 2017年 dfsj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    
        
        
        var dict1 = ["name":"张","age":"12","data":""]
        
        //        dict1["data"] = dict2
        
        print(dict1)
        
        var dictionary:[String:Any] = ["name":"张三","age":22]
        print(dictionary)
        
        //增加键值对
        dictionary["score"] = ["name":"小明","score":"88"]
        print(dictionary)
        
        
        //字典合并
        var dic1 = ["name":"小明","score":"88"]
        let dict2 = ["name":"李","age":"23"]
        
        print(dic1)
        
        let dic2 = ["teacher":"老大"]
        
        for (key,value) in dic2 {
            
            dic1[key] = value
        }
        print(dic1)
        
        
        
        let str = "http://imgpub.api.3dov.cn/recommend/getLunBo?dk=473F20F1D456724D29779428878B5BB0&v=3.0.0&tn=token&ty=i"
        
        let parameters = NSDictionary()
        
        //       let Astr = "http://app.api.3dov.cn/app/moreRecmdList";
        
        
        //        let dict = ["id":"110","channelId":"0","page":"0","size":"10"];
        
        //        parameters.setValue(dict, forKey: "data")
        
        ZYNetwork.shared.PPrequest(type: .requestTypeGet, URLString: str, Parameter: parameters as! [String : AnyObject]) { (obj:CityModel?, error) in
            
            guard let object = obj else {return}
            
            print("object",object.pageSize)
            
        }
        
//        ZYNetwork.shared.request(type: .requestTypeGet, URLString: str, Parameter: parameters as! [String : AnyObject]) { (response, Error) in
//            
//            
//            //        let dict = response["data"] as Dictionary
//            
//            
//            
//        }
   
        //
        //        ZYNetwork.shared.request(type: .requestTypePost, URLString: Astr, Parameter: dict as [String : AnyObject]) { (response, Error) in
        //            
        //        }
    
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

