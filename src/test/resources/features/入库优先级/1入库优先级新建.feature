@priority @indexSetting
Feature: 入库优先级新建（RZY-1485）

  Background:
    Given open the "ingestPriority.ListPage" page for uri "/ingestpriority/"
    And I click the "CreateButton" button
    Then I will see the "ingestPriority.CreatePage" page

  @indexSettingSmoke
  Scenario Outline: 入库优先级新建成功
    And I set the parameter "Tag" with value "<tag>"
    When I set the parameter "AppName" with value "<appName>"
    And I choose the "<priority>" from the "Priority"
    And I click the "SaveButton" button
    Then I will see the <message>
    And I click the "Ensure" button
    And I refresh the website
    And I wait for loading invisible
    Then I will see the search result contains "{'column':'0','name':'<appName>'}"

    Examples: 保存成功
      | appName                | tag             | priority | message                |
      | ln_low_priority         |                | 低       | success message "保存成功" |
      | ln_mid_priority        | top_info_s      | 中       | success message "保存成功" |
      | ln_high_priority        | top_info_s,heka| 高       | success message "保存成功" |
      | Autotest                |  autotest*     |          |    success message "保存成功"  |

  Scenario Outline: 入库优先级新建失败
    And I set the parameter "Tag" with value "<tag>"
    When I set the parameter "AppName" with value "<appName>"
    And I choose the "<priority>" from the "Priority"
    And I click the "SaveButton" button
    And I wait for element "Helpmessage" change text to "<Helpmessage>"
#    And I will see the element "Helpmessage" name is "<Helpmessage>"
    Examples: 保存失败
      | appName  | tag | priority | Helpmessage               |
      |          |     |          | appname不能为空            |
      | test     | *   |          | 请输入正确的tag            |
      | ln_中文  |      |          | appname只能由数字,字母和下划线组成, 长度小于255 |
      | ln%^&    |     |           | appname只能由数字,字母和下划线组成, 长度小于255 |

  Scenario Outline: 入库优先级新建_重复新建
    And I set the parameter "Tag" with value "<tag>"
    When I set the parameter "AppName" with value "<appName>"
    And I choose the "<priority>" from the "Priority"
    And I click the "SaveButton" button
    Then I will see the <message>
    And I click the "Ensure" button

    Examples: 保存失败
      | appName  | tag | priority | message    |
      | Autotest |     |    高      | success message "API: 保存失败: 已经存在相同的入库优先级" |
      | Autotest |     |    低      | success message "API: 保存失败: 已经存在相同的入库优先级" |
      | Autotest |     |    中      | success message "API: 保存失败: 已经存在相同的入库优先级" |
      | Autotest               |   test              |    高      | success message "API: 保存失败: 已经存在相同的入库优先级" |



