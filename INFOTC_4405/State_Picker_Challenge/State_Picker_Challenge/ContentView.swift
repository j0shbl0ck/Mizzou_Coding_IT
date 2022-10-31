//
//  ContentView.swift
//  State_Picker_Challenge
//
//  Created by Josh Block on 10/31/22.
//
// https://blckbirds.com/post/swiftui-how-to-create-a-picker/
// https://mobiraft.com/ios/how-to-create-a-picker-in-swiftui/
// https://twitter.com/lostmoa_nz/status/1256152748447330304?lang=en


import SwiftUI

struct ContentView: View {
    //1. Create a State for keeping track of the current selection
    @State var selection = 0
    //2. Create an array for holding the picker's content
    let states  = [ "(AK) Alaska", "(AL) Alabama", "(AR) Arkansas", "(AS) American Samoa", "(AZ) Arizona", "(CA) California", "(CO) Colorado", "(CT) Connecticut", "(DC) District of Columbia", "(DE) Delaware", "(FL) Florida", "(GA) Georgia", "(GU) Guam", "(HI) Hawaii", "(IA) Iowa", "(ID) Idaho", "(IL) Illinois", "(IN) Indiana", "(KS) Kansas", "(KY) Kentucky", "(LA) Louisiana", "(MA) Massachusetts", "(MD) Maryland", "(ME) Maine", "(MI) Michigan", "(MN) Minnesota", "(MO) Missouri", "(MS) Mississippi", "(MT) Montana", "(NC) North Carolina", "(ND) North Dakota", "(NE) Nebraska", "(NH) New Hampshire", "(NJ) New Jersey", "(NM) New Mexico", "(NV) Nevada", "(NY) New York", "(OH) Ohio", "(OK) Oklahoma", "(OR) Oregon", "(PA) Pennsylvania", "(PR) Puerto Rico", "(RI) Rhode Island", "(SC) South Carolina", "(SD) South Dakota", "(TN) Tennessee", "(TX) Texas", "(UT) Utah", "(VA) Virginia", "(VI) Virgin Islands", "(VT) Vermont", "(WA) Washington", "(WI) Wisconsin", "(WV) West Virginia", "(WY) Wyoming" ]
    var body: some View {
        VStack {
            //3. Create the Picker by binding it to the State and providing it with a label
            Picker(selection: $selection, label: Text("MyPicker")) {
                //4. Create on row for every String in your array and assign it to a index
                ForEach(0 ..< states.count, id: \.self) { index in
                    Text(self.states[index]).tag(index)
                }
            }
            Text("Selected color: \(states[selection])")
                .padding(.bottom, 70)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
