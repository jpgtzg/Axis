# Axis Scouting System

An advanced scouting system for the FIRST Robotics Competition.

## Overview

The Axis Scouting System is designed to assist teams in the FIRST Robotics Competition (FRC) by gathering and analyzing data to improve scouting efficiency. The system utilizes information retrieved from The Blue Alliance, Statbotics, and user-submitted data to create a comprehensive scouting solution through the Axis system.

## Features

- Integration with The Blue Alliance and Statbotics APIs to retrieve match and team statistics.
- User-friendly interface for entering and managing custom scouting data.
- Detailed analysis of team performance to assist in match strategy and alliance selection.
- Dashboard creation platform for all needs!
- Premade statistical tools that can be flexibly customized
  
## Workings

The Axis system pulls relevant data from multiple sources, such as:
- **The Blue Alliance (TBA):** Match schedules, team rankings, and event results.
- **Statbotics:** Historical performance and team statistics.
- **User Data:** Customized scouting reports and performance observations.

This data is then processed to provide insightful reports and metrics for more effective scouting during FRC competitions.

## Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/jpgtzg/Axis.git
    ```

2. Install Flutter:
    - Follow the official [Flutter installation guide](https://flutter.dev/docs/get-started/install) for your operating system.

3. Set up dependencies:
    ```bash
    flutter pub get
    ```

4. Configure API keys for The Blue Alliance and Statbotics in the `system/tba/system_constants` file:
    ```Dart
      String authKey = 'auth';
      
      String baseTBAURL = 'https://www.thebluealliance.com/api/v3';
      
      String authURL = '?X-TBA-Auth-Key=$authKey';
      
      String teamNum = '1234';
      
      String baseSTABURL = 'https://www.statbotics.io/api/v1';
      
      String appID = 'app_id';

    ```

5. Run the application:
    ```bash
    flutter run
    ```

## Usage

1. Retrieve match schedules and team rankings from The Blue Alliance.
2. Pull historical statistics from Statbotics.
3. Enter scouting data via the system's user interface.
4. Generate insightful reports to guide your match strategy and alliance decisions.
5. Generate dashboards on the go to suit your needs! 

## Contributing

Contributions are welcome! Please fork this repository and submit a pull request.

## License

This project is licensed under the MIT License.
