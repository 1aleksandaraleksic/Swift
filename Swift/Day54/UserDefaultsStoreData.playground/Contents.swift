import UIKit

let name = "John"

UserDefaults.standard.setValue(name, forKey: "name")

UserDefaults.standard.removeObject(forKey: "name")
UserDefaults.standard.set("Artur", forKey: "name")

let name2 = UserDefaults.standard.string(forKey: "name") ?? "Unknown user"
print(name2)

let age = UserDefaults.standard.integer(forKey: "age") ?? 0
print(age)
