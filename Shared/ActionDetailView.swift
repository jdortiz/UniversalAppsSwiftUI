import SwiftUI

struct ActionDetailView: View {
    // MARK: - Properties
    let actionId: Int?
    @State private var showingAlert1 = false
    @State private var showingAlert2 = false
    @State private var showingAlert3 = false
    @State private var showingAlert4 = false

    // MARK: - View
    var body: some View {
        VStack(alignment: .leading) {
            Text("This is something that should be done")
                .padding()
            Toggle("Done", isOn: .constant(false)).padding()
        }
        .navigationTitle("Action \(actionId ?? -1)")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button(action: { showingAlert1 = true }, label: { Label("Add", systemImage: "plus") })
                    .alert("Primary action", isPresented: $showingAlert1) {
                        Button("OK", role: .cancel) { }
                    }
            }
            ToolbarItem(placement: .automatic) {
                Button(action: { showingAlert2 = true }, label: { Label("Share", systemImage: "square.and.arrow.up") })
                    .alert("First automatic action", isPresented: $showingAlert2) {
                        Button("OK", role: .cancel) { }
                    }
            }
            ToolbarItem(placement: .automatic) {
                Button(action: { showingAlert3 = true }, label: { Label("Share", systemImage: "square.and.arrow.up") })
                    .alert("Second automatic action", isPresented: $showingAlert3) {
                        Button("OK", role: .cancel) { }
                    }
            }
            ToolbarItem(placement: .navigation) {
                Button(action: { showingAlert4 = true }, label: { Label("Up", systemImage: "arrow.up") })
                    .alert("Action detail navigation action", isPresented: $showingAlert4) {
                        Button("OK", role: .cancel) { }
                    }
            }
        }
    }
}

struct ActionDetailViewPreviews: PreviewProvider {
    static var previews: some View {
        ActionDetailView(actionId: -1)
    }
}
