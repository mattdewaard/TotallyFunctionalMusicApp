
# TotallyFunctioningMusicApp

This repository contains source code for a music playing application, similar to Spotify or Apple Music apps. It 100% works.
The project is written using clean architecture with business logic separated into separate packages and accessed primarily through Facades.
The project also uses a generic persentation layer to facilitate accessible fonts and colors for different color schemes.

## Prerequisites

Before running the app, ensure you have the following installed:
- Xcode 15 or later
- A device running iOS 17.0 or later

## Installation

1. **Open TotallyFunctionalMusicApp.xcworkspace:**
    This contains all the relevant packages in a single workspace.
    
2. **Select MusicApp target:**
    Select MusicApp as your active scheme in xcode, select the device you wish to run
    
3. **Run the application**
    The app has no required dependencies so can be run after the following steps.
    
## Assumptions

1. Data layer:
    All persisted information is stored using UserDefaults. In a real world scenario, this would utilize a more robust and performant storage method, such as SQLite or CoreData.
    
2. Asynchronous behaviour:
    As data is loaded from a JSON file, it is not required to be stored locally or accessed in a proper asynchronous fashion (for example, APIs and local storage). The business layer is required to be interacted with in an asynchronous fashion, however due to the high performance of the JSON decoding in memory there is no asynchronous support within the view layer (e.g. loading spinners etc)
    
3. Testing:
    In a proper application we would have robust unit testing where available but this was not listed in the requirements.


## Where to from here

- Support for skipping tracks.
- Creating playlists / Viewing favourites.
- View full library of artists, albums and tracks.
