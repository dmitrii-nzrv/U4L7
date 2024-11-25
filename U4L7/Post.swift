//
//  Post.swift
//  U4L7
//
//  Created by Dmitrii Nazarov on 24.11.2024.
//


import SwiftUI

struct Comment: Identifiable {
    let id = UUID()
    let text: String
    let date: Date
}

struct Post: Identifiable {
    let id: Int
    let image: String
    let description: String
    var comments: [Comment]
}
