@v32tc @clean @cleanalerts
Feature: 监控删除

  @delalerts
  Scenario Outline: 删除所有监控
    Given open the "alert.ListPage" page for uri "/alerts/"
    When I set the parameter "AlertListSearchInput" with value "<name>"
    And I click the "AlertListDeleteButton" button
    And I wait for "ConfirmDelAlertButton" will be visible
    And I click the "ConfirmDelAlertButton" button

    Examples:
      | name |
      |api_高基_事件_切分_扩展chart_键值4__抑制30_all|
      |ctest域_api_nodataset_事件计数_设备切分_扩展chart_all抑制45|
      |【字段统计告警】【总计】-apache.resp_len|
      |api_连续统计_高基_status<=404_键值4_邮件|
      |api_连续统计_status=200_邮件|
      |ctest_事件计数_高_推送2转发|
      |api_nods_事件数_sample_推送rsyslog|
      |孔飞力_ctest_nods_事件计数_高_推送邮件|
      |api_基线_len_24hours大于100_邮件|
      |api_基线_status_在区间内_邮件|
      |山杉正明_ctest_nods_事件计数_高_推送邮件|
      |api_连续统计_status=200_扩展chart_邮件|
      |【字段统计告警】【平均数】apache.resp_len|
      |ctest_事件计数_高_推送ping主机|
      |api_基线_len_24hour小于100_邮件|
      |ctest域合并策略_api_nodataset_事件数_扩展chart_rsyslog|
      |ctest域合并策略_api_nodset_字段统计_独立数status_rsyslog|
      |api_nodset_字段统计_独立数status_rsyslog|
      |ctest_nodataset_事件计数_高_推送2转发|
      |ctest_nodataset_事件计数_高_推送ping主机|
      |test_事件计数_高_域值不对|
      |api_连续统计_status>=200_邮件|
      |test_nodataset_事件计数_高_推送all|
      |api_nodataset_事件数_扩展chart_all|
      |api_连续统计_status<404_推送邮件|
      |api_ds200_spl统计bucket_扩展bucket_抑制_转发rsyslogping|
      |api_高基_spl统计count_高_扩展chart_all_抑制30分钟|
      |【字段统计告警】【最小数】apache.status|
      |api_nodataset_事件计数_高_推送2邮件|
      |api_nodset_维护期永久_字段统计_独立数status_设备切分clientip_邮件rsyslog|
      |RZY-2979:新建监控-基本配置-执行计划-crontab-每天14:00到14:05|
      |RZY-2980:新建监控-基本配置-执行计划-crontab-周一到周五下午14：00~14：45之间|
      |RZY-438:扩展timechart_插图启用禁用_邮件抑制2小时|
      |api_ds200_字段统计_最大数status_扩展chart键值_all_抑制|
      |api_基线_status_在区间外_邮件|
      |运行用户sample_test_nodataset_事件计数_高_推送rsyslog|
      |ctest域_api_nodataset_事件计数_设备切分_扩展chart_all抑制45|
      |api_事件_切分_扩展chart_键值4_all_抑制30|
      |【字段统计告警】【总计】-apache.resp_len|
      |api_连续统计_高基_status<=404_键值4_邮件|
      |api_连续统计_status=200_邮件|
      |ctest_事件计数_高_推送2转发|
      |孔飞力_ctest_nods_事件计数_高_推送邮件|
      |山杉正明_ctest_nods_事件计数_高_推送邮件|
      |【字段统计告警】【平均数】apache.resp_len|
      |ctest_事件计数_高_推送ping主机|
      |ctest_nodataset_事件计数_高_推送2转发|
      |ctest_nodataset_事件计数_高_推送ping主机|
      |test_事件计数_高_域值不对|
      |test_nodataset_事件计数_高_推送all|
      |【字段统计告警】【最小数】apache.status|
      |RZY-2979:新建监控-基本配置-执行计划-crontab-每天14:00到14:05|
      |RZY-2980:新建监控-基本配置-执行计划-crontab-周一到周五下午14：00~14：45之间|
      |RZY-438:扩展timechart_插图启用禁用_邮件抑制2小时|
      |【字段统计告警】【总计】-apache.resp_len|
      |ctest_事件计数_高_推送2转发|
      |孔飞力_ctest_nods_事件计数_高_推送邮件|
      |山杉正明_ctest_nods_事件计数_高_推送邮件|
      |【字段统计告警】【平均数】apache.resp_len|
      |ctest_事件计数_高_推送ping主机|
      |ctest_nodataset_事件计数_高_推送2转发|
      |ctest_nodataset_事件计数_高_推送ping主机|
      |test_事件计数_高_域值不对|
      |test_nodataset_事件计数_高_推送all|
      |【字段统计告警】【最小数】apache.status|
      |RZY-2979:新建监控-基本配置-执行计划-crontab-每天14:00到14:05|
      |AutoTestAuth(副本)(副本)(副本)|
      |AutoTestAppAlertChangeName(副本)|
      |gc_test|
      |AutoTestAppAlertChangeName(副本)|
      |AutoTestAppAlertChangeName(副本)|
      |zhou.feng_test|
      |劳铭煦_告警测试|
      |zzz_test|
      |tanzixiong_test|
      |cisco_nexus设备路由协议告警(1)|
      |cisco_nexus接收到错误的BPDU错误包，状态有误(1)|
      |cisco_nexus回环错误(1)|
      |cisco_nexus电力不足，无法为端口供电(1)|
      |cisco_nexus没有响应而自动重启(1)|
      |cisco_nexus连接了指定设备而被关闭，请根据用户需要开启该端口 (1)|
      |cisco_nexus有DHCP地址冲突(1)|
      |cisco_nexus设备mac地址飘移(1)|
      |cisco_nexus骨干交换机状态异常(1)|
      |cisco_nexus对端连接状态改变(1)|
      |cisco_nexus登录失败(1)|
      |cisco_nexus电源供电异常(1)|
      |cisco_nexus引擎内存校验错误(1)|
      |cisco_nexus邻居关系中断(1)|
      |cisco_nexus端口协议中断(1)|
      |cisco_nexus设备vrrp故障(1)|
      |cisco_nexus_mac_table达到阈值|
      |cisco_nexus设备ip漂移(1)|
      |cisco_nexus设备双机切换(1)|
      |cisco_nexus网关重启(1)|
      |cisco_nexus违反安全规则(1)|
      |cisco_nexus端口的trunk连接恢复正常(1)|
      |cisco_nexus系统重启(1)|
      |cisco_nexus设备端口告警(1)|
      |cisco_nexus接收到一个长度不符合要求的IP包，被丢弃(1)|
      |cisco_nexus端口加入(1)|
      |cisco_nexus插入mac_table失败|
      |cisco_nexus端口的trunk链接中断(1)|
      |cisco_nexus双工模式配置不匹配(1)|
      |cisco_nexus端口两端NATIVE VLAN配置不匹配(1)|
      |cisco_nexus_Failed to insert MAC|
      |cisco_nexus网关异常(1)|
      |cisco_nexus端口离开(1)|
      |cisco_nexus设备IP冲突告警(1)|
      |cisco_nexus设备路由协议告警(1)|
      |cisco_nexus接收到错误的BPDU错误包，状态有误(1)|
      |cisco_nexus回环错误(1)|
      |cisco_nexus电力不足，无法为端口供电(1)|
      |cisco_nexus没有响应而自动重启(1)|
      |cisco_nexus连接了指定设备而被关闭，请根据用户需要开启该端口 (1)|
      |cisco_nexus有DHCP地址冲突(1)|
      |cisco_nexus设备mac地址飘移(1)|
      |cisco_nexus骨干交换机状态异常(1)|
      |cisco_nexus对端连接状态改变(1)|
      |cisco_nexus登录失败(1)|
      |cisco_nexus电源供电异常(1)|
      |cisco_nexus引擎内存校验错误(1)|
      |cisco_nexus邻居关系中断(1)|
      |cisco_nexus端口协议中断(1)|
      |cisco_nexus设备vrrp故障(1)|
      |cisco_nexus_mac_table达到阈值|
      |cisco_nexus设备ip漂移(1)|
      |cisco_nexus设备双机切换(1)|
      |cisco_nexus网关重启(1)|
      |cisco_nexus违反安全规则(1)|
      |cisco_nexus端口的trunk连接恢复正常(1)|
      |cisco_nexus系统重启(1)|
      |cisco_nexus设备端口告警(1)|
      |cisco_nexus接收到一个长度不符合要求的IP包，被丢弃(1)|
      |cisco_nexus端口加入(1)|
      |cisco_nexus插入mac_table失败|
      |cisco_nexus端口的trunk链接中断(1)|
      |cisco_nexus双工模式配置不匹配(1)|
      |cisco_nexus端口两端NATIVE VLAN配置不匹配(1)|
      |cisco_nexus_Failed to insert MAC|
      |cisco_nexus网关异常(1)|
      |cisco_nexus端口离开(1)|
      |cisco_nexus设备IP冲突告警(1)|
      |{{ alert.description }}|
      |RDP暴力破解|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|
      |	_	|


  @delalertbyname
  Scenario Outline: 按名字删除监控
    Given open the "alert.ListPage" page for uri "/alerts/"
    When I set the parameter "AlertListSearchInput" with value "<name>"
    And I click the "AlertListSearchIcon" button
    And I wait for "AlertListDeleteButton" will be visible
    And I click the "AlertListDeleteButton" button
    And I wait for "ConfirmDelAlertButton" will be visible
    And I click the "ConfirmDelAlertButton" button

    Examples:
    | name |
    |	api_nods_事件数_20秒_转发	|
    |	api_运行用户sample_nods_事件数_推送rsyslog	|
    |	api_nods_事件数_10秒_推送ping主机	|
    |	api_guest_ds200_事件数_邮件	|
    |	api_all_字段统计_平均数resplen_邮件	|
    |	api_all_字段统计_平均数resplen_邮件	|
    |	api_all_字段统计_平均数resplen_邮件	|
    |	api_合并策略_nods_字段统计_独立数status_rsyslog	|