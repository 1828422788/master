@indexSetting @indexSettingSmoke @third
Feature: 索引信息编辑（RZY-1477至1480）

  Background:
    Given open the "index.ListPage" page for uri "/indexsettings/indexinfo/"
    And I wait for loading invisible

  Scenario Outline:
    Given the data name is "{'column':'2','name':'AutoTestForsxc'}" then i click the "编辑" button without paging
    Then I will see the "index.CreatePage" page
    And I set the parameter "DivideTime" with value "<divideTime>"
    And I choose the "<divideTimeDropDown>" from the "DivideTimeDropDown"
    And I click the "SavedButton" button
    Then I will see the success message "<message>"

    Examples:
      | divideTime | divideTimeDropDown | message     |
      | 1          |                    | 保存成功        |
      | 1          | 月                  | 切分时间应小于保存时间 |
      | 1          | 年                  | 切分时间应小于保存时间 |