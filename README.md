# EVReflection-
EVReflection转模型
Alamofire + EVReflection + SwiftyJSON:一步解决JSON解析
\n
创建项目,第三方库导入
pod 'EVReflection' \n
pod 'Alamofire'

首先使用Alamofire封装网络请求类,现在只是封装了一个get网络请求，后续再更新
创建一个网络请求封装类ZYNetwork,导入头文件
import Alamofire
import Foundation
import SystemConfiguration
import Alamofire
import EVReflection
import SwiftyJSON

func PPrequest<T: NSObject>(type:RequestType ,URLString:String, Parameter:[String:AnyObject], block: @escaping (T?, NSError?) -> Void) where T: EVReflectable {

switch type {
case .requestTypeGet:

Alamofire.request(URLString, method: .get, parameters: Parameter as [String : Any])
.responseJSON { (response) in/*这里使用了闭包*/

//获取结果,获取结果,对结果进行解析,将response.data转换为String类型,在使用SwiftyJSON将结果转换为JSON,最后将JSON数据进行转换成EVObject类型,T是泛型,遵循EVReflectable 协议.最后将结果通过Block返回到主界面

guard let data = response.data else {return}

let rawString = String(data: data, encoding: .utf8)

let tempJson = JSON(parseJSON: rawString!)

let object = T(json: tempJson.rawString()!)

block(object, nil)

}
break;
}



接下来我们来写我们的Model需要注意的是，我们定义的数据类一定要继承EVObject
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


最后我们在ViewController 的viewDidLoad方法中测试一下数据和返回结果

ZYNetwork.shared.PPrequest(type: .requestTypeGet, URLString: str, Parameter: parameters as! [String : AnyObject]) { (obj:CityModel?, error) in

guard let object = obj else {return}

print("object",object)

}
//这是网络请求请求回来的数据

data =     (
{
message = "\U6210\U529f";
page = 1;
pageSize = 7;
statusCode = 0;
timestamp = 1500624869;
})

//这是转换后返回的结果,直接转成模型直接取值，不需要在取值转模型
object CityModel = {
"pageSize" : "7",
"statusCode" : "0",
}

//这个提示不是错误提示，而是提醒，提醒你的model中没有这个属性,在模型中增加这个属性这个提示就消失
WARNING: The class 'CityModel' is not key value coding-compliant for the key 'icons'
There is no support for optional type, array of optionals or enum properties.
As a workaround you can implement the function 'setValue forUndefinedKey' for this. See the unit tests for more information


希望可以帮助使用swift开发的小伙伴,不用那么麻烦的进行数据取值在转模型,提高工作效率




