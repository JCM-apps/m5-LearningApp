//
//  RectangleCard.swift
//  Module 5 Lessons
//
//  Created by Juan Meneses on 2/22/23.
//

import SwiftUI

struct RectangleCard: View {
    var color = Color.white
    
    var body: some View {
        Rectangle()
          
            .foregroundColor(.green)
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}

struct RectangleCard_Previews: PreviewProvider {
    static var previews: some View {
        RectangleCard()
    }
}