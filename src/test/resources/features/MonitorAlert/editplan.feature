@v32tc @editalerts
Feature: 监控

  @editalerts
  Scenario Outline:
    Given open the "alert.ListPage" page for uri "/alerts/"
    When I set the parameter "AlertListSearchInput" with value "<name>"
    And I click the "AlertListEditButton" button
    And I wait for "ConfirmDelAlertButton" will be visible

    Examples:
      | name |
      |	api00_字段统计_切分ip_最大数status_扩展chart键值_all_合并	|
      |	合并2组_高_事件_分组条件alertid_name包含停止或连续6小时	|
      |	合并1组_低_连续统计_无分组_未收到新告警的时间1小时	|
      |	合并2组_高中_SPL统计_分组条件priority_最后一条告警字段priority低或5小时	|
      |	合并1组_中低_基线_分组条件eventtype_连续不断发送6小时_自动规则	|

