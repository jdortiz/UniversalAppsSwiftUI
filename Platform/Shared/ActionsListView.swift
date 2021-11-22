import SwiftUI
import Combine

struct ActionsListView: View {
    // MARK: - Properties
    @ObservedObject var viewModel: ActionsListViewModel
    @State private var showingActionEdit = false
    @State private var showingAlert2 = false
    @State private var showingAlert3 = false
    @State private var showingAlert4 = false

    var body: some View {
        List(viewModel.actions) { action in
            NavigationLink(destination: ActionDetailView(actionId: action.id)) {
                Text(action.name)
                    .padding()
            }
        }
        .navigationTitle("Project")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button(action: { showingActionEdit = true }, label: { Label("Add", systemImage: "plus") })
            }
            ToolbarItem(placement: .automatic) {
                Button(action: { showingAlert2 = true }, label: { Label("Owner", systemImage: "person") })
                    .alert("First automatic action", isPresented: $showingAlert2) {
                        Button("OK", role: .cancel) { }
                    }
            }
            ToolbarItem(placement: .automatic) {
                Button(action: { showingAlert3 = true }, label: { Label("Owner", systemImage: "person") })
                    .alert("Second automatic action", isPresented: $showingAlert3) {
                        Button("OK", role: .cancel) { }
                    }
            }
            ToolbarItem(placement: .navigation) {
                Button(action: { showingAlert4 = true }, label: { Label("Up", systemImage: "arrow.up") })
                    .alert("Action navigation action", isPresented: $showingAlert4) {
                        Button("OK", role: .cancel) { }
                    }
            }
        }
        .sheet(isPresented: $showingActionEdit) {
            ActionEditView(showView: $showingActionEdit)
        }
        .onAppear {
            viewModel.refresh()
        }
    }
}

// struct ActionsListViewPreviews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            ActionsListView(projectId: nil)
//        }
//    }
// }
