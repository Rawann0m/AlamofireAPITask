//
//  PostView.swift
//  AlamofireAPITask
//
//  Created by Rawan on 19/09/1446 AH.
//

import SwiftUI

struct PostView: View {
    @StateObject private var viewModel = PostViewModel()
    
    var body: some View {
        
        VStack {
            //post title
            TextField("Enter Post Title", text: $viewModel.title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            //post body
            TextField("Enter Post Body", text: $viewModel.body)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            //button to create the post
            Button("Create Post") {
                viewModel.createPost()
            }
            .padding()
            .background(Color.theme.Bcolor)
            .foregroundColor(.white)
            .cornerRadius(10)
            //shwo the loading
            if viewModel.isLoading {
                ProgressView("Sending Post...")
            }
            //post getting posted and shown
            if let post = viewModel.postResponse {
                VStack {
                    Text("Post Created!")
                        .font(.headline)
                        .foregroundColor(.green)
                    Text("Title: \(post.title)")
                    Text("Body: \(post.body)")
                }
                .padding()
            }
        }
        .padding()
        //error handling
        .alert(isPresented: $viewModel.showErrorAlert) {
            Alert(title: Text("Error"), message: Text(viewModel.errorMessage), dismissButton: .default(Text("OK")))
        }
    }
}

#Preview {
    PostView()
}
