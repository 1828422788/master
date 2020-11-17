@v32tc @clean @cleanalert
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