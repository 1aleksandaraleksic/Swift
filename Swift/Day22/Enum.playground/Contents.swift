import UIKit

enum CompassPoint {
    case north, east, south, west
}

var compassHeading = CompassPoint.west
var compassHeading2:CompassPoint = .west

switch compassHeading {
case .north:
    print("I'm heading north")
case .east:
    print("I'm heading east")
case .south:
    print("I'm heading south")
case .west:
    print("I'm heading west")
}
