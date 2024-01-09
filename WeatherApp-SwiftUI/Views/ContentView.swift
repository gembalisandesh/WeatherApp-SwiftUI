import SwiftUI
import CoreLocation

struct ContentView: View {

    @ObservedObject var cityVM = WeatherViewModel()
    @ObservedObject var locationManager = LocationManager.shared
    @State private var isLoading = true

    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                HeaderView(cityVM: cityVM)
                    .padding()

                ScrollView(showsIndicators: false) {
                    CityStatusView(cityVM: cityVM)
                }
                .padding(.top, 10)
            }
            .padding(.top, 40)

            if isLoading {
                LoadingView()
            }
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)), Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))]), startPoint: .topLeading, endPoint: .topTrailing))
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            // Simulate data loading (replace with your actual data fetching logic)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                isLoading = false
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
