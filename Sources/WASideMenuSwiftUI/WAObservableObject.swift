//
//  ObservableObject.swift
//  SideMenuTest
//
//  Created by Waqas Ali on 29/11/2021.
//

import SwiftUI

@available(iOS 13.0, *)
class WAObservableObject: ObservableObject {
    
    @Published var frontView: AnyView?
    @Published var leftMenuView: AnyView?
    
    @Published var leftMenuButton: AnyView? = nil
    
    @Published var title: String = ""
    
    @Published var menuTintColor: Color = .black
    @Published var backButtonColor: Color = .black
    
    @Published var menuWidth: CGFloat = 250.0
    
    @Published var statusBarHidden = false
    @Published var isEnableScaling = false
    @Published var scaling: CGFloat = 1
    
    @Published var shadowColor: Color = .gray
    @Published var shadowRadius: CGFloat = 10
    @Published var shadowX: CGFloat = 0
    @Published var shadowY: CGFloat = 0
}
