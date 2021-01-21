//
//  MusicView.swift
//  NeumorphicDesign
//
//  Created by Kevin on 15/08/20.
//

import SwiftUI

struct MusicView: View {
    
    //MARK: - Properties
    @State private var sliderValue: CGFloat = 100
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {}, label: {
                        Image(systemName: "heart")
                            .neumorphicButtonStyle()
                })
                Spacer()
                Text("Music Player")
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "line.horizontal.3.decrease")
                            .neumorphicButtonStyle()
                })
            }
            
            Image("dilbechara")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .padding(.all, 5)
                .background(Color.offWhite)
                .clipShape(Circle())
                .neumorphicShadow()
                .padding(.all, 15)
            
            Text("Dil Bechara")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.top, 25)
            
            Text("A.R Rehman")
                .font(.subheadline)
                .foregroundColor(.black)
                .padding(.all, 10)
            
            HStack {
                Text("3.15")
                    .font(.title)
                    .foregroundColor(.gray)
                Spacer()
                Text("7.00")
                    .font(.title)
                    .foregroundColor(.gray)
            }.padding(.all, 10)
            
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .center), content: {
                Capsule()
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 6, alignment: .center)
                
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .center), content: {
                    Capsule()
                        .fill(Color.black.opacity(0.8))
                        .frame(width: sliderValue, height: 6, alignment: .center)
                    
                    Circle()
                        .frame(width: 10, height: 10, alignment: .center)
                        .padding(.all, 10)
                        .background(Color.offWhite)
                        .clipShape(Circle())
                        .neumorphicShadow()
                })
            })
            .gesture(DragGesture().onChanged({ (value) in
                
                if value.location.x <= UIScreen.main.bounds.width - 10 && value.location.x >= 0 {
                    
                    sliderValue = value.location.x
                }
            }))
            
            Spacer()
            
            HStack(spacing: 20) {
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "backward.fill")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.black)
                            .padding(.all, 25)
                            .background(Color.offWhite)
                            .clipShape(Circle())
                            .neumorphicShadow()
                })
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "pause.fill")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.black)
                            .padding(.all, 25)
                            .background(Color.offWhite)
                            .clipShape(Circle())
                            .neumorphicShadow()
                })
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "forward.fill")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.black)
                            .padding(.all, 25)
                            .background(Color.offWhite)
                            .clipShape(Circle())
                            .neumorphicShadow()
                })
                Spacer()
            }
        }
        .padding(.all, 10)
        .background(Color.offWhite.edgesIgnoringSafeArea(.all))
    }
}

struct NeumorphicButton: ViewModifier {
    
    func body(content: Content) -> some View {
        
        content
            .font(.system(size: 14, weight: .bold))
            .foregroundColor(.black)
            .padding(.all, 10)
            .background(Color.offWhite)
            .clipShape(Circle())
            .neumorphicShadow()
    }
}

struct NeumorphicShadow: ViewModifier {
    
    func body(content: Content) -> some View {
        
        content
            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
            .shadow(color: Color.white.opacity(0.7), radius: 5, x: -8, y: -8)
    }
}

struct MusicView_Previews: PreviewProvider {
    static var previews: some View {
        MusicView()
    }
}

extension Color {
    
    static let offWhite = Color(red: 225/255, green: 225/255, blue: 235/255)
}

extension View {
    
    func neumorphicButtonStyle() -> some View {
        
        return self.modifier(NeumorphicButton())
    }
    
    func neumorphicShadow() -> some View {
        
        return self.modifier(NeumorphicShadow())
    }
}
