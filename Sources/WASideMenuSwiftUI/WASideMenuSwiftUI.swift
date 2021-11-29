import SwiftUI

/**
 Side Menu is used to show the left side menu with navigation bar
 - Parameter : Front view is the view with left menu bar button icon
 - Parameter : Back view is the view with list of the menu, you can pass any custom view or list that has mentioned in the example
 */
@available(iOS 12.0, *)
@available(iOS 14.0, *)

public struct WASideMenuSwiftUI: View {
    
    @Binding public var showingMenu: Bool
    
    public init(showingMenu: Binding<Bool>) {
        self._showingMenu = showingMenu
    }
    
    //MARK: Observed Object
    @ObservedObject private var notifier = WAObservableObject()
    
    public var body: some View {
        ZStack(alignment: .leading) {
            NavigationView {
                notifier.frontView
                    .navigationTitle(notifier.title)
                    .navigationViewStyle(StackNavigationViewStyle())
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button(action: {
                                withAnimation {
                                    self.showingMenu.toggle()
                                }
                            }) {
                                if notifier.leftMenuButton == nil {
                                    Image(systemName: "line.horizontal.3")
                                        .resizable()
                                        .foregroundColor(notifier.menuTintColor)
                                        .frame(width: 28, height: 18, alignment: .center)
                                } else {
                                    notifier.leftMenuButton
                                }
                            }
                        }
                    }
            }
            .accentColor(notifier.backButtonColor)
            .offset(x: showingMenu ? notifier.menuWidth : 0.0, y: 0)
            .shadow(color: notifier.shadowColor, radius: notifier.shadowRadius, x: notifier.shadowX, y: notifier.shadowY)
            .zIndex(1)
            .scaleEffect(notifier.isEnableScaling ? (showingMenu ? notifier.scaling : 1) : 1)
            .statusBar(hidden: notifier.statusBarHidden ? showingMenu : notifier.statusBarHidden)
            notifier.leftMenuView
        }
    }
}

@available(iOS 12.0, *)
@available(iOS 14.0, *)

extension WASideMenuSwiftUI {
    /// Sets the Front view.
    public func frontView<frontView: View>(@ViewBuilder _ view: @escaping () -> frontView) -> Self {
        notifier.frontView = AnyView(view())
        return self
    }
    
    /// Sets the left menu view.
    public func leftMenuView<leftMenuView: View>(@ViewBuilder _ view: @escaping () -> leftMenuView) -> Self {
        notifier.leftMenuView = AnyView(view())
        return self
    }
    
    /// Default title is empty string
    public func title(_ title: String) -> Self {
        notifier.title = title
        return self
    }
    
    /// Default color is black
    public func menuTintColor(_ menuTintColor: Color) -> Self {
        notifier.menuTintColor = menuTintColor
        return self
    }
    
    /// Default color is black
    public func backButtonColor(_ backButtonColor: Color) -> Self {
        notifier.backButtonColor = backButtonColor
        return self
    }
    
    /// Default width is 250
    public func menuWidth(_ menuWidth: CGFloat) -> Self {
        notifier.menuWidth = menuWidth
        return self
    }
    
    /// Custom Left Menu Button
    public func lefMenuButton<LeftMenuButton: View>(@ViewBuilder _ view: @escaping () -> LeftMenuButton) -> Self {
        notifier.leftMenuButton = AnyView(view())
        return self
    }
    
    /// menu shadow
    public func frontViewShadow(color: Color, radius: CGFloat, x: CGFloat, y: CGFloat) -> Self {
        notifier.shadowColor = color
        notifier.shadowRadius = radius
        notifier.shadowX = x
        notifier.shadowY = y
        return self
    }
    
    //// You can remove shadow of the left menu
    public func removeShadow(_ remove: Bool) -> Self {
        notifier.shadowRadius = remove ? 0 : notifier.shadowRadius
        return self
    }
    
    /////
    public func setStatusBarHidden(_ hidden: Bool) -> Self {
        notifier.statusBarHidden = hidden
        return self
    }
    
    ///// If scaling is enabled then you can also give custom value of the scaling
    public func setScale(_ scale: CGFloat) -> Self {
        notifier.scaling = scale
        return self
    }
    
    /// Enable or Disable scaling
    public func isEnableScaling(_ enable: Bool) -> Self {
        notifier.isEnableScaling = enable
        return self
    }
}
