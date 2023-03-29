# Cocktail Swift

This app was created in a learning purpose. I love cocktails and Ricardo... it was the perfect mix! But then I decided to add more sections in order to explore other Swift usefull views. It became a cocktail of features. Built using XCode 14.0 (Swift 5.7). The layout was done using both autoLayout and Pinlayout. OpenWeather api was used to display current weather in various locations.

## Swift component explored

* List and grid creation with UITableView, UICollectionView and UICollectionViewFlowLayout
* Saving user data with UserDefaults
* Notify user UIAlertController
* Map management with PinAnnotationView and MKMarkerAnnotationView, Geocoder
* Form creation with UITextField, UIPickerView, UISegmentedControl, UISwitch, UIStackView, UIStepper


## Screenshots

**Main page**

!["Screenshot of the main page"](https://github.com/amchampoux/scheduler/blob/master/docs/home.png)

**Booking an inteview**

!["Screenshot of booking state"](https://github.com/amchampoux/scheduler/blob/master/docs/book_interview.png)

**Deleting an inteview**

!["Screenshot of booking state"](https://github.com/amchampoux/scheduler/blob/master/docs/delete_interview.gif)

## Setup

For full functionality, the client and the API server applications must run concurrently: 

* Start by forking and cloning the scheduler-api server [here](https://github.com/lighthouse-labs/scheduler-api).
* Follow the steps outlined in README to install and setup the database.
* Fork and clone this repo.
* Navigate to the root directory and install dependencies with `npm install`.
* Run the following command from the root directory of the project `npm start`.

## Dependencies

* Swift 5.7
* PinLayout 1.10.3
* UIKit
* MapKit

