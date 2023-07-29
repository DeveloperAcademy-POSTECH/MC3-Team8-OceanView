//
//  Extensions.swift
//  MC3_Project
//
//  Created by Herry on 2023/07/21.
//

import Foundation
import SwiftUI
import Combine


extension Color {
    struct Mytheme {
        static var heartColor: Color {
            return Color("Main01")
        }
        
        static var registerBackColor: Color {
            return Color("RegisterBackColor")
        }
        
        static var onbardingColor: Color {
            return Color("Point01")
        }
        
        static var onbardingBackgroundColor: Color {
            return Color("Main02")
        }
       
    }
}

extension UIColor {
    var color: Color { Color(self) }
}

extension Color {
  init(hex: String) {
    let scanner = Scanner(string: hex)
    _ = scanner.scanString("#")
    
    var rgb: UInt64 = 0
    scanner.scanHexInt64(&rgb)
    
    let r = Double((rgb >> 16) & 0xFF) / 255.0
    let g = Double((rgb >>  8) & 0xFF) / 255.0
    let b = Double((rgb >>  0) & 0xFF) / 255.0
    self.init(red: r, green: g, blue: b)
  }
}


// 텍스트필드 Placeholder 색 변경
extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}


// 코너
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}


struct HalfTransparentCover: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIHostingController(rootView: DoneGroupMatchView(vm: ChaListViewModel(), mainModel: MainViewModel()))
        viewController.view.backgroundColor = UIColor.black.withAlphaComponent(0.5) // 반투명한 배경 색상 지정
        viewController.modalPresentationStyle = .overCurrentContext // 투명한 배경으로 설정
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}


struct BackgroundClearView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}

