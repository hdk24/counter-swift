//
//  PreferenceUtils.swift
//  counter
//
//  Created by hanantadk on 09/06/20.
//  Copyright © 2020 hanantadk. All rights reserved.
//

import Foundation

class Preferences {
    
    static func saveInt(value: Int, forKey key: String){
        UserDefaults.standard.set(value, forKey: key)
    }
    
    static func saveFloat(value: Float, forKey key: String){
        UserDefaults.standard.set(value, forKey: key)
    }
    
    static func readInt(forKey key: String) -> Int{
        return UserDefaults.standard.integer(forKey: key)
    }
    
    static func readFloat(forKey key: String) -> Float{
        return UserDefaults.standard.float(forKey: key)
    }
}
