@indexSetting @indexSettingSmoke @third
Feature: 索引信息编辑（RZY-1477至1480）

  Background:
    Given open the "index.ListPage" page for uri "/indexsettings/indexinfo/"
    And I wait for loading invisible

  Scenario Outline:修改切分时间
    Given the data name is "{'column':'2','name':'AutoTestForsxc'}" then i click the "编辑" button without paging
    Then I will see the "index.CreatePage" page
    And I set the parameter "DivideTime" with value "<divideTime>"
    And I choose the "<divideTimeDropDown>" from the "DivideTimeDropDown"
    And I click the "SavedButton" button
    Then I will see the success message "<message>"

    Examples:
      | divideTime | divideTimeDropDown | message     |
      | 1          | 小时                 | 保存成功        |
      | 1          | 月                  | 切分时间应小于保存时间 |
      | 1          | 年                  | 切分时间应小于保存时间 |
      | 1          | 天                  | 保存成功        |

  Scenario Outline:修改保存大小
    Given the data name is "{'column':'2','name':'AutoTestForsxc'}" then i click the "编辑" button without paging
    Then I will see the "index.CreatePage" page
    And I set the parameter "SavedSize" with value "<savedSize>"
    And I choose the "<savedSizeDropDown>" from the "SavedSizeDropDown"
    And I click the "SavedButton" button
    Then I will see the success message "<message>"

    Examples:
      | savedSize | savedSizeDropDown | message                |
      | 100       | Byte              | success message "保存成功" |
      | 100       | PB                | success message "保存成功" |
      | 100       | TB                | success message "保存成功" |
      | 100       | GB                | success message "保存成功" |
      | 100       | KB                | success message "保存成功" |
      | 100       | MB                | success message "保存成功" |

  Scenario Outline:修改保存时间
    Given the data name is "{'column':'2','name':'AutoTestForsxc'}" then i click the "编辑" button without paging
    Then I will see the "index.CreatePage" page
    And I set the parameter "SavedTime" with value "<savedTime>"
    And I choose the "<savedTimeDropDown>" from the "savedTimeDropDown"
    And I click the "SavedButton" button
    Then I will see the success message "<message>"

    Examples:
      | savedTime | savedTimeDropDown | message     |
      | 2         | 月                 | 保存成功 |
      | 2         | 年                 | 保存成功 |
      | 2         | 天                 | 保存成功        |


  Scenario Outline:修改备注
    Given the data name is "{'column':'2','name':'AutoTestForsxc'}" then i click the "编辑" button without paging
    Then I will see the "index.CreatePage" page
    And I set the parameter "Desc" with value "<desc>"
    And I click the "SavedButton" button
    Then I will see the success message "<message>"

    Examples:
      | desc                 | message |
      | AutoTestForsxc2      | 保存成功    |
      | AutoTestForsxc中文test | 保存成功    |



