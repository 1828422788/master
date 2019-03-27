Feature: 路由删除（RZY-1482）

  Background:
    Given open the "index.ListPage" page for uri "/indexsettings/indexmatchrule/"

  Scenario Outline:
    Given the data name is "{'column':'<num>','name':'<name>'}" then i click the "删除" button
    When I click the "EnsureButton" button
    And I refresh the website
    Then I will see the search result "{'column':'<num>','name':'<name>','contains':'no'}"

  @indexSetting @indexSettingSmoke
    Examples:
      | num | name               |
      | 0   | iistestauto        |
      | 1   | index_testautotest |
      | 2   | iisdxautotest      |

  @clean
    Examples:
      | num | name               |
      | 3   | AutoTest           |
      | 3   | AutoTestForsxc     |
      | 3   | AutoTestForsxcSize |
