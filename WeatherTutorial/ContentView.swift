//
//  ContentView.swift
//  WeatherTutorial
//
//  Created by Wuqiong Fan on 9/23/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityView(city: "Austin, TX")
                MainWeatherView(imageName: isNight ? "cloud.moon.fill" : "cloud.sun.fill", temperature: 80)
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: isNight ? "cloud.moon.fill" : "cloud.sun.fill",
                                   temperature: 80)
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "sun.max.fill",
                                   temperature: 88)
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "cloud.sun.bolt.fill",
                                   temperature: 84)
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "cloud.fill",
                                   temperature: 82)
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "cloud.rain.fill",
                                   temperature: 79)
                    
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  backgroundColor: .white)
                }
                
                Spacer()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40,height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    var body: some View {
        LinearGradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightblue")],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityView: View {
    var city: String
    var body: some View {
        Text(city)
            .font(.system(size: 32, weight: .semibold, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherView: View {
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180,height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

