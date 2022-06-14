//
//  ContentView.swift
//  WeatherIOSApp
//
//  Created by Lucas Romero Magaña on 14/6/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack{
            BackGroundView(isNight: $isNight)
            
            VStack{
                CityTextView(cityName: "Madrid, ES")
                
                ActualWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 40)
                
                HStack(spacing: 20){
                    WeatherDayView(dayOfWeek: "MAR", weatherImageName: "sun.max.fill", temperature: 34)
                    WeatherDayView(dayOfWeek: "MIE", weatherImageName: "sun.max.fill", temperature: 36)
                    WeatherDayView(dayOfWeek: "JUE", weatherImageName: "wind", temperature: 28)
                    WeatherDayView(dayOfWeek: "VIE", weatherImageName: "thermometer.sun.fill", temperature: 35)
                    WeatherDayView(dayOfWeek: "SAB", weatherImageName: "sun.max.fill", temperature: 33)
                    WeatherDayView(dayOfWeek: "DOM", weatherImageName: "cloud.sun.fill", temperature: 29)
                }
                
                Spacer()
                
                Button{
                    isNight.toggle()
                } label: {
                    SimpleButton(title: "Cambiar momento del dia", textColor: .blue, backgroundColor: .white)
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
    var weatherImageName: String
    var temperature: Int
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: weatherImageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40 , height: 40)
            
            Text("\(temperature)º")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct  BackGroundView : View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(
                        colors: [isNight ? .black : .blue,
                                  isNight ? .gray :  Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all )
    }
}


struct CityTextView: View{
    var cityName: String
    var body: some View{
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default ))
            .foregroundColor(.white)
            .padding(.bottom, 30)
    }
    
}

struct ActualWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View{
        VStack(spacing: 10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)º")
                .font(.system(size: 65, weight: .medium))
                .foregroundColor(.white)
        }.padding(.bottom, 60)
    }
}


