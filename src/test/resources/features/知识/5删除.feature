@smoke @all @knowledge
Feature: 知识删除

  Background:
    Given open the "knowledge.ListPage" page for uri "/knowledge/"

  Scenario Outline:删除知识
    Given the data name is "<Name>" then i click the "删除" button
    When I click the "EnsureDeleteButton" button
    And I will see the success message "<SuccessMsg>"
    And I refresh the website
    Then I will see the search result "{'column':'0','name':'<Name>','contains':'no'}"

    Examples:
      | Name        | SuccessMsg |
      | sxjautotest | 删除成功       |
      | autotest    | 删除成功       |
      | sunxj1      | 删除成功       |
