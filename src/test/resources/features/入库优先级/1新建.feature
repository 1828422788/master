@all @indexSetting
Feature: 入库优先级新建（RZY-1485）

  Background:
    Given open the "ingestPriority.ListPage" page for uri "/ingestpriority/"
    And I click the "CreateButton" button
    Then I will see the "ingestPriority.CreatePage" page

  Scenario Outline: 入库优先级新建
    When I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<tag>"
    And I choose the "<priority>" from the "Priority"
    And I click the "SaveButton" button
    Then I will see the <message>
    And I click the "EnsureButton" button
    And I refresh the website
    Then I will see the search result contains "{'column':'0','name':'<appName>'}"

  @smoke @indexSettingSmoke
    Examples: 保存成功
      | appName              | tag             | priority | message                |
      | AutoTestWithNothing  |                 |          | success message "保存成功" |
      | AutoTestWithTag      | top_info_s      |          | success message "保存成功" |
      | AutoTestHighPriority | top_info_s,heka | 高        | success message "保存成功" |

    Examples: 保存失败
      | appName  | tag | priority | message                                       |
      |          |     |          | error message "appname 不能为空"                  |
      | test     | *   |          | error message "请输入正确的tag"                     |
      | autotest |     |          | error message "保存失败: 已存在相同入库优先级\n错误码: FE_138" |