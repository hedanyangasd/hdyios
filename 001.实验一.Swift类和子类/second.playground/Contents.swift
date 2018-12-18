//: Playground - noun: a place where people can play

/*var primes = [Int]()
for i in 2...10000{
    var isprime = true
    for j in 2..<i {
        if i%j==0 {
            isprime = false
        }
    }
    if isprime {
        primes.append(i)
    }
}

func compare (x:Int,y:Int)->Bool {
    return x>y
}

print(primes)

//第一种
primes.sort(by:compare)
print(primes)


//第二种
primes.sort(by: {
    (x:Int,y:Int)->Bool in
    return x>y
})
print(primes)


//第三种
primes.sort(by: {
    (x,y) in
    return x>y
})
print(primes)


//第四种
primes.sort(by: {
    (x,y) in
    x>y
})
print(primes)


//第五种
primes.sort(by: { $0 > $1 })
print(primes)

primes.sort{ $0 > $1 }
print(primes)

primes.sort( by: > )
print(primes)
 */

enum Gender:Int{
    case male,female
    static func >(lhs: Gender, rhs: Gender) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
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
}

class Student:Person{
    var stuNo:String
    init(firstName:String, lastName:String, age:Int, gender:Gender,stuNo:String){
        self.stuNo=stuNo
        super.init(firstName:firstName, lastName:lastName, age:age, gender:gender)
    }
    convenience init (name:String,nom:String){
        self.init(firstName:name, lastName:"",age:20, gender: Gender.female,stuNo:nom)
    }
    override var description:String {
        return super.description + " stuNo:\(stuNo)"
    }
}


class Teacher:Person{
    var title:String
    init(firstName:String, lastName:String, age:Int, gender:Gender,title:String){
        self.title=title
        super.init(firstName:firstName, lastName:lastName, age:age, gender:gender)
    }
    convenience init (name:String,nom:String){
        self.init(firstName:name, lastName:"",age:44, gender: Gender.male,title:nom)
    }
    override var description:String {
        return super.description + " title:\(title)"
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






