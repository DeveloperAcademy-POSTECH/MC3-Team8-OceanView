//
//  MessageField.swift
//  MC3_Project
//
//  Created by Herry on 2023/07/26.
//

import SwiftUI

struct MessageField: View {
    @EnvironmentObject var messageManager: MessageManager
    @State private var message = ""
    @ObservedObject var mainModel: MainViewModel
    
    var body: some View {
        HStack {
            roundedInfinityWidthBox(boxHeight: 40, boxBackgroundColor: "GrayScale10") {
                CustomTextField(placeholder: Text("Enter your message here"), text: $message)
                .padding()
            }
            .padding(.horizontal, 16)
            
            roundedFixedSizeBox(boxWidth: 40, boxHeight: 40, boxBackgroundColor: "Main01") {
                Button {
                    messageManager.sendMessage(text: message, userName: mainModel.userInformation?.userName ?? "", profileImageUrl: mainModel.userInformation?.profileImageUrl ?? "")
                    message = ""
                } label: {
                    Text(Image("IconSendMessage"))
                }
            }
            .padding(.trailing, 16)
        }
    }
}

struct MessageField_Previews: PreviewProvider {
    static var previews: some View {
        MessageField(mainModel: MainViewModel())
            .environmentObject(MessageManager())
    }
}

struct CustomTextField: View {
    var placeholder: Text
    @Binding var text: String
    var edtingChanged: (Bool) -> () = {_ in}
    var commit: () -> () = {}
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .opacity(0.5)
            }
            
                TextField("", text: $text, onEditingChanged: edtingChanged, onCommit: commit)
                    //.padding()
            
           //.padding(.horizontal, 16)
            
        }
    }
}
