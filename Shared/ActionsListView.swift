import SwiftUI

struct ActionsListView: View {
    // MARK: - Properties
    let projectId: Int?
    @State private var showingAlert1 = false
    @State private var showingAlert2 = false
    @State private var showingAlert3 = false
    @State private var showingAlert4 = false

    var body: some View {
        List {
            ForEach((1...10), id: \.self) { actionId in
                NavigationLink(destination: ActionDetailView(actionId: actionId)) {
                    Text("Action \(actionId)")
                        .padding()
                }
            }
        }
        .navigationTitle("Project \(projectId ?? -1)")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button(action: { showingAlert1 = true }, label: { Label("Add", systemImage: "plus") })
                    .alert("Primary action", isPresented: $showingAlert1) {
                        Button("OK", role: .cancel) { }
                    }
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
            ToolbarItem(placement: .automatic) {
                Button(action: { showingAlert4 = true }, label: { Label("Owner", systemImage: "person") })
                    .alert("Third automatic action", isPresented: $showingAlert4) {
                        Button("OK", role: .cancel) { }
                    }
            }
        }
    }
}

struct ActionsListViewPreviews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ActionsListView(projectId: nil)
        }
    }
}
