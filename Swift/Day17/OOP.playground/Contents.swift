import UIKit

var str = "Hello, playground"


struct Resolution {
    var width:Int = 0
    var height:Int = 0
    
}

class VideoMode{
    var resolution:Resolution = Resolution()
    var interlared = false
    var frameRate = 0.0
    var name: String?
}

var r1 = Resolution()
print(r1.width, r1.height)

let r2 = Resolution(width: 100, height: 200)

print(r2.height, r2.width)

//r2.height = 300

let v1 = VideoMode()



struct OsobaS{
    var ime: String
}

class OsobaC{
    var ime: String?
}

var os1 = OsobaS(ime: "")
os1.ime = "Pera"

var oc1 = OsobaC()
oc1.ime = "Pera"

var os2 = os1
var oc2 = oc1

print(os1.ime, oc1.ime)
print(os2.ime, oc2.ime)


os1.ime = "Marko"
oc1.ime = "Marko"



struct Point{
    var x = 0.0, y = 0.0
}

struct Size{
    var width = 0.0, height = 0.0
}

struct Rect{
    var 
}
