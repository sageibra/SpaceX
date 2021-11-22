# SpaceX
> __Приложение для просмотра информации о запусках компанией SpaceX.__

- __Источник данных: https://api.spacexdata.com/v4/__
- [__Черновик карты экранов__](https://www.figma.com/file/1a2vAlwt8glYnxUDIQ89mj/Untitled?node-id=0%3A1)
> Архитектура проекта Surf MVP - [link](https://github.com/surfstudio/Surf-iOS-Developers/blob/master/architectures/Surf_MVP.md)

> CoreData для кэширования данных

> UserDefaults для сохранения настроеек

> URLSession для работы с сетью

> Generamba для генерации файлов [link](https://github.com/strongself/Generamba)

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
