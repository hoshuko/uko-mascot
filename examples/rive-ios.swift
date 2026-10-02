// Swift Package Manager : https://github.com/rive-app/rive-ios — ajoute uko.riv au bundle.
import SwiftUI
import RiveRuntime

struct UkoView: View {
    @StateObject private var uko = RiveViewModel(fileName: "uko", stateMachineName: "Uko")

    var body: some View {
        VStack {
            uko.view().frame(width: 240, height: 360)
            HStack {
                Button("loading") { uko.setInput("state", value: 2.0) }
                Button("success") { uko.setInput("state", value: 0.0); uko.triggerInput("success") }
            }
        }
    }
}
