//
//  CustomDatePicker.swift
//  Task Leader
//
//  Created by macbook on 29/09/2022.
//
import SwiftUI

struct CustomDatePicker: Identifiable{
    
    @Binding var currentDate: Date
    @State var currentMonth: Int = 0
}
    var body: some View {
        VStack(spacing:35){
            
            let days:[String] =
            ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"]
            
            HStack(spacing: 20){
                VStack(alignment: .leading, spacing: 10){
                    Text(extractDate()[0])
                        .font(.caption)
                        .fontWeight(.semibold)
                    
                    Text(extractDate()[1])
                        .font(.title3.bold())
                }
                Spacer(minLength: 0)
                
                Button{
                    withAnimation{
                        currentMonth -= 1
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                }
                Button{
                    withAnimation{
                        currentMonth -= 1
                    }
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                }
                }
            .padding(.horizontal)
            
            HStack(spacing:0){
                ForEach(days,id:\.self){day in
                    Text(day)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                    
                    //dates..
                    //lazy gridd..
                    let columns = Array(repeating: GridItem(.flexible()), count: 7)
                    LazyVGrid(columns: columns, spacing: 15){
                        
                        ForEach(extractDate()){value in
                           
                            Text("\(value.day)")
                                .font(.title3.bold())
                            
                        }
                    }
                }
                .onChange(of: currentMonth){ newValue in
                    //updating month
                    currentDate = getCurrentMonth()
                }
            }
            // extracting year and month
            
            func extraData()->[String]{
                let formatter = DateFormatter()
                formatter.dateFormat = "YYYY MMMM"
                
                let date = formatter.string(from: currentDate)
                
                return date.components(separatedBy: "")
            }
            func getCurrentMonth()->Date{
                let calender = Calendar.current
                
                guard let currentMonth = calender.date(byAdding: Calendar.Component, value: self.currentMonth, to: Date())
                else{
                    return Date()
            }
            return currentMonth
            }
            func extractDate()->[DateValue]{
                
                let calender = Calendar.current
                
                let currentMonth = getCurrentMonth()
               return currentMonth.getAllDates().compactMap{date -> DateValue in
                    let day = calender.component(.day, from: date)
                    return DateValue(day:day, date: date)
                }
            }
            }
struct CustomDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
        // Extending Date to get Current month dates..
        
extension Date{
func getAllDates()->[Date]{
    
    let calender = Calender.current
    
    let startDate = calender.date(from: Calender.current.dateComponents([.year,.month], from: self))!
    
    var range = calender.range(of: .day, in: .month, for:startDate)
    range.removeLast()
    
        return range.compactMap{ day -> Date in
            return calender.date(byAdding: .day, value:day == 1 ? 0: day , to: startDate)!
    }
}
}
}
