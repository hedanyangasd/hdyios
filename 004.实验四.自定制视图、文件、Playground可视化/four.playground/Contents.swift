//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport


//第一题
let fileManager = FileManager.default
let docPath = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first?.path

var file = docPath?.appending("/hdy")
if fileManager.fileExists(atPath: file!) {
    let image = file?.appending("/dog.jpg")
    if fileManager.fileExists(atPath: image!){
        print("存在")
    }
    else{
        let url = URL(string:"https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1540607271&di=74fa5d5e74c9ce6df2438312d370e18f&src=http://img.zcool.cn/community/0159b0554bcb99000001bf722ea16f.jpg")
        let data = try Data(contentsOf: url!)
        try data.write(to:URL(fileURLWithPath: image!),options: .atomicWrite)
    }
}
else{
    try fileManager.createDirectory(atPath: file!, withIntermediateDirectories: true, attributes: nil)
    print("文件不存在，创建文件")
}


//第二、三题
class MyView:UIView{
    override func  draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        UIColor.red.setStroke()//红色边框
        path.stroke()
        UIColor.blue.setFill()//填充
        path.fill()
    }
}

class Controller:UIViewController{
    var label:UILabel!
    var circle:MyView!
    override func loadView() {
        view = UIView(frame:CGRect(x:0,y:0,width:400,height:1000))
        view.backgroundColor=UIColor.red
        //创建圆
        let circle = MyView(frame:CGRect(x:100,y:300,width:200,height:100))
        circle.backgroundColor = UIColor.clear
        view.addSubview(circle)
        
        
        label = UILabel(frame: CGRect(x:100,y:20,width:200,height:50))
        label.backgroundColor=UIColor.yellow
        label.textColor=UIColor.black
        label.textAlignment = .center
        label.text = "hello world"
        view.addSubview(label)
        
        
        let botton = UIButton(frame: CGRect(x:100,y:550,width:200,height:50))
        botton.backgroundColor = UIColor.blue
        botton.setTitle("Click Me", for: .normal)
        
        botton.addTarget(self, action: #selector(Controller.clicked), for: .touchUpInside)
        view.addSubview(botton)
        
    }
    @IBAction func clicked(){
        print("hello hdy")
        label?.text = "hello hdy"
        UIView.animate(withDuration: 1){
            self.circle.center = CGPoint(x:200,y:0)
        }
        
    }
}


let coo = Controller()
PlaygroundPage.current.liveView = coo


