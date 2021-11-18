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
            NavigationView {
                ProjectsListView()
                NoContentView()
                NoContentView()
            }
        }
    }
}
