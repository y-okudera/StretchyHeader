//
//  ChristmasFeedView.swift
//  StretchyHeader
//
//  Created by Yuki Okudera on 2022/12/10.
//

import SwiftUIMasonry
import SwiftUI

struct ChristmasFeedView: View {

    private let contents = [Int](1...12).map { Content(name: "\($0)") }

    var body: some View {
        ScrollView {
            StretchyHeaderView(imageName: "header")
                .frame(height: 350)

            VMasonry(columns: 2) {
                ForEach(contents) { content in
                    Image(content.name)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(8)
                        .onTapGesture {
                            print(content.name)
                        }
                }
            }
            .padding(.horizontal, 8)
        }
        .edgesIgnoringSafeArea(.top)
        .statusBarStyle(.lightContent)
    }
}

struct ChristmasFeedView_Previews: PreviewProvider {
    static var previews: some View {
        ChristmasFeedView()
    }
}
