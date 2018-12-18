//: Playground - noun: a place where people can play

/*  //第一题
 let dictionary = [["name":"hedanyang","age":"21"],["name":"xionghuan","age":"20"],["name":"helinxiao","age":"20"]]

let name = dictionary.map { ($0["name"]!) }
print(name)
 */

/*//第二、三题
var arr = ["a","b","c","1","4","d"]
var arr1 = arr.filter{
    Int($0) != nil }
print(arr1)

var arr2 = arr.reduce("",{$0 + "," + $1})
arr2.remove(at:arr2.startIndex)
print(arr2)*/


/*//第四题
var str = [123,48,58,6,0,5,6]

let arr = str.reduce((max:str[0],min:str[0],sum:0), { (max: max($0.max, $1), min: min($0.min, $1), $0.sum + $1) })
print(arr)*/

/*//第五题

func f1(a: Int) -> Int {
    return a
}
//函数类型为(String) -> Int
func f2(a: String) -> Int {
    return Int(a)!
}
//函数类型为() -> Int
func f3() -> Int {
    return 2
}
//函数类型为(Int) -> Void
func f4(a: Int) {
    
}

//函数类型为(Int) -> Int
func f5(a: Int) -> Int {
    return a + 1
}

let funArr: [Any] = [f1, f2, f3, f4, f5]
for (index, value) in funArr.enumerated() {
    //因为循环过程中需要设计到数组的下标，要将数组元素一一列举出来，所以需要调用数组的enumerated()方法。
    if value is (Int) -> Int {
        print(index)  //输出类型为(Int) -> Int的函数在数组中的下标，
    }
}*/

//第六题
import func Darwin.sqrt
extension Int {
    func sqrt() -> Double {
        return Darwin.sqrt(Double(self))
    }
}
print(4.sqrt())


/*//第七题
func getMaxAndMin<T: Comparable>(a: [T]) -> (T, T) {
    var max = a[0]
    var min = a[0]
    
    for i in a {
        if i > max {
            max = i
        } else if i < min {
            min = i
        }
    }
    
    return (max, min)
}

print(getMaxAndMin(a:[1, 2, 3, 8]))
print(getMaxAndMin(a:[1.1,2.1,3.1,8.1]))
print(getMaxAndMin(a: ["a", "b", "A","veg"]))*/

enum Gender:Int{
    case male,female
    static func >(lhs: Gender, rhs: Gender) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}

enum Department:String{
    case teacher,student
}

protocol SchoolProtocol{
    var department:Department{
        get set
    }
    func lendBook()
}

class Person {
    var firstName:String
    var lastName:String
    var age:Int
    var gender:Gender
    var fullName:String{ return firstName + " " + lastName }
    init(firstName:String, lastName:String, age:Int, gender:Gender){
        self.firstName=firstName
        self.lastName=lastName
        self.age=age
        self.gender=gender
    }
    convenience init (name:String){
        self.init(firstName:name, lastName:"",age:43, gender: Gender.female)
    }
    
    var description: String {
        return "fullName: \(fullName), age: \(age), gender: \(gender)"
    }
    static func ==(p1:Person,p2:Person)->Bool{
        return p1.fullName==p2.fullName
    }
    static func != (p1:Person,p2:Person)->Bool{
        return p1.fullName != p2.fullName
    }
    func run(){
        print("Person \(self.fullName) is running")
    }
}

class Student:Person,SchoolProtocol{
    var stuNo:String
    var department:Department
    init(firstName:String, lastName:String, age:Int, gender:Gender,stuNo:String){
        self.stuNo=stuNo
        self.department=Department.student
        super.init(firstName:firstName, lastName:lastName, age:age, gender:gender)
    }
    convenience init (name:String,nom:String){
        self.init(firstName:name, lastName:"",age:20, gender: Gender.female,stuNo:nom)
    }
    override var description:String {
        return super.description + " stuNo:\(stuNo)"
    }
    override func run(){
        print("Student \(self.fullName) is running")
    }
    func lendBook(){
        print("Student \(self.fullName) lend books from library")
    }
}


class Teacher:Person,SchoolProtocol{
    var title:String
    var department:Department
    init(firstName:String, lastName:String, age:Int, gender:Gender,title:String){
        self.title=title
        self.department=Department.teacher
        super.init(firstName:firstName, lastName:lastName, age:age, gender:gender)
    }
    convenience init (name:String,nom:String){
        self.init(firstName:name, lastName:"",age:44, gender: Gender.male,title:nom)
    }
    override var description:String {
        return super.description + " title:\(title)"
    }
    override func run(){
        print("Teacher \(self.fullName) is running")
    }
    func lendBook(){
        print("Teacher \(self.fullName) lend books from library")
    }
}


var p1 = Person(firstName:"he", lastName:"danyang",age:21, gender: Gender.female)
var p2 = Person(name:"xuxiaolin")
var s1=Student(firstName:"he",lastName:"ruili",age:20,gender: Gender.male,stuNo:"2016110304")
var t1=Teacher(firstName:"li",lastName:"guiyang",age:44,gender: Gender.male,title:"IOS")
print(p1.description)
print(p2.description)
print(s1.description)
print(t1.description)

if p1 == p2 {
    print("same person")
}

if p1 != p2 {
    print("differ person")
}

var persons = [p1,p2,s1,t1]
var dictionary = ["pno": 0, "tno": 0, "sno": 0]
for p in persons {
    if p is Teacher {
        dictionary["tno"]! += 1
    }
    else if p is Student {
        dictionary["sno"]! += 1
    }
    else {
        dictionary["pno"]! += 1
    }
}

for (key, value) in dictionary {
    print("\(key) has \(value)")
}

print("原始数组")
for p in persons {
    print(p.description)
}

print("年龄从小到大")
persons.sort {  $0.age < $1.age}
for p in persons {
    print(p.description)
}

print("名字排序")
persons.sort {  $0.fullName < $1.fullName }
for p in persons {
    print(p.description)
}

print("排序")
persons.sort { return ($0.gender > $1.gender) && ($0.age > $1.age)  }
for p in persons {
    print(p.description)
}

for p in persons {
    if let t = p as? Teacher {
        t.run()
        t.lendBook()
    }
    else if let s = p as? Student {
        s.run()
        s.lendBook()
    }
    else {
        p.run()
    }
}






