@indexSetting
Feature: topic新建（RZY-2430）

  Background
    Given open the "index.TopicSetting" page for uri "/indexmatchrules/topicsettings/"

  Scenario Outline:新建topic
    When I click the "CreateButton" button
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Describe" with value "<describe>"
    And I click the "EnsureButton" button
    And I will see the element "Message" name is "<message>"

  @second @indexSettingSmoke
    Examples:
      | name      | describe | message |
      | topictest | 自动化测试    | 创建成功    |

    Examples:
      | name                      | describe | message                      |
      |                           |          | 名称不能为空                       |
      | topictest                 |          | 创建失败: Topic名称不能重复！           |
      | _AutoTest                 |          | TopicInfo名称不符合规则             |
      | ~!@#@!#                   |          | Topic名只能由数字，字母和下划线组成，且长度小于25 |
      | 我有二十五个字符用来校验名称长度是否可以超过二十五 |          | Topic名只能由数字，字母和下划线组成，且长度小于25 |