@all @indexSetting
Feature: 入库优先级新建

  Background:
    Given open the "ingestPriority.ListPage" page for uri "/ingestpriority/"
    And I click the "CreateButton" button
    Then I will see the "ingestPriority.CreatePage" page

  Scenario Outline:
    When I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<tag>"
    And I choose the "<priority>" from the "Priority"
    And I click the "SaveButton" button
    Then I will see the <message>

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


