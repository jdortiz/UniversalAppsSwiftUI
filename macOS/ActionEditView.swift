import SwiftUI

struct ActionEditView: View {
    // MARK: - View
    @Binding var showView: Bool
    @State private var name: String = ""

    // MARK: - View
    var body: some View {
        TextField("Action name", text: $name)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.horizontal)
            .navigationTitle("New action")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", role: .cancel) {
                        showView = false
                    }
                    .keyboardShortcut(.cancelAction)
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button(action: { showView = false },
                           label: { Text("Save")
                            .bold()
                            .disabled(name.isEmpty)
                    })
                        .keyboardShortcut(.defaultAction)
                }
            }
    }
}

struct ActionEditViewPreviews: PreviewProvider {
    static var previews: some View {
        ActionEditView(showView: .constant(true))
    }
}
