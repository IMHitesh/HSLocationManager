# HSLocationManager

*Note: Main advantage of thid framework is app never kill by system untill your location tracking is stopped.*

Location manager that allows to get background location updates every n seconds with desired location accuracy.

n - range is between 2 - 170 seconds (limited by max allowed background task time)

Default time to retrive location is 30 sec and accuracy is 200. 

    //Constant
    static let timeInternal = 30
    static let accuracy = 200

# Usage
1. Configure Xcode project

In target Capabilities enable Background Modes and check Location updates

In Info.plist add 

  Privacy - Location Always and When In Use Usage Description

  Privacy - Location Always Usage Description

  Privacy - Location When In Use Usage Description

key and value that will specify the reason for your app to access the user’s location information at all times.


Now, Add location folder into your project.

# Start Location tracking:

    HSLocationTracking.shared().stopLocationTracking()
    
    
    
# Start Location tracking:

    HSLocationTracking.shared().startLocationTracking()
    
    
# Other:    
You can able to see location log by using 

    HSLogger.logger.exportLogFile()
    
    
    Example

# See an example app HSLocationManager in the repository

Note, if you test on a stimulater edit scheme and set default location.
