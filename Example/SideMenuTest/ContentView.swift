//
//  ContentView.swift
//  SideMenuTest
//
//  Created by EDS on 28/11/2021.
//

import SwiftUI
import WASideMenuSwiftUI

struct ContentView: View {
    
    @State private var selectedIndex = 0
    @State private var showingMenu = false
    @State private var title = ""
    
    var body: some View {
//        Text("aaa")
        WASideMenuSwiftUI(showingMenu: $showingMenu)
            .frontView {
                switch selectedIndex {
                case 0:
                    NavigationLink {
                        Text("First Detail View")
                    } label: {
                        Text("First View")
                    }
                case 1:
                    Text("Second View")
                case 2:
                    Text("Third View")
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
