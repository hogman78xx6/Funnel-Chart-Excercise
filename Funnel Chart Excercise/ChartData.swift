//
//  ChartData.swift
//  Funnel Chart Excercise
//
//  Created by Michael Knych on 5/30/24.
//

import Foundation
import SwiftUI

struct ChartDataType: Identifiable {
  let id = UUID()
  let day: String
  let numData: Int

}

struct Bounds {
  var xStart: Int
  var yEnd: Int
}

let defaultChartData: [ChartDataType] = [
  .init(day: "Data1", numData: 1000000),
  .init(day: "Data2", numData: 500000),
  .init(day: "Data3", numData: 250000),
  .init(day: "Data4", numData: 125000),
  .init(day: "Data5", numData: 63500),
  .init(day: "Data6", numData: 31250)
  
]

let defaultBarColors: [Color] = [
  .pink,
  .green,
  .mint,
  .purple,
  .indigo,
  .yellow,
  .red
]
