//
//  MindLikeWaterApp.swift
//  Shared
//
//  Created by Jorge Ortiz Fuentes on 17/11/21.
//

import SwiftUI

@main
struct MindLikeWaterApp: App {
    var body: some Scene {
        WindowGroup {
            #if os(macOS)
            ThreeColumnsNavigationView()
            #endif
            #if os(iOS)
            AdjustableView()
            #endif
        }
        .commands {
            SidebarCommands()
        }
    }
}

#if os(iOS)
struct AdjustableView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?

    var body: some View {
        if verticalSizeClass == .regular && horizontalSizeClass == .regular {
            ThreeColumnsNavigationView()
        } else {
            SingleColumnNavigationView()
        }
    }
}

struct SingleColumnNavigationView: View {
    var body: some View {
        NavigationView {
            ProjectsListView()
        }
    }
}
#endif

struct ThreeColumnsNavigationView: View {
    var body: some View {
        NavigationView {
            ProjectsListView()
            NoContentView()
            NoContentView()
        }
    }
}
