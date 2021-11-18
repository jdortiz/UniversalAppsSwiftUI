import SwiftUI

struct ActionDetailView: View {
    // MARK: - View
    var body: some View {
        VStack(alignment: .leading) {
            Text("This is something that should be done")
                .padding()
            Toggle("Done", isOn: .constant(false)).padding()
        }
        .navigationTitle("Some action")
    }
}

struct ActionDetailViewPreviews: PreviewProvider {
    static var previews: some View {
        ActionDetailView()
    }
}
