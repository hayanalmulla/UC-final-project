//
//  CustomDatePicker.swift
//  Task Leader
//
//  Created by macbook on 29/09/2022.
//
import SwiftUI

struct CustomDatePicker: Identifiable{
    var id: ObjectIdentifier
    
    
    @Binding var currentDate: Date
    @State var currentMonth: Int = 0

}
    var body: some View {
        VStack(spacing:35){
            
            let days:[String] =
            ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"]
            
            HStack(spacing: 20){
                VStack(alignment: .leading, spacing: 10){
                    Text("7")
                        .font(.caption)
                        .fontWeight(.semibold)
                    
                    Text("7")
                        .font(.title3.bold())
                }
                Spacer(minLength: 0)
                
                Button{
                    withAnimation{
                  
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                }
                Button{
                    withAnimation{
                      
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
         }
                }
                        
                            
                        }
                    
                }
            }
            // extracting year and month
            
          
    
              
struct CustomDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
        // Extending Date to get Current month dates..

    
