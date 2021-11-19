import SwiftUI

struct ProjectsListView: View {
    // MARK: - View
    var body: some View {
        List {
            ForEach((1...10), id: \.self) { projectId in
                NavigationLink(destination: ActionsListView(projectId: projectId)) {
                    Text("Project \(projectId)")
                        .padding()
                }
            }
        }
        .navigationTitle("Projects")
        .navigationBarItems(leading: Button(action: {}, label: { Label("Info", systemImage: "info.circle") }),
                            trailing: Button(action: {}, label: { Label("Add", systemImage: "plus") }))
    }
}

struct ProjectsListViewPreviews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProjectsListView()
        }
    }
}
