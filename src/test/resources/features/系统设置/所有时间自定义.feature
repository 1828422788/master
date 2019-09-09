@setting @settingSmoke
Feature: 系统设置所有时间定义（RZY-1818）

  Background:
    Given open the "system.CustomConfigs" page for uri "/system/custom/configs/"

  Scenario Outline: 保存失败
    When I set the parameter "WholeTime" with value "<wholeTime>"
    And I let element "WholeTime" lose focus
    Then I will see the success message "所有时间输入格式不合法，请参照备注中的提示格式重新输入"

    Examples:
      | wholeTime                                           |
      | -1m,now                                             |
      | -1h,now                                             |
      | now/d,now                                           |
      | -1d/d,now                                           |
      | -1d/d,now/d                                         |
      | now/w,now                                           |
      | -1w/w,now/w                                         |
      | now/M,now                                           |
      | -1M/M,now/M                                         |
      | starttime="-2d/w" endtime="now" tag:sample04061424  |
      | starttime="-5d/w" endtime="now" tag:sample04061424  |
      | starttime="-6d/w" endtime="now" tag:sample04061424  |
      | starttime="-26d/w" endtime="now" tag:sample04061424 |
      | starttime="-15h/d" endtime="now" tag:sample04061424 |
      | starttime="-15h/h" endtime="now"                    |
      | now/d                                               |

  @smoke @configsSmoke
  Scenario Outline: 保存成功
    When I set the parameter "WholeTime" with value "<wholeTime>"
    And I let element "WholeTime" lose focus
    Then I will see the success message "所有时间定义保存成功"
    And open the "splSearch.SearchPage" page for uri "/search/"
    And I click the "DateEditor" button
    And I click the "WholeTime" button
    And I click the "SearchButton" button
    Then I will see the input element "DateEditor" value will be "<wholeTime>"

    Examples:
      | wholeTime  |
      | -1d,now    |
      | -1000d,+1d |
