@indexSetting
Feature: topic编辑（RZY-2428）

  Background:
    Given open the "index.TopicSetting" page for uri "/topicsettings/"

  Scenario Outline:编辑topic
    When the data name is "topictest" then i click the "编辑" button
    And I set the parameter "Describe" with value "<describe>"
    And I click the "EnsureButton" button
    Then I will see the <message>

    @indexSettingSmoke
    Examples:
      | describe      | message                |
      | 测试topic编辑功能 | success message "更新成功" |

    Examples: RZY-2427
      | describe                                                                                                                                                                                                                                                        | message                     |
      | 我有二十五个字符用来校验名称长度是否可以超过二十五我有二十五个字符用来校验名称长度是否可以超过二十五我有二十五个字符用来校验名称长度是否可以超过二十五我有二十五个字符用来校验名称长度是否可以超过二十五我有二十五个字符用来校验名称长度是否可以超过二十五我有二十五个字符用来校验名称长度是否可以超过二十五我有二十五个字符用来校验名称长度是否可以超过二十五我有二十五个字符用来校验名称长度是否可以超过二十五我有二十五个字符用来校验名称长度是否可以超过二十五我有二十五个字符用来校验名称长度是否可以超过二十五我有五个字 | error message "描述的长度需小于255" |