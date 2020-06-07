//
//  BlogList.swift
//  falso_ios
//
//  Created by Alperen Duran on 6.06.2020.
//  Copyright © 2020 Alperen Duran. All rights reserved.
//

import SwiftUI

struct BlogList: View {
    @ObservedObject var blogStore = BlogStore()
    var body: some View {
        NavigationView {
            List(self.blogStore.blogs) { blog in
                BlogView(blog: blog)
            }.navigationBarTitle("Blogs")
        }
    }
}

struct BlogList_Previews: PreviewProvider {
    static var previews: some View {
        BlogList()
    }
}

struct BlogView: View {
    let blog: Blog
    @State var showSheet = false
    var body: some View {
        VStack(alignment: .leading) {
            Text(blog.title)
                .font(.headline)
            
            Text(blog.creator)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .onTapGesture {
                self.showSheet.toggle()
            }
            .sheet(isPresented: self.$showSheet) {
                NavigationView {
                    WebView(html: self.blog.content)
                        .navigationBarTitle("\(self.blog.title)", displayMode: .inline)
                }
        }
    }
}
