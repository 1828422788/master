@report @all @smoke @reportSmoke
Feature: 报表删除

  Background:
    Given open the "report.ListPage" page for uri "/reports/"

  Scenario Outline:
    When the data name is "<name>" then i click the "删除" button
    And I click the "DeleteEnsure" button
    And I will see the success message "删除成功"
    And I refresh the website
    Then I will see the search result "{'column':'0','name':'自动化测试用例','contains':'n'}"

    Examples:
      | name    |
      | 自动化测试用例 |