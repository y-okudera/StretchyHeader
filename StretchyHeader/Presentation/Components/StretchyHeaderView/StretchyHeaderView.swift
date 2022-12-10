//
//  StretchyHeaderView.swift
//  StretchyHeader
//
//  Created by Yuki Okudera on 2022/12/10.
//

import SwiftUI

struct StretchyHeaderView: View {

    let imageName: String

    init(imageName: String) {
        self.imageName = imageName
    }

    var body: some View {
        GeometryReader { geometryProxy in
            ZStack {
                if geometryProxy.frame(in: .global).minY <= 0 {
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometryProxy.size.width, height: geometryProxy.size.height)
                        .offset(y: geometryProxy.frame(in: .global).minY / 9)
                        .clipped()
                } else {
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometryProxy.size.width, height: geometryProxy.size.height + geometryProxy.frame(in: .global).minY)
                        .clipped()
                        .offset(y: -geometryProxy.frame(in: .global).minY)
                }
            }
        }
    }
}

struct StretchyHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        StretchyHeaderView(imageName: "header")
    }
}
