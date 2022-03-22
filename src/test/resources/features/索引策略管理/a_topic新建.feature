@indexSetting
Feature: topic新建（RZY-2430）

  Background:
    Given open the "index.TopicSetting" page for uri "/topicsettings/"
  @indexSettingSmoke
  Scenario Outline:新建topic成功
    When I click the "CreateButton" button
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Describe" with value "<describe>"
    And I click the "EnsureButton" button

    Examples:
      | name      | describe |
      | topictest      | 测试topictest |

  Scenario Outline:新建topic失败
    When I click the "CreateButton" button
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Describe" with value "<describe>"
    And I click the "EnsureButton" button
    And I will see the element "ErrorMessage" name is "<ErrorMessage>"

    Examples:
      | name                                        | describe | ErrorMessage                      |
      |                                             |          | 名称不能为空                       |
      | _AutoTest                                   |          | 主题名不能以'raw_message'，'log_river'或'_'开头             |
      | ~!@#@!#                                     |          | 主题名只能由数字，字母和下划线组成，且长度小于25 |
      | 我有二十五个字符用来校验名称长度是否可以超过二十五 |          | 主题名只能由数字，字母和下划线组成，且长度小于25 |

  Scenario:新建topic失败(同名)
    When I click the "CreateButton" button
    And I set the parameter "Name" with value "topictest"
    And I click the "EnsureButton" button
    And I will see the element "ErrorLog" name is "API: 创建失败: Topic名称不能重复！"