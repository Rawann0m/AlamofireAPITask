//
//  PostViewModel.swift
//  AlamofireAPITask
//
//  Created by Rawan on 19/09/1446 AH.
//

import SwiftUI
import Alamofire

class PostViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var body: String = ""
    @Published var postResponse: UserPost?
    @Published var isLoading: Bool = false
    @Published var showErrorAlert: Bool = false
    @Published var errorMessage: String = ""
    // api link
    private let url = "https://jsonplaceholder.typicode.com/posts"
    // create post function
    func createPost() {
        isLoading = true
        let parameters: [String: Any] = ["title": title, "body": body]
        
        print("\n=============================")
        print("🌍 API REQUEST INITIATED")
        print("🔗 URL: \(url)")
        print("🛠 Method: POST")
        print("📦 Parameters: \(parameters)")
        print("=============================\n")
        // alamofire request
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .responseDecodable(of: UserPost.self) { response in
                DispatchQueue.main.async {
                    self.isLoading = false
                    
                    print("\n=============================")
                    print("📡 API RESPONSE RECEIVED")
                    print("🔗 URL: \(self.url)")
                    print("📄 Status Code: \(response.response?.statusCode ?? -1)")
                    print("=============================")
                    
                    switch response.result {
                    case .success(let data):
                        self.postResponse = data
                        print("\n✅ SUCCESS: Post Created")
                        print("📝 Title: \(data.title)")
                        print("📄 Body: \(data.body)")
                        print("=============================\n")
                        
                    case .failure(let error):
                        self.errorMessage = "Failed to send data: \(error.localizedDescription)"
                        self.showErrorAlert = true
                        
                        print("\n❌ ERROR: Failed to send data")
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
