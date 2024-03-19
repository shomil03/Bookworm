//
//  EmojiRatingView.swift
//  Bookworm
//
//  Created by Shomil Singh on 19/03/24.
//

import SwiftUI

struct EmojiRatingView: View {
    var rating : Int
    var body: some View {
        switch rating{
            case 1:
                return Text("☹️")
            case 2:
                return Text("😕")
            case 3:
                return Text("😙")
            case 4:
                return Text("😋")
            default:
                return Text("🤯")
        }
        
    }
}

#Preview {
    EmojiRatingView(rating: 5)
}
