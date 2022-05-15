//
//  PictureMode.swift
//  I Spy
//
//  Created by Bert Yan on 5/1/22.
//

import SwiftUI
import IrregularGradient

struct PictureMode: View {
    
    // VIEW MODEL
    @ObservedObject var classifier: ClassificationViewModel
    
    // MAIN set up initial booleans for view controls
    @State var isDisplaying: Bool = false
    @State var isPresenting: Bool = false
    @State var isThinking: Bool = false
    @State var isOpaque: Bool = false

    @State var uiImage: UIImage?
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    // ANIMATION 1: Loading
    @State var rotation = 0.0
    @State var scaleXY = 1.0
    @State var positionX = -150
    @State var objectColor = Color(#colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1))
    @State private var animationAmount = 1.0
    
    // ANIMATION 2: Pulsing Icon
    @State private var animationPulsing = false
    @State private var innerPulsing = false
    @State private var middlePulsing = false
    @State private var outerPulsing = false
    
    var body: some View {

        ZStack {
            VStack {
                VStack {
                    Spacer()
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .strokeBorder()
                        .foregroundColor(.clear)
                        .overlay(
                            Group {
                                if uiImage != nil {
                                    Image(uiImage: uiImage!)
                                        .resizable()
                                        .scaledToFit()
                                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                                }
                            }
                        )
                    
                    VStack {
                        
                        if isDisplaying == true {
                            
                            if let imageClass = classifier.imageClass {
                                
                                Spacer()
                                
                                VStack(alignment: .center){
                                    Group{
                                        Text("It's ") +
                                        Text(imageClass) +
                                        Text("!")
                                    }
                                    .font(.title)
                                    .multilineTextAlignment(.center)

                                }
                            } else {
                                HStack{
                                    Text("")
                                        .font(.caption)
                                }
                            }
                        }
                    }
                }

                .sheet(isPresented: $isPresenting){
                    ImagePicker(uiImage: $uiImage, isPresenting:  $isPresenting, sourceType: $sourceType)
                        .onDisappear{
                            if uiImage != nil {
                                isThinking = true
                                isOpaque = true

                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    classifier.detect(uiImage: uiImage!)
                                    isThinking = false
                                    isDisplaying = true
                                }
                            }
                        }
                }
                .padding()
                
                ZStack{
                    
                    Circle()
                        .fill(Color.white)
                        .aspectRatio(contentMode: .fit)
                        .scaleEffect(animationPulsing ? 0.5 : 0.25, anchor: .center)
                        .animation(
                            .easeOut(duration: 1)
                            .repeatForever(autoreverses: true)
                            .delay(0.1),
                            
                            value: animationAmount
                        )
                        .opacity(0.1)
                        .onAppear() {
                                self.outerPulsing.toggle()
                        }
                    
                    Circle()
                        .fill(Color.white)
                        .aspectRatio(contentMode: .fit)
                        .scaleEffect(animationPulsing ? 0.4 : 0.25, anchor: .center)
                        .animation(
                            .easeOut(duration: 1)
                            .repeatForever(autoreverses: true)
                            .delay(0.2),

                            value: animationAmount
                        )
                        .opacity(0.2)
                        .onAppear() {
                                self.middlePulsing.toggle()
                        }
                    
                    Circle()
                        .fill(Color.white)
                        .aspectRatio(contentMode: .fit)
                        .scaleEffect(animationPulsing ? 0.3 : 0.25, anchor: .center)
                        .animation(
                            .easeOut(duration: 1)
                            .repeatForever(autoreverses: true)
                            .delay(0.3),
                        
                            value: animationAmount
                        )
                        .opacity(0.3)
                        .onAppear() {
                                self.innerPulsing.toggle()
                        }
                    
                    Image(systemName: "photo.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaleEffect(animationPulsing ? 0.2 : 0.25, anchor: .center)
                        .animation(
                            .easeOut(duration: 1)
                            .repeatForever(autoreverses: true),
                        
                            value: animationAmount
                        )
                        .onTapGesture {
                            isPresenting = true
                            sourceType = .photoLibrary
                        }
                        .onAppear() {
                            self.animationPulsing.toggle()
                    }
                    
                }

                }
                .overlay(
                    ZStack{
                        Rectangle()
                            .fill(Color.white)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .edgesIgnoringSafeArea(.all)
                            .opacity(isThinking ? 0.8 : 0.0)

                        Rectangle()
                            .fill(objectColor)
                            .frame(width: 50, height: 50)
                            .rotationEffect(.degrees(rotation))
                            .scaleEffect(CGFloat(scaleXY))
                            .offset(x: CGFloat(positionX))
                            .animation(
                                .easeInOut(duration: 3.0)
                                .speed(4)
                                .repeatForever(autoreverses: true),

                                value: animationAmount
                            )
                            .onAppear() {
                                animationAmount = 1.5

                                // Final Animation States
                                rotation += 360
                                scaleXY += 1.1
                                positionX += 250
                                objectColor = Color(#colorLiteral(red: 1, green: 0.1857388616, blue: 0.5733950138, alpha: 1))
                            }
                            .opacity(isThinking ? 0.8 : 0.0)
                    }
                )
                .background(
                    Rectangle()
                        .frame(width: 500, height: 1080, alignment: .center)
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                        .irregularGradient(colors: [.blue, .cyan, .black, .mint, .purple, .indigo], backgroundColor: .black)
                )
            }
        }
    }

