import SwiftUI

struct Star {
    let systemName: String
    let foregroundColor: Color
}

struct FavoriteButton: View {
    // changes made inside this view propagate back to the data source because of @Binding
    @Binding var isSet: Bool
    
    var star: Star {
      if isSet {
        return Star(systemName: "star.fill", foregroundColor: Color.yellow)
      } else {
        return Star(systemName: "star", foregroundColor: Color.gray)
      }
    }
    
    var body: some View {
        Button(action: { isSet.toggle() }) {
            Image(systemName: star.systemName)
                .foregroundColor(star.foregroundColor)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FavoriteButton(isSet: .constant(true))
                .previewDisplayName("Button set")
            FavoriteButton(isSet: .constant(false))
                .previewDisplayName("Button unset")
        }
        .previewLayout(.fixed(width: 50, height: 50))
    }
}
