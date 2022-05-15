//
//  LogoCreation.swift
//  I Spy
//
//  Created by Bert Yan on 4/17/22.
//

import SwiftUI

struct LogoCreation: View {
    var body: some View {
        ZStack{
            ViewConstants.backgroundGradient.edgesIgnoringSafeArea(.all)
            HStack{
                Text(ViewConstants.title1stline).font(.system(size: 140, weight: .bold, design: .rounded)).foregroundColor(Color.blue)
                Text(ViewConstants.title2ndline).font(.system(size: 140, weight: .bold, design: .rounded)).foregroundColor(Color.mint)
            }
        }
        
    }
}

struct LogoCreation_Previews: PreviewProvider {
    static var previews: some View {
        LogoCreation()
    }
}
