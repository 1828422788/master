@report @all @smoke @reportSmoke
Feature: 报表删除（RZY-131）

  Background:
    Given open the "report.ListPage" page for uri "/reports/"

  Scenario Outline:
    When the data name is "<name>" then i click the "删除" button
    And I click the "DeleteEnsure" button
    And I will see the success message "删除成功"
    And I refresh the website
    Then I will see the search result "{'column':'0','name':'自动化测试用例','contains':'n'}"

    Examples:
      | name             |
      | autotest         |
      | 自动化测试            |
      | 自动化AutoTest      |
      | ExcelAutoTest    |
      | 乱码测试&$¥#AutoTest |
      | autotest1        |
      | autotest2        |
      | autotest3        |