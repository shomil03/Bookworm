//
//  RatingView.swift
//  Bookworm
//
//  Created by Shomil Singh on 19/03/24.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating : Int
    var label = ""
    var maximumRating = 5
    var offImage : Image?
    var onImage = Image(systemName: "star.fill")
    var onColor = Color.yellow
    var offColor = Color.gray
    
    var body: some View {
      
        HStack{
            if label.isEmpty == false{
                Text(label)
            }
            ForEach(1..<maximumRating+1 , id: \.self){number in
                Button{
                    rating = number
                }label: {
                    image(for: number)
                        .foregroundStyle(number > rating ? offColor : onColor)
                }
                
            }
        }
        .buttonStyle(.plain)
        
    }
    func image(for number : Int)-> Image{
        if number > rating{
            return offImage ?? onImage
        }
        else{
            return onImage
        }
    }
}

#Preview {
    RatingView(rating: .constant(3))
}
