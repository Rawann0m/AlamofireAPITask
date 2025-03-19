//
//  GetViewModel.swift
//  AlamofireAPITask
//
//  Created by Rawan on 19/09/1446 AH.
//

import SwiftUI
import Alamofire

extension GetView {
    class ViewModel: ObservableObject {
        @Published var title: String = ""
        @Published var body: String = ""
        @Published var isLoading: Bool = false
        @Published var showErrorAlert: Bool = false
        @Published var errorMessage: String = ""
        @Published var posts : [Post] = []
        // fetch data function
        func fetchData() {
            //api link
            let url = "https://jsonplaceholder.typicode.com/posts"
            
            print("\n=============================")
            print("🌍 API REQUEST INITIATED")
            print("🔗 URL: \(url)")
            print("🛠 Method: GET")
            print("=============================\n")
            
            isLoading = true  //  Start Loader
            // alamofire request
            AF.request(url, method: .get)
                .validate()
                .responseDecodable(of: [Post].self) { response in
                    DispatchQueue.main.async {
                        self.isLoading = false  //  Stop Loader
                        
                        print("\n=============================")
                        print("📡 API RESPONSE RECEIVED")
                        print("🔗 URL: \(url)")
                        print("📄 Status Code: \(response.response?.statusCode ?? -1)")
                        print("=============================")
                        
                        switch response.result {
                        case .success(let data):
                            self.posts = data
                            
                            print("\n✅ SUCCESS: Data Fetched")
                            print(" Post: \(data)")
                            print("=============================\n")
                            
                        case .failure(let error):
                            self.errorMessage = "Failed to fetch data: \(error.localizedDescription)"
                            self.showErrorAlert = true
                            
                            print("\n❌ ERROR: Failed to fetch data")
                            print("⚠️ Error Description: \(error.localizedDescription)")
                            if let data = response.data, let rawJSON = String(data: data, encoding: .utf8) {
                                print("📦 Raw JSON Response:\n\(rawJSON)")
                            }
                            print("=============================\n")
                        }
                    }
                }
        }
    }
}
