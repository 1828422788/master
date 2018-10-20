@report @all @smoke
Feature: 报表删除

  Background:
    Given I insert into table "Report" with "{'name':'自动化测试用例','owner':'1|owner|86bb700c6f5e48b094bbc73dd8f46a6a','domain':'ops','frequency':'day','triggertime':'001130','count':'0','domain_id':'1','crontab':'0','enabled':'1','report_type':'pdf'}"
    Then open the "report.ListPage" page for uri "/reports/"

  Scenario Outline:
    When the data name is "<name>" then i click the "删除" button
    And I click the "DeleteEnsure" button
    And I will see the success message "删除成功"
    And I refresh the website
    Then I will see the search result "{'column':'0','name':'自动化测试用例','contains':'n'}"

    Examples:
      | name    |
      | 自动化测试用例 |