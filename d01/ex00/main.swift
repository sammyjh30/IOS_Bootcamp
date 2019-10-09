var arrColors: [Color] = Color.allColors
var arrValues: [Value] = Value.allValues

for col in arrColors {
    // https://developer.apple.com/documentation/swift/array
    print("\(col) = \(col.rawValue)")
    
}

for val in arrValues {
    print("\(val) = \(val.rawValue)")
}