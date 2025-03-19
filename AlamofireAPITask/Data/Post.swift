//
//  Post.swift
//  AlamofireAPITask
//
//  Created by Rawan on 19/09/1446 AH.
//
import Foundation
// post structure
struct Post: Codable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
