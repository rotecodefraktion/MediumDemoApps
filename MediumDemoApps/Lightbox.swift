//
//  Lightbox.swift
//  MediumDemoApps
//
//  Created by David Krcek on 18.07.24.
//


import SwiftUI

struct Lightbox: View {
    
    let rows: [GridItem] = [
        GridItem(.flexible(), spacing: 0, alignment: nil ),
        GridItem(.flexible(), spacing: 0, alignment: nil ),
    ]
    
    let imageUrl: URL = URL(string: "https://picsum.photos/200")!
    @State private var mainImage: Image?
    var body: some View {
        ZStack {
            
            NavigationStack {
                VStack(spacing: 15) {
                    if let image = mainImage {
                        image
                            .resizable()
                            .frame(maxWidth: .infinity)
                            .frame(height: UIScreen.main.bounds.height * 0.40)
                            .scaledToFill()
                            .clipShape(.rect(cornerRadius: 10))
                        
                    } else {
                        AsyncImage(url: imageUrl, content: { returnImage in
                            returnImage
                                .resizable()
                                .frame(maxWidth: .infinity)
                                .frame(height: UIScreen.main.bounds.height * 0.40)
                                .scaledToFill()
                                .clipShape(.rect(cornerRadius: 10))
                        }) {
                            ProgressView()
                        }
                    }
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHGrid(
                            rows: rows,
                            alignment: .center,
                            spacing: 10,
                            pinnedViews: .sectionHeaders) {
                                Section(header:
                                            Text("1st Section")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.pink)
                                    .frame(height: 40)
                                    .frame(width: 300)
                                    .background(
                                        Color(UIColor(.primary.opacity(0.05)))
                                            .overlay(.ultraThinMaterial)
                                        
                                    )
                                        .rotationEffect(Angle(degrees: 270))
                                        .padding(.trailing, -125)
                                        .padding(.leading, -130)
                                        
                                )
                                {
                                    ForEach(0..<10) { index in
                                        AsyncImage(url: imageUrl) { phase in
                                            switch phase {
                                            case .empty:
                                                ProgressView()
                                            case .success(let returnImage):
                                                returnImage
                                                    .resizable()
                                                    .frame(height: 145)
                                                    .frame(width: 145)
                                                    .scaledToFill()
                                                    .clipShape(.rect(cornerRadius: 10))
                                                    .onTapGesture {
                                                        mainImage = returnImage
                                                    }
                                            default:
                                                ProgressView()
                                            }
                                            
                                        }
                                        
                                        
                                    }
                                    
                                }
                                
                                Section(header:
                                            Text("2nd Section")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.pink)
                                    .frame(height: 40)
                                    .frame(width: 300)
                                    .background(
                                        Color(UIColor(.primary.opacity(0.05)))
                                            .overlay(.ultraThinMaterial)
                                        
                                    )
                                        .rotationEffect(Angle(degrees: 270))
                                        .padding(.trailing, -130)
                                        .padding(.leading, -130)
                                        
                                ){
                                    ForEach(0..<10) { index in
                                        AsyncImage(url: imageUrl) { phase in
                                            switch phase {
                                            case .empty:
                                                ProgressView()
                                            case .success(let returnImage):
                                                returnImage
                                                    .resizable()
                                                    .frame(height: 145)
                                                    .frame(width: 145)
                                                    .scaledToFill()
                                                    .clipShape(.rect(cornerRadius: 10))
                                                    .shadow(radius: 5)
                                                    .onTapGesture {
                                                        mainImage = returnImage
                                                    }
                                            default:
                                                ProgressView()
                                            }
                                            
                                        }
                                        
                                        
                                    }
                                }
                                
                                
                            }
                        
                        
                    }
                    Spacer()
                }
                .padding(.horizontal, 14)
                .padding(.vertical, 3)
                .toolbar(.hidden, for: .navigationBar)
                .safeAreaInset(edge: .top) {
                    SafeAreaView(screenTitle: "LightBox",
                                 screenSubtitle: "It's time to browse through your beautiful pictures!")
                }
            }
        }
    }
}

#Preview {
    Lightbox()
}
