//
//  ContentView.swift
//  midtermProject
//
//  Created by Josh Block on 10/22/22.
//

import SwiftUI

import UIKit

struct USState: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var rank: Int
    var pop: Int
    var pop2018: Int
    var pop2010: Int
    var density: Double
}

class USStates: Identifiable {
    static var list: [USState] = {
        var states: [USState] = []
        for entry in entries {
            let state = USState(name: entry["state"] as! String, rank: entry["rank"] as! Int, pop: entry["pop"] as! Int, pop2018: entry["pop2018"] as! Int, pop2010: entry["pop2010"] as! Int, density: entry["density"] as! Double)
            states.append(state)
        }
        return states
    }()
    static let entries = [["rank":1, "state":"California", "pop":39613493, "pop2018":39461588, "pop2010":37319502,"density":254.2929],["rank":2, "state":"Texas", "pop":29730311, "pop2018":28628666, "pop2010":25241971,"density":113.8081],["rank":3, "state":"Florida", "pop":21944577, "pop2018":21244317, "pop2010":18845537,"density":409.2229],["rank":4, "state":"New York", "pop":19299981, "pop2018":19530351, "pop2010":19399878,"density":409.54],["rank":5, "state":"Pennsylvania", "pop":12804123, "pop2018":12800922, "pop2010":12711160,"density":286.1704],["rank":6, "state":"Illinois", "pop":12569321, "pop2018":12723071, "pop2010":12840503,"density":226.3967],["rank":7, "state":"Ohio", "pop":11714618, "pop2018":11676341, "pop2010":11539336,"density":286.6944],["rank":8, "state":"Georgia", "pop":10830007, "pop2018":10511131, "pop2010":9711881,"density":188.3054],["rank":9, "state":"North Carolina", "pop":10701022, "pop2018":10381615, "pop2010":9574323,"density":220.1041],["rank":10, "state":"Michigan", "pop":9992427, "pop2018":9984072, "pop2010":9877510,"density":176.7351],["rank":11, "state":"New Jersey", "pop":8874520, "pop2018":8886025, "pop2010":8799446,"density":1206.7609],["rank":12, "state":"Virginia", "pop":8603985, "pop2018":8501286, "pop2010":8023699,"density":217.8776],["rank":13, "state":"Washington", "pop":7796941, "pop2018":7523869, "pop2010":6742830,"density":117.3249],["rank":14, "state":"Arizona", "pop":7520103, "pop2018":7158024, "pop2010":6407172,"density":66.2016],["rank":15, "state":"Tennessee", "pop":6944260, "pop2018":6771631, "pop2010":6355311,"density":168.4069],["rank":16, "state":"Massachusetts", "pop":6912239, "pop2018":6882635, "pop2010":6566307,"density":886.1845],["rank":17, "state":"Indiana", "pop":6805663, "pop2018":6695497, "pop2010":6490432,"density":189.9644],["rank":18, "state":"Missouri", "pop":6169038, "pop2018":6121623, "pop2010":5995974,"density":89.7419],["rank":19, "state":"Maryland", "pop":6065436, "pop2018":6035802, "pop2010":5788645,"density":624.8518],["rank":20, "state":"Colorado", "pop":5893634, "pop2018":5691287, "pop2010":5047349,"density":56.8653],["rank":21, "state":"Wisconsin", "pop":5852490, "pop2018":5807406, "pop2010":5690475,"density":108.0633],["rank":22, "state":"Minnesota", "pop":5706398, "pop2018":5606249, "pop2010":5310828,"density":71.6641],["rank":23, "state":"South Carolina", "pop":5277830, "pop2018":5084156, "pop2010":4635649,"density":175.5707],["rank":24, "state":"Alabama", "pop":4934193, "pop2018":4887681, "pop2010":4785437,"density":97.4271],["rank":25, "state":"Louisiana", "pop":4627002, "pop2018":4659690, "pop2010":4544532,"density":107.0966],["rank":26, "state":"Kentucky", "pop":4480713, "pop2018":4461153, "pop2010":4348181,"density":113.476],["rank":27, "state":"Oregon", "pop":4289439, "pop2018":4181886, "pop2010":3837491,"density":44.6872],["rank":28, "state":"Oklahoma", "pop":3990443, "pop2018":3940235, "pop2010":3759944,"density":58.174],["rank":29, "state":"Connecticut", "pop":3552821, "pop2018":3571520, "pop2010":3579114,"density":733.7507],["rank":30, "state":"Utah", "pop":3310774, "pop2018":3153550, "pop2010":2775332,"density":40.2918],["rank":31, "state":"Puerto Rico", "pop":3194374, "pop2018":3193354, "pop2010":3721525,"density":923.4964],["rank":32, "state":"Nevada", "pop":3185786, "pop2018":3027341, "pop2010":2702405,"density":29.0195],["rank":33, "state":"Iowa", "pop":3167974, "pop2018":3148618, "pop2010":3050745,"density":56.7158],["rank":34, "state":"Arkansas", "pop":3033946, "pop2018":3009733, "pop2010":2921964,"density":58.3059],["rank":35, "state":"Mississippi", "pop":2966407, "pop2018":2981020, "pop2010":2970548,"density":63.2186],["rank":36, "state":"Kansas", "pop":2917224, "pop2018":2911359, "pop2010":2858190,"density":35.6808],["rank":37, "state":"New Mexico", "pop":2105005, "pop2018":2092741, "pop2010":2064552,"density":17.354],["rank":38, "state":"Nebraska", "pop":1951996, "pop2018":1925614, "pop2010":1829542,"density":25.4087],["rank":39, "state":"Idaho", "pop":1860123, "pop2018":1750536, "pop2010":1570746,"density":22.5079],["rank":40, "state":"West Virginia", "pop":1767859, "pop2018":1804291, "pop2010":1854239,"density":73.5443],["rank":41, "state":"Hawaii", "pop":1406430, "pop2018":1420593, "pop2010":1363963,"density":218.9678],["rank":42, "state":"New Hampshire", "pop":1372203, "pop2018":1353465, "pop2010":1316762,"density":153.2674],["rank":43, "state":"Maine", "pop":1354522, "pop2018":1339057, "pop2010":1327629,"density":43.9167],["rank":44, "state":"Montana", "pop":1085004, "pop2018":1060665, "pop2010":990697,"density":7.4547],["rank":45, "state":"Rhode Island", "pop":1061509, "pop2018":1058287, "pop2010":1053959,"density":1026.6044],["rank":46, "state":"Delaware", "pop":990334, "pop2018":965479, "pop2010":899593,"density":508.1242],["rank":47, "state":"South Dakota", "pop":896581, "pop2018":878698, "pop2010":816166,"density":11.8265],["rank":48, "state":"North Dakota", "pop":770026, "pop2018":758080, "pop2010":674715,"density":11.1596],["rank":49, "state":"Alaska", "pop":724357, "pop2018":735139, "pop2010":713910,"density":1.2694],["rank":50, "state":"District of Columbia", "pop":714153, "pop2018":701547, "pop2010":605226,"density":11707.4262],["rank":51, "state":"Vermont", "pop":623251, "pop2018":624358, "pop2010":625879,"density":67.6197],["rank":52, "state":"Wyoming", "pop":581075, "pop2018":577601, "pop2010":564487,"density":5.9847]]
}

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
