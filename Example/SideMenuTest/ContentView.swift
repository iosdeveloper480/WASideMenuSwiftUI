//
//  ContentView.swift
//  SideMenuTest
//
//  Created by EDS on 28/11/2021.
//

import SwiftUI
//import WASideMenuSwiftUI

struct ContentView: View {
    
    @State private var selectedIndex = 0
    @State private var showingMenu = false
    @State private var title = ""
    
    
    @State private var scale: CGFloat = 1
    @State private var scaleX: CGFloat = 0
    
    var body: some View {
        WASideMenuSwiftUI(showingMenu: $showingMenu)
            .frontView {
                switch selectedIndex {
                case 0:
//                    zStack()
                    Text("Second View")
                        .background(Color.yellow)
                case 1:
                    Text("Second View")
                        .background(Color.yellow)
                case 2:
                    Text("Third View")
                        .background(Color.cyan)
                case 3:
                    Text("Fourth View")
                case 4:
                    Text("Fifth View")
                default:
                    Text("View # \(selectedIndex + 1)")
                }
            }
            .leftMenuView {
                List(0..<10) { index in
                    Text("Left menu \(index + 1)")
                        .onTapGesture {
                            withAnimation {
                                self.showingMenu.toggle()
                                self.selectedIndex = index
                            }
                        }
                }
                .listStyle(PlainListStyle())
            }
            .lefMenuButton {
                Image(systemName: "ellipsis")
                    .resizable()
                    .foregroundColor(.cyan)
                    .frame(alignment: .center)
                    .font(.largeTitle)
            }
            .frontViewShadow(color: .gray, radius: 5, x: 0, y: 0)
            .removeShadow(false)
            .setStatusBarHidden(false)
            .isEnableScaling(true)
            .setScale(0.95)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//            .environment(\.layoutDirection, .rightToLeft)
    }
}
