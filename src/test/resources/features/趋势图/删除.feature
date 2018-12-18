@all @smoke @trend @trendSmoke
Feature: 趋势图删除（RZY-1891）

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"

  Scenario Outline:
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureButton" button
    And I will see the success message "删除成功"
    And I refresh the website
    Then I will see the search result "{'column':'0','name':'<name>','contains':'no'}"

    Examples:
      | name         |
      | AutoTest10   |
      | AutoTest11   |
      | AutoTest12   |
      | AutoTest13   |
      | AutoTest14   |
      | AutoTest15   |
      | AutoTest16   |
      | AutoTest17   |
      | AutoTest18   |
      | AutoTest19   |
      | AutoTest20   |
      | AutoTest21   |
      | AutoTest22   |
      | AutoTest23   |
      | AutoTest24   |
      | AutoTest25   |
      | AutoTest26   |
      | AutoTest27   |
      | AutoTest28   |
      | AutoTest29   |
      | AutoTest30   |
      | AutoTest2    |
      | AutoTest3    |
      | AutoTest4    |
      | AutoTest5    |
      | AutoTest6    |
      | AutoTest7    |
      | AutoTest8    |
      | AutoTest9    |
      | AutoTest1(1) |

  @clean
    Examples:
      | name      |
      | AutoTest1 |