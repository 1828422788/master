@splpre
Feature: 新建collect使用索引

  Background:
    Given open the "index.ListPage" page for uri "/indexsettings/"

  @collectpre
  Scenario Outline: RZY-1474:新建索引
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Desc" with value "<desc>"
    And I set the parameter "SavedTime" with value "<savedTime>"
    And I set the parameter "DivideTime" with value "<divideTime>"
    And I set the parameter "SavedSize" with value "<savedSize>"
#    And I choose the "<savedSizeDropDown>" from the "SavedSizeDropDown"
    And I click the "CreateButton" button
    And I will see the element "Message" name is "保存成功"

    Examples: 新建成功
      | name             | desc        | savedTime | divideTime | savedSize | savedSizeDropDown |
      | collectone       | 测试collect前置 | 7         | 1          | 1         | TB                |
      | collecttocollect | 测试collect前置 | 7         | 1          | 1         | TB                |
      | collecttwo       | 测试collect前置 | 7         | 1          | 1         | TB                |
      | collectmode      | 测试collect前置 | 7         | 1          | 1         | TB                |

