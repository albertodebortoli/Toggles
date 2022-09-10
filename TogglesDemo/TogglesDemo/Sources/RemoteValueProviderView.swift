//  RemoteValueProviderView.swift

import Combine
import SwiftUI
import Toggles

struct RemoteValueProviderView: View {
    
    let provider: RemoteValueProvider
    let manager: ToggleManager
    
    let message = """
This action simulates a new configuration being fetched to demonstrate the use case and how the ToggleView reacts to the changes.

The values in the new configuration are generated randomly.
"""
    
    var body: some View {
        VStack(spacing: 10) {
            Text("RemoteValueProvider")
                .font(.title)
                .padding()
            Button("Fetch latest configuration (fake)") {
                provider.fakeFetchLatestConfiguration {
                    manager.reactToConfigurationChanges()
                }
            }
            .font(.title2)
            .padding()
            Text(message)
                .padding()
        }
    }
}

struct RemoteValueProviderView_Previews: PreviewProvider {
    static var previews: some View {
        let datasource = Bundle.main.url(forResource: "DemoDatasource", withExtension: "json")!
        let provider = try! RemoteValueProvider(jsonURL: datasource)
        let manager = try! ToggleManager(mutableValueProvider: nil,
                                         valueProviders: [provider],
                                         datasourceUrl: datasource)
        RemoteValueProviderView(provider: provider, manager: manager)
    }
}
