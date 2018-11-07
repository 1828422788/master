@indexSetting @all @smoke
Feature: 索引信息编辑

  Background:
    Given open the "index.ListPage" page for uri "/indexsettings/indexinfo/"

  Scenario Outline:
    Given the data name is "autotest" then i click the "编辑" button
    Then I will see the "index.CreatePage" page
    And I set the parameter "Desc" with value "<desc>"
    And I set the parameter "SavedTime" with value "<savedTime>"
    And I choose the "<savedTimeDropDown>" from the "SavedTimeDropDown"
    And I set the parameter "DivideTime" with value "<divideTime>"
    And I choose the "<divideTimeDropDown>" from the "DivideTimeDropDown"
    And I set the parameter "ColdTime" with value "<coldTime>"
    And I set the parameter "SavedSize" with value "<savedSize>"
    And I choose the "<savedSizeDropDown>" from the "SavedSizeDropDown"
    And I click the "SavedButton" button
    Then I will see the success message "<message>"

    Examples:
      | desc | savedTime | savedTimeDropDown | divideTime | divideTimeDropDown | coldTime | savedSize | savedSizeDropDown | message |
      | test | 3         | 年                 | 1          |                    | 31       | 10        | KB                | 保存成功    |
      | test | 3         | 天                 | 1          |                    | 1        | 10        | MB                | 保存成功    |
      | test | 3         | 年                 | 1          | 年                  | 500      | 1         | PB                | 保存成功    |
      | test | 3         | 月                 | 1          | 月                  | 31       | 1         | TB                | 保存成功    |
      | test | 3         | 天                 | 1          | 天                  | 1        | 1         | KB                | 保存成功    |
      | test | 3         | 天                 | 1          | 天                  | 1        | 1         | Byte              | 保存成功    |

    