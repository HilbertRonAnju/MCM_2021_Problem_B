# 2021年美赛B题O奖

时隔一年，终于忙完了毕设和保研的事，终于有时间对2021年美赛O奖做一次整理和总结，同时开源当时的代码分享出来。有幸获得特等奖O奖，也感谢队友四天的付出，对我而言这也是一段弥足珍贵的记忆。

![image.png](https://s2.loli.net/2022/06/04/be8hnPYyo495wgJ.png)

## 摘要

Due to the drought of southeast Australia, forest fires burn across the country, impacting New South Wales and eastern Victoria. To help the Victorian government respond to future wildfire disasters, we established the ‘Rapid Bushfire Response’ system and evaluate drone arrangements with three mod-els.

For model 1, to address irregular fire regions and diverse SSA drone detection patterns, we used regional discretization method, turning fire data and multi-drone cooperation in to constraint equa-tions. We then divide the information in discreated area into different layers. The drone layer and information layer indicate an SSA drone’s search mode and search zone. The flame layer represents the severity of wildfire, which could be obtained from model 2. Finally, balancing information de-tection revenue and SSA drone numbers while considering constrains on EOC position, we opti-mized the SSA drone search pattern and EOC position.

For model 2, we discussed the changes in fire under global warming circumstances. We first formed a two-level function that maps temperature to ignition probability, and ignition probability to burned area size. To obtain ignition probability and burned area size correlations, we used cellular autom-ata model to simulate ignition probability’s effect on burned area and fitted their relation. We then estimated the temperature change due to climate factors consulting further studies, and assessed the ignition probability of this year and the next decade. Finally, we simulated average fire scenes and estimated their fire severity.

For model 3, We first evaluated the influence of terrain on communication, and measures a regions’ communication shielding effect with the terrain’s second gradient. Then we optimized the number and location of radio repeater drones referring to the position of SSA drones obtained in model 1. We further considered the continuity of communication and calculated the final radio repeater drone numbers under shifting conditions.

Based on the above three models, we estimated that 10 SSA drones and 2 radio repeater drones is required to build the ‘Rapid Bushfire Response’ system. For next decade, the cost of imaging cam-eras and telemetry sensors (for SSA drones) will increase. We also suggest that fire zone area plays a major role influence on drone arrangements and the topographical condition has little influence.

## 关键词
Drone, Optimization, Regional Discretization, Fire Dynamic Models, Cellular Automata 




