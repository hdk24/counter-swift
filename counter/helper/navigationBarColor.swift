//
//  NavBarExtension.swift
//  counter
//
//  Created by hanantadk on 09/06/20.
//  Copyright © 2020 hanantadk. All rights reserved.
//
import SwiftUI

extension View {
    func navigationBarColor(_ backgroundColor: UIColor?) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor))
    }
}
