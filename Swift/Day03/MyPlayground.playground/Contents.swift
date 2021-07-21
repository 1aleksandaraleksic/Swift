var i: Int = 113

//j = Int32(i)
//i = Int(Int32(j))

//if i is Int16 {
//    print("This is a int16")
//}

//if i != Int(Int8(i)) {
//    print("This is a int8")
//}else if i != Int(Int16(i)) {
//    print("This is a int16")
//}else if i != Int(Int32(i)){
//    print("This is a int32")
//}else if i != Int(Int64(i)){
//    print("This is a int64")
//}

if i >= Int8.min && i <= Int8.max{
    print("This is a int8")
} else if i >= Int16.min && i <= Int16.max {
    print("This is a int16")
} else if i >= Int32.min && i <= Int32.max {
    print("This is a int32")
} else if i >= Int64.min && i <= Int64.max {
    print("This is a int64")
}


typealias audio = Int16

audio.min
