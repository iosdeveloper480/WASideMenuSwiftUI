//
//  ObservableObject.swift
//  SideMenuTest
//
//  Created by Waqas Ali on 29/11/2021.
//

import SwiftUI

@available(iOS 13.0, *)
class WAObservableObject: ObservableObject {
    
    @Published var frontView: AnyView? = nil
    @Published var leftMenuView: AnyView? = nil
    
    @Published var title: String = ""
    
    @Published var menuTintColor: Color = .black
    @Published var backButtonColor: Color = .black
    
    @Published var menuWidth: CGFloat = 250.0
}
