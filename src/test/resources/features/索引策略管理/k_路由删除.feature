 @indexSetting
Feature: 路由删除（RZY-1482）

  Background:
    Given open the "index.ListPage" page for uri "/indexmatchrules/"
    And I wait for loading invisible

  Scenario Outline:路由删除
    Given the data name is "{'column':'<num>','name':'<name>'}" then i click the "删除" button
    Then I click the "Ensure" button

    Examples:
      | num | name                 |
      | 3   | AutoUpCase           |
      | 3   | AutoRule             |
      | 3   | AutoTag              |
      | 3   | AutoTestForsxc       |
      | 1   | sunxcsize            |

    @indexSettingSmoke
    Examples:
      | num | name                 |
      | 3   | AutoCreateForSxcTest |
      | 3   | AutoAppName          |
      | 3   | AutoTest             |



