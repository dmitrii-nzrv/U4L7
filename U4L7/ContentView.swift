//
//  ContentView.swift
//  U4L7
//
//  Created by Dmitrii Nazarov on 24.11.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var posts: [Post] = [
        Post(
                id: 0,
                image: "img1",
                description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                comments: [Comment(text: "Первый комментарий", date: Date())]
            ),
            Post(
                id: 1,
                image: "img1",
                description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)...",
                comments: [Comment(text: "Замечательная идея!", date: Date())]
            )
        ]

    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Сегодня")
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                        .padding(.bottom, 25)
                        .font(.title2)
                        .fontWeight(.bold)
                    ForEach(posts) { post in
                        NavigationLink(destination: DetailView(post: binding(for: post))) {
                            PostCardView(post: post)
                                //.padding()
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
            .padding(.top, 30)
            .background(.black)
           
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                    } label: {
                    
                       Text("InstaPocket")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                            //.padding(.horizontal, 30)
                    }
                    .padding(.horizontal, 20)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                    } label: {
                        
                        Image(systemName: "gearshape")
                            .font(.title2)
                            .foregroundStyle(.white)
                    }
                    .padding(.horizontal, 20)
                }
                
            }
            
        }
        
    }

    private func binding(for post: Post) -> Binding<Post> {
        guard let index = posts.firstIndex(where: { $0.id == post.id }) else {
            fatalError("Post not found")
        }
        return $posts[index]
    }
}

struct PostCardView: View {
    let post: Post

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(post.image)
                .resizable()
                .scaledToFit()
                .frame(height: 370)
                .frame(maxWidth: .infinity)
                
                .cornerRadius(30)
                .mask(
                    LinearGradient(gradient: Gradient(colors: [.white, .cyan, .clear]), startPoint: .top, endPoint: .bottom)
                    )
            VStack(alignment: .center, spacing: 13) {
               HStack {
                    Text("4 фотографии")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Text("\(post.comments.count) комментариев")
                        .font(.headline)
                        .foregroundColor(.white)
                    Spacer()
                }
                HStack(alignment: .center){
                    btn()
                    Spacer()
                    btn()
                    Spacer()
                    btn()
                }
                Text(post.description)
                    .font(.caption)
                    .foregroundColor(.white)
                    .lineLimit(3)
            }
            .padding()
            .padding(.vertical)
            
        }
        .padding(.horizontal)
        .padding(.bottom)
        
    }
}
struct btn: View{
    var body: some View{
        Button {
            
        } label: {
            Button(action: {
                print("Кнопка нажата!")
            }) {
                Text("Природа")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(.white)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 5)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.gray.opacity(0.5))
                    )
            }
        }
    }
}
#Preview {
    ContentView()
        
}

