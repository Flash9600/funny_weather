import WidgetKit
import SwiftUI

private let appGroupId : String = "group.FunnyWeatherWidget";
private let defaultLocation = "Moscow, Russia";
private let defaultTemperature = "20°";

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(location: defaultLocation, currentTemperature: defaultTemperature, date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry: SimpleEntry
        
        if context.isPreview{
               entry = placeholder(in: context)
             }
             else {
                 let userDefaults = UserDefaults(suiteName: appGroupId)
               let location = userDefaults?.string(forKey: "location") ?? "No location set"
               let temperature = userDefaults?.string(forKey: "temperature") ?? "No temperature set"
               entry = SimpleEntry(location: location, currentTemperature: temperature, date: Date())
             }
        
               completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        getSnapshot(in: context) { (entry) in
                let timeline = Timeline(entries: [entry], policy: .atEnd)
                          completion(timeline)
                      }
    }
}

struct SimpleEntry: TimelineEntry {
    let location: String
    let currentTemperature: String
    let date: Date
}

struct FunnyWeatherWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text(entry.location)
            Text(entry.currentTemperature)
            
            Text("last update:")
            Text(entry.date.formatted(date: .omitted, time: .omitted)).textScale(Text.Scale.secondary)
        }
    }
}

struct FunnyWeatherWidget: Widget {
    let kind: String = "FunnyWeatherWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                FunnyWeatherWidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                FunnyWeatherWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

#Preview(as: .systemSmall) {
    FunnyWeatherWidget()
} timeline: {
    SimpleEntry(location: defaultLocation, currentTemperature: defaultTemperature, date: .now)
}
