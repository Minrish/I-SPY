//
//  ContentView.swift
//  I Spy
//
//  Created by Bert Yan on 4/16/22.
//

import SwiftUI

struct ContentView: View {
    
    let modeOption = ClassificationViewModel()
    
    @State private var action: Int? = 0
    
    var body: some View {
        
        NavigationView{
        
            ZStack() {
                
                VStack(alignment:.center) {
                                  
                    Spacer()
                    
                    HStack{
                        Text(ViewConstants.title1stline).font(.system(size: 140, weight: .bold, design: .rounded)).foregroundColor(Color.blue)
                        Text(ViewConstants.title2ndline).font(.system(size: 140, weight: .bold, design: .rounded)).foregroundColor(Color.mint)
                    }
                    
                    Spacer()
                        .frame(height:350)
                    
                    NavigationLink(destination: CameraMode(classifier: modeOption.self).navigationTitle("Camera Mode"), tag: 1, selection: $action) {EmptyView()}
                    NavigationLink(destination: PictureMode(classifier: modeOption.self).navigationTitle("Picture Mode"), tag: 2, selection: $action) {EmptyView()}
                    
                    VStack(spacing: 20) {
                        Text(ViewConstants.option2title).font(.system(size: 15, weight: .bold, design: .rounded))
                            .padding(.horizontal)
                            .padding()
                            .foregroundColor(.white)
                            .background(Capsule().strokeBorder(option2Gradient, lineWidth: 40).background(Capsule().fill(option2Gradient)).shadow(radius: ViewConstants.shadowRadius)).foregroundColor(.white)
                            .onTapGesture {
                                self.action = 2
                            }
            
                        Text(ViewConstants.option1title).font(.system(size: 15, weight: .bold, design: .rounded))
                            .padding(.horizontal)
                            .padding()
                            .foregroundColor(.white)
                            .background(Capsule().strokeBorder(option1Gradient, lineWidth: 40).background(Capsule().fill(option1Gradient)).shadow(radius: ViewConstants.shadowRadius)).foregroundColor(.white)
                            .onTapGesture {
                                self.action = 1
                            }
                    }
                    
                    Spacer()
                    
                }
            }
            .background(
                Image("spy")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .grayscale(0.80)
                    .brightness(-0.3)
                    .opacity(0.75)
            )
            .navigationTitle("Home")
            .navigationBarHidden(true)

        }
    }
}
