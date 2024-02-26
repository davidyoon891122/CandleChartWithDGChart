//
//  UIViewPreview.swift
//  InstagramCloneApp
//
//  Created by Jiwon Yoon on 2023/07/20.
//

import Foundation

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct UIViewPreview<View: UIView>: UIViewRepresentable {
    let view: View

    init(_ builder: @escaping () -> View) {
        view = builder()
    }

    func makeUIView(context: Context) -> some UIView {
        return view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
}
#endif
