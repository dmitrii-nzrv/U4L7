//
//  SecondView.swift
//  U4L7
//
//  Created by Dmitrii Nazarov on 24.11.2024.
//
import SwiftUI
struct DetailView: View {
    @Binding var post: Post
    @State private var newComment: String = ""
    let images = ["img2", "img2", "img2"]

    var body: some View {
        VStack {
            ScrollView {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(images, id: \.self) { image in
                            Image(image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 280, height: 512)
                                .clipped()
                                .cornerRadius(15)
                                .padding(.horizontal, 10)
                        }
                    }
                    .padding()
                }
                Text(post.description)
                    .font(.body)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(25)
                    .padding(.horizontal, 25)
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(post.comments) { comment in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(comment.text)
                                        .font(.footnote)
                                        .foregroundColor(.white)
                                    Text("\(comment.date, formatter: dateFormatter)")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                            }
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(20)
                            .padding(.horizontal, 10)
                        }
                    }
                    .padding()
                }
                HStack {
                    TextField("Добавить комментарий", text: $newComment)
                        .textFieldStyle(PlainTextFieldStyle())
                        .onSubmit {
                            if !newComment.isEmpty {
                                let newCommentObject = Comment(text: newComment, date: Date())
                                post.comments.append(newCommentObject)
                                newComment = ""
                            }
                        }
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(20)
                        .padding(.horizontal, 10)
                }
                .padding()
            }
            .background(Color.black.ignoresSafeArea())
            .navigationTitle("16 декабря").navigationBarTitleDisplayMode(.inline)
        }
    }
}

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .short
    return formatter
}()
