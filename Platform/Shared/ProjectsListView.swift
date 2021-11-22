import SwiftUI
import Combine

struct ProjectsListView: View {
    // MARK: - Properties
    @ObservedObject var viewModel: ProjectsListViewModel
    @State private var showingAlert1 = false
    @State private var showingAlert2 = false
    @State private var showingAlert3 = false
    @State private var showingAlert4 = false
    private var button1: some View {
        Button(action: { showingAlert2 = true }, label: { Label("Info", systemImage: "info.circle") })
            .alert("First automatic action", isPresented: $showingAlert2) {
                Button("OK", role: .cancel) { }
            }
    }
    private var button2: some View {
        Button(action: { showingAlert3 = true }, label: { Label("Info", systemImage: "info.circle") })
            .alert("Second automatic action", isPresented: $showingAlert3) {
                Button("OK", role: .cancel) { }
            }
    }
    private var button3: some View {
        Button(action: { showingAlert4 = true }, label: { Label("Up", systemImage: "arrow.up") })
            .alert("Project navigation action", isPresented: $showingAlert4) {
                Button("OK", role: .cancel) { }
            }
    }

    // MARK: - View
    var body: some View {
        List(viewModel.projects) { project in
            NavigationLink(destination: ActionsListView(viewModel: ActionsListViewModel(repo: InMemoryRepo.shared,
                                                                                        projectId: project.id))) {
                Text(project.name)
                    .padding()
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
            #if os(iOS)
            ToolbarItemGroup(placement: .bottomBar) {
                button1
                Spacer()
                button2
                Spacer()
                button3
            }
            #endif
            #if os(macOS)
            ToolbarItem(placement: .automatic) {
                button1
            }
            ToolbarItem(placement: .automatic) {
                button2
            }
            ToolbarItem(placement: .navigation) {
                button3
            }
            #endif
        }
        .onAppear {
            viewModel.refresh()
        }
    }
}

// struct ProjectsListViewPreviews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            ProjectsListView()
//        }
//    }
// }
