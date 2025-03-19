//
//  GetView.swift
//  AlamofireAPITask
//
//  Created by Rawan on 19/09/1446 AH.
//

import SwiftUI

struct GetView: View {
    @StateObject private var viewModel = ViewModel()
    @State private var isDataFetched = false
    @State private var hasLoaded = false //  Prevent Recursive Calls
    var body: some View {
        NavigationStack {
            VStack{
                //if the data isnt fetched then call the method fetch and remove the burron after
                if !isDataFetched {
                    //button to fetch the data
                    Button("Fetch Data") {
                        viewModel.fetchData()
                        isDataFetched = true
                    }
                    .padding()
                    .background(Color.theme.Bcolor)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                
                if viewModel.isLoading {
                    ProgressView("Loading...") // Show Loader
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(1.5)
                } else {
                    // list the posts avaiable in the api
                    List(viewModel.posts) { post in
                        Section(header: Text(post.title)
                            .font(.headline)
                            .bold()
                            .foregroundColor(.black)
                        ) {
                            Text(post.body)
                                .font(.body)
                                .foregroundColor(.gray)
                        }
                    }
                    //make the list look better
                    .listStyle(InsetGroupedListStyle())
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                }
                
                
            }//error handling
            .alert(isPresented: $viewModel.showErrorAlert) {
                Alert(title: Text("Error"), message: Text(viewModel.errorMessage), dismissButton: .default(Text("OK")))
            }
            
        }
    }
}

#Preview {
    GetView()
}
