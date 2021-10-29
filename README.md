# SpaceX
> Приложение для просмотра информации о запусках компанией SpaceX.
- __Источник данных: https://api.spacexdata.com/v3/__
- [__Черновик карты экранов__](https://www.figma.com/file/B6q1uejE5bSYggQZdrAThg/SpaceX?node-id=0%3A11)
> Архитектура проекта MVP

#### **Модели данных:**

| Rocket |  |
| ------ | ------ |
| active | Bool |
| costPerLaunch | Int |
| successRatePct | Int |
| country | String |
| company | String |
| flickrImages | [String] |
| wikipedia | String |
| rocketDescription | String |
| rocketName | String |
| rocketType | String |

| Launch |  | 
| ------ | ------ |
| missionName | String |
| launchDateUnix | Date |
| rocket | RocketInfo |
| launchSite | LaunchSite |
| launchSuccess | Bool? |
| links | Link |
| details | String |
| flightNumber | Int |

| LaunchSite |  |
| ------ | ------ |
| siteNameLong | String |

| Link |  |
| ------ | ------ |
| missionPatch | String? |
| articleLink | String? |
| videoLink | String? |

| RocketInfo |  |
| ------ | ------ |
| rocketName | String |
| rocketType | String |
