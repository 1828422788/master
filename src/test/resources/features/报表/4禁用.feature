@all @report @smoke @reportSmoke
Feature: 报表禁用/启用

  Background:
    Given open the "report.ListPage" page for uri "/reports/"

  Scenario Outline:
    Then I disabled the data "<name>"
    Then I will see the success message "<result>"

    Examples:
      | name    | result |
      | 自动化测试用例 | 禁用成功   |
      | 自动化测试用例 | 启用成功   |