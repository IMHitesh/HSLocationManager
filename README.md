# HSLocationManager

Location manager that allows to get background location updates every n seconds with desired location accuracy.

**Advantage:**

 - OS will never kill our app if the location manager is currently running.

 - Give periodically location update when it required(range is between 2 - 170 seconds (limited by max allowed background task time))

 - Customizable location accuracy and time period.

 - Low memory consumption(Singleton class)


Default time to retrive location is 30 sec and accuracy is 200. 

    static let timeInternal = 30
    static let accuracy = 200

# Usage
Configure Xcode project

 - In target Capabilities enable Background Modes and check Location updates

 - In Info.plist add 

    Privacy - Location Always and When In Use Usage Description

    Privacy - Location Always Usage Description

    Privacy - Location When In Use Usage Description

 - key and value that will specify the reason for your app to access the user’s location information at all times.


Now, Add location folder into your project.

# Start Location tracking:

    HSLocationTracking.shared().stopLocationTracking()
    
    
    
# Start Location tracking:

    HSLocationTracking.shared().startLocationTracking()
    
**This method is called in every 30 sec if location is available with specified accuracy(static let timeInternal = 30)**

    func scheduledLocationManager(_ manager: APScheduledLocationManager, didUpdateLocations locations: [CLLocation]) {

    }

# Other:    
You can able to see location log by using 

    HSLogger.logger.exportLogFile()
    
# See an example app HSLocationManager in the repository

Note, if you test on a stimulater edit scheme and set default location.


# Raise issue if you are found or ask your queries or concern anytime:

Stack overflow: https://stackoverflow.com/users/5036586/imhitesh-surani

LinkedIn: https://www.linkedin.com/in/hiteshsurani/

Email: hiteshsurani314@gmail.com
