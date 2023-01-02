//
//  chatbot.swift
//  e-Constat
//
//  Created by MacBook Pro on 13/12/2022.
//

import Foundation
import SwiftUI


//Create a UIHostingController class that hosts your SwiftUI view
class SwiftUIViewHostingController: UIHostingController<ContentMessageView> {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: ContentMessageView())
    }
}


var body: some View {
        Text("Hello world")
            .padding(10)
            .foregroundColor(Color.white)
            .background(Color.blue)
            .cornerRadius(10)
    }

struct ContentMessageView : View {
    @State private var messageText = ""
    @State var messages: [String] = ["Welcome to our Assistant Clara 🤖 Type \"how to\" 🗣 to get and explaination  type \"More assistance\" 📞 to get our suport contact"]
    var body: some View {
        VStack{
            HStack{
                Text ("Clara")
                    .font(.largeTitle)
                    .bold()
                
                Image(systemName: "bubble.left.fill")
                    .font(.system(size: 26))
                    .foregroundColor(Color.orange)
            }
            ScrollView {
                //messages "welcome to purpleplay"
                ForEach(messages,id: \.self) {
                    message in
                    if message.contains("[USER]"){
                        let newMessage = message.replacingOccurrences(of: "[USER]", with: "")
                        
                        HStack {
                            Spacer()
                            Text(newMessage)
                                .padding()
                                .foregroundColor(.white)
                                .background(.blue.opacity(0.8))
                                .cornerRadius(10)
                                .padding(.horizontal,16)
                                .padding(.bottom,10)
                            
                        }
                    }   else {
                        HStack{
                            Text(message)
                                .padding()
                                .background(.gray.opacity(0.15))
                                .cornerRadius(10)
                                .padding(.horizontal,16)
                                .padding(.bottom,10)
                            Spacer()
                            
                        }
                    }
                }.rotationEffect(.degrees(180))
            }.rotationEffect(.degrees(180))
            
                .background(Color.gray.opacity(0.10))
            
            HStack {
                TextField("Type Something",text:  $messageText)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .onSubmit {
                        //sendMessage
                        sendMessage(message: messageText)
                    }
                Button{
                    //send message
                    sendMessage(message: messageText)
                    
                } label: {
                    Image(systemName: "paperplane.fill")
                }
                .font(.system(size: 26))
                .padding(.horizontal,10)
                
            }
            .padding()
        }
    }
    func sendMessage(message:String){
        withAnimation{
            messages.append("[USER]" + message)
            self.messageText = ""
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            withAnimation{
                messages.append(getBotResponse(message: message))
            }
        }
    }
    
    
}
    
    struct ContentMessageView_Previews: PreviewProvider {
        static var previews: some View {
            ContentMessageView()
        }
    }

