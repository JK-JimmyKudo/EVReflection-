//
//  CityModel.swift
//  EVR
//
//  Created by DFSJ on 2017/7/14.
//  Copyright © 2017年 dfsj. All rights reserved.
//

import UIKit
import EVReflection
class CityModel: EVObject {

    var createdAt = ""
    var statusCode  = ""
    var data:[CityModel] = []
    var message  = 100010000
    var timestamp = ""
    var pageSize  = ""
    var page  = ""
    var kei : Kry = Kry()
}


class Kry: EVObject {
    
    var createdAt = ""
    var statusCode  = ""
    var data:[Kry] = []
    var timestamp = ""
    var pageSize  = ""
    var page  = ""

}
