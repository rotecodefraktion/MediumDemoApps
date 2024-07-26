//
//  SafeAreaView.swift
//  MediumDemoApps
//
//  Created by David Krcek on 26.07.24.
//

import SwiftUI

struct SafeAreaView: View {
    
    /// SafeArea NavigationBar
    /// Optional parameter:
    /// showBackbutton: Bool  to toogle the dispay of an left backbutton, default true
    /// showRightButton: Bool  to toogle the dispay of an right button, default: false
    /// rightButtonIcon: String for systemName Icon, default ""
    /// Mandantory parameter:
    /// screenTitle: Title of navigation bar, mandantory paramter
    /// screenSubtitle: Subtitle of navigation bar
    ///
    var showBackButton: Bool = false
    var showRightButton: Bool = false
    var rightButtonIcon: String = ""
    let screenTitle: String
    let screenSubtitle: String
    
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(alignment: .center, spacing: 6) {
            HStack() {
                if showBackButton {
                    Button(action: {
                        dismiss()
                    }) {
                        HStack {
                            Image(systemName: "chevron.backward")
                                .font(.title2)
                                    .foregroundColor(.black)
                            Text("Back")
                                .font(.headline)
                                    .foregroundColor(.black)
                        }
                        
                    }
                }
                Spacer()
                Text(screenTitle)
                    .font(.title.weight(.bold))
                Spacer()
                if showRightButton {
                    Button(action: {}) {
                        Image(systemName: rightButtonIcon)
                            .font(.title)
                            .foregroundColor(.pink)
                    }
                }
            }
            Text(screenSubtitle)
            //Text("Here is a small List of Apple Silicon devices")
                .font(.caption)
        }
        .padding()
        .background(LinearGradient(colors: [.purple.opacity(0.3), .pink.opacity(0.7)],
                                   startPoint: .topLeading, endPoint: .bottomTrailing)
            .overlay(.ultraThinMaterial)
        )
    }
}


#Preview {
    SafeAreaView(screenTitle: "Title", screenSubtitle: "This is a subtitle")
}
