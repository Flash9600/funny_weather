//
//  FunnyWeatherWidgetBundle.swift
//  FunnyWeatherWidget
//
//  Created by user on 25.11.2024.
//

import WidgetKit
import SwiftUI

@main
struct FunnyWeatherWidgetBundle: WidgetBundle {
    var body: some Widget {
        FunnyWeatherWidget()
        FunnyWeatherWidgetLiveActivity()
    }
}
