//: Playground - noun: a place where people can play

import Cocoa

/*//第一题
let currentDate = Date()
var formatter = DateFormatter()
formatter.dateFormat = "yyyy年M月dd日EEEE aa KK:mm"
 //将输入的英文改为中文输出
formatter.locale = Locale(identifier: "zh_CN")

formatter.timeZone = TimeZone(abbreviation: "UTC+8:00")
let beijing = formatter.string(from: currentDate)
print("beijingtime:"+beijing)

formatter.timeZone = TimeZone(abbreviation: "UTC+9:00")
let dongjing = formatter.string(from: currentDate)
print("dongjingtime:"+dongjing)

formatter.timeZone = TimeZone(abbreviation: "UTC-5:00")
let niuyue = formatter.string(from: currentDate)
print("niuyuetime:"+niuyue)
formatter.timeZone = TimeZone(abbreviation: "UTC+0:00")
let lundun = formatter.string(from: currentDate)
print("lunduntime:"+lundun)
 
 
//第二题
var str = "Swift is a powerful and intuitive programming language for iOS, OS X, tvOS, and watchOS."

let index1 = str.index(str.startIndex, offsetBy: 6)

let index2 = str.index(str.startIndex, offsetBy: 20)

let str1 = str[index1...index2]
print(str1)

let str2 = str.replacingOccurrences(of: "OS", with: "")

print(str2)


//第三题

var dic = [ "beijing": beijing, "dongjing": dongjing, "niuyue": niuyue, "lundun": lundun, "str1":str1,"str2":str2] as AnyObject//将字典转换为任意类型，方便后面写入文件

let fileManager = FileManager.default
var url = fileManager.urls(for: .documentDirectory, in:.userDomainMask).first!

url.appendPathComponent("testhdy.txt")

try? dic.write(to: url, atomically: true)
 */


/*//第四题
let imageURL = URL(string: "https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1538792963&di=f62ca20288d37d51105a752dfef40baa&src=http://upload.art.ifeng.com/2018/0124/1516765800873.jpg")

let date = try Data(contentsOf:imageURL!)

let fileManager = FileManager.default


var url = fileManager.urls(for: .documentDirectory, in:.userDomainMask).first!

url.appendPathComponent("do.jpg")

try date.write(to: url)*/

//第五题
enum MyError:Error{
    case Zero
    case NotURL
}
guard let weatherUrl = URL(string: "http://www.weather.com.cn/data/cityinfo/101010100.html")
    else{
        throw MyError.NotURL
    }
let jsondate = try! Data(contentsOf: weatherUrl)
let json = try! JSONSerialization.jsonObject(with: jsondate, options: .allowFragments)
print(json)
//把json文件转化为字典
guard let dictionary = json as?[String:Any] else{
    throw MyError.NotURL
}
guard let weather = dictionary["weatherinfo"] as? [String:String] else{
    throw MyError.NotURL
}
print(weather)

let temp1 = weather["city"]

print("city:"+temp1!)












