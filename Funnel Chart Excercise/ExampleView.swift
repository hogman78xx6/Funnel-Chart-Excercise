//
//  ExampleView.swift
//  Funnel Chart Excercise
//
//  Created by Michael Knych on 5/30/24.
//

import SwiftUI
import Charts

struct ExampleView: View {
  let chartData: [ChartDataType] = defaultChartData
  
  @State private var showValues: Bool = true
  
  var body: some View {
    
    GeometryReader { geometry in
      NavigationStack {
        VStack {
          HStack(alignment: .center) {
            Chart(chartData) { item in
              let centerPoint = chartData[0].numData / 2
              let xStart =  centerPoint - (item.numData / 2)
              let xEnd = centerPoint + (item.numData / 2)
              BarMark(xStart:  .value("Sales", xStart),
                      xEnd: .value("Sales", xEnd),
                      y: .value("Day", item.day))
              .foregroundStyle(by: .value("Day", item.day))
              .annotation(position: .trailing) {
                Text("\(item.numData)")
                  .font(.footnote)
                  .fontWeight(.semibold)
                  .opacity(showValues ? 1.0 : 0.0)
              }
            }
            .chartXAxis(.hidden)
            .chartYAxis(.hidden)
            .chartLegend(.hidden)
            .chartForegroundStyleScale(range: defaultBarColors)
            
            .chartPlotStyle { plotArea in
              plotArea
                .frame(width: geometry.size.width - geometry.size.width / 6, height: geometry.size.height / 4)
            }
            .padding()
            .onTapGesture {
              showValues.toggle()
              print(showValues)
            }
            Spacer()
          }
          .background(Color.cyan
            .opacity(0.7)
            .clipShape(.rect(cornerRadius: 10.0))
          )
          .padding()
          Spacer()
          
        }
        .navigationTitle("Funnel Chart")
      }
    }
  }
}

#Preview {
  ExampleView()
}
