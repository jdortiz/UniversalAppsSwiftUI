import SwiftUI

struct ActionEditView: View {
    // MARK: - View
    @ObservedObject var viewModel: ActionEditViewModel
    @Binding var showView: Bool

    // MARK: - View
    var body: some View {
        NavigationView {
            TextField("Action name", text: $viewModel.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .navigationTitle("New action")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel", role: .cancel) {
                            showView = false
                        }
                        .keyboardShortcut(.cancelAction)
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button(action: {
                            viewModel.save()
                            showView = false
                        },
                               label: { Text("Save")
                                .bold()
                                .disabled(viewModel.saveDisabled)
                        })
                            .keyboardShortcut(.defaultAction)
                    }
                }
        }
    }
}

// struct ActionEditViewPreviews: PreviewProvider {
//    static var previews: some View {
//        ActionEditView(showView: .constant(true))
//    }
// }
