@indexSetting
Feature: yotta默认索引信息编辑（RZY-1477至1480）

  Background:
    Given open the "index.ListPage" page for uri "/indexsettings/"
    And I wait for loading invisible

  Scenario Outline:yotta默认索引信息编辑
    Given the data name is "{'column':'1','name':'yotta'}" then i click the "编辑" button
    Then I will see the "index.CreatePage" page
    And I click the "Next" button
    And I set the parameter "DivideTime" with value "<divideTime>"
    And I choose the "<divideTimeDropDown>" from the "DivideTimeDropDown"
    And I click the "Next" button
    And I wait for "1000" millsecond
    And I click the "Next" button
    And I click the "Finish" button
    And I will see the element "Message" name is "索引配置完成!"

    @indexSettingSmoke
    Examples:
      | divideTime | divideTimeDropDown |
      | 1          | 月                  |
      | 1          | 天                   |

    Examples:
      | divideTime | divideTimeDropDown  |
      | 1          | 年                  |
      | 1          | 小时                   |
