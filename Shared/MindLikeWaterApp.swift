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
            #else
            SingleColumnNavigationView()
            #endif
        }
        .commands {
            SidebarCommands()
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

struct ThreeColumnsNavigationView: View {
    var body: some View {
        NavigationView {
            ProjectsListView()
            NoContentView()
            NoContentView()
        }
    }
}
