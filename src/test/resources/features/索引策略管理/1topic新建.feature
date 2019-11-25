@indexSetting
Feature: topic新建（RZY-2430）

  Background:
    Given open the "index.TopicSetting" page for uri "/indexsettings/topicsettings/"

  Scenario Outline:
    When I click the "CreateButton" button
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Describe" with value "<describe>"
    And I click the "EnsureButton" button
    Then I will see the <message>

  @second @indexSettingSmoke
    Examples:
      | name      | describe | message                |
      | topictest | 自动化测试    | success message "创建成功" |

    Examples:
      | name                      | describe | message                                      |
      |                           |          | error message "名称不能为空"                       |
      | topictest                 |          | error message "创建失败: Topic名称不能重复！"           |
      | _AutoTest                 |          | error message "TopicInfo名称不符合规则"             |
      | ~!@#@!#                   |          | error message "Topic名只能由数字，字母和下划线组成，且长度小于25" |
      | 我有二十五个字符用来校验名称长度是否可以超过二十五 |          | error message "Topic名只能由数字，字母和下划线组成，且长度小于25" |