import SwiftUI

struct ProjectsListView: View {
    // MARK: - Properties
    @State private var showingAlert1 = false
    @State private var showingAlert2 = false
    @State private var showingAlert3 = false
    @State private var showingAlert4 = false

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
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button(action: { showingAlert1 = true }, label: { Label("Add", systemImage: "plus") })
                    .alert("Primary action", isPresented: $showingAlert1) {
                        Button("OK", role: .cancel) { }
                    }
            }
            ToolbarItemGroup(placement: .bottomBar) {
                Button(action: { showingAlert2 = true }, label: { Label("Info", systemImage: "info.circle") })
                    .alert("First automatic action", isPresented: $showingAlert2) {
                        Button("OK", role: .cancel) { }
                    }
                Spacer()
                Button(action: { showingAlert3 = true }, label: { Label("Info", systemImage: "info.circle") })
                    .alert("Second automatic action", isPresented: $showingAlert3) {
                        Button("OK", role: .cancel) { }
                    }
                Spacer()
                Button(action: { showingAlert4 = true }, label: { Label("Up", systemImage: "arrow.up") })
                    .alert("Project navigation action", isPresented: $showingAlert4) {
                        Button("OK", role: .cancel) { }
                    }
            }
        }
    }
}

struct ProjectsListViewPreviews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProjectsListView()
        }
    }
}
