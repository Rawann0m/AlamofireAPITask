//
//  ContentView.swift
//  AlamofireAPITask
//
//  Created by Rawan on 19/09/1446 AH.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationStack {
            ZStack{
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea(.all)
                VStack {
                    // navigation
                    NavigationLink(destination: GetView()) {
                        Text("Fetch Data")
                            .padding()
                            .background(Color.white.opacity(0.8))
                            .foregroundColor(.theme.Bcolor)
                            .cornerRadius(10)
                            .font(.title)
                    }
                    .padding()
                    NavigationLink(destination: PostView()) {
                        Text("Post Data")
                            .padding()
                            .background(Color.white.opacity(0.8))
                            .foregroundColor(.theme.Bcolor)
                            .cornerRadius(10)
                            .font(.title)
                    }
                }
                .navigationTitle("")
                
                
            }
        }
    }
}

#Preview {
    ContentView()
}
