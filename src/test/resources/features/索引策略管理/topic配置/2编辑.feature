@indexSetting @all
Feature: topic编辑（RZY-2428）

  Background:
    Given open the "index.TopicSetting" page for uri "/indexsettings/topicsettings/"

  Scenario Outline:
    When the data name is "AutoTest" then i click the "编辑" button
    And I set the parameter "Describe" with value "<describe>"
    And I click the "EnsureButton" button
    Then I will see the <message>

  @indexSettingSmoke
    Examples:
      | describe | message                |
      | UI Test  | success message "保存成功" |
      |          | success message "保存成功" |

    Examples: RZY-2427
      | describe                                                                                                                                                                                                                                                        | message                     |
      | 我有二十五个字符用来校验名称长度是否可以超过二十五我有二十五个字符用来校验名称长度是否可以超过二十五我有二十五个字符用来校验名称长度是否可以超过二十五我有二十五个字符用来校验名称长度是否可以超过二十五我有二十五个字符用来校验名称长度是否可以超过二十五我有二十五个字符用来校验名称长度是否可以超过二十五我有二十五个字符用来校验名称长度是否可以超过二十五我有二十五个字符用来校验名称长度是否可以超过二十五我有二十五个字符用来校验名称长度是否可以超过二十五我有二十五个字符用来校验名称长度是否可以超过二十五我有五个字 | error message "描述的长度需小于255" |