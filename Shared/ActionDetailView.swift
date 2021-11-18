import SwiftUI

struct ActionDetailView: View {
    // MARK: - Properties
    let actionId: Int?

    // MARK: - View
    var body: some View {
        VStack(alignment: .leading) {
            Text("This is something that should be done")
                .padding()
            Toggle("Done", isOn: .constant(false)).padding()
        }
        .navigationTitle("Action \(actionId ?? -1)")
    }
}

struct ActionDetailViewPreviews: PreviewProvider {
    static var previews: some View {
        ActionDetailView(actionId: -1)
    }
}
