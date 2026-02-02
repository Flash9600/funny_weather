import WidgetKit
import SwiftUI

@main
struct FunnyWeatherWidgetBundle: WidgetBundle {
    var body: some Widget {
        FunnyWeatherWidget()
        FunnyWeatherWidgetLiveActivity()
    }
}
