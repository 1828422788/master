@all @smoke @alert @alertSmoke
Feature: 监控删除

  Scenario Outline:
    Given open the "alert.ListPage" page for uri "/alerts/"
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureDeleteButton" button
    Then I will see the success message "删除成功"

    Examples:
      | name         |
      | AutoTest     |
      | AutoTest1    |
      | AutoTest(1)  |
#      | AutoTest2    |
#      | AutoTest3    |
#      | AutoTest4    |
#      | AutoTest5    |
      | AutoTest6    |
      | AutoTest7    |
      | AutoTest8    |
      | AutoTest9    |
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
#      | AutoTest25   |
#      | AutoTest26   |
#      | AutoTest27   |
#      | AutoTest28   |
#      | AutoTest29   |
      | AutoTest30   |
      | AutoTest31   |
      | AutoTest32   |
      | AutoTest33   |
      | AutoTest34   |
      | AutoTest35   |
      | AutoTest_sum |
      | AutoTest_avg |
      | AutoTest_max |
      | AutoTest_min |


  Scenario:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    Given I click the "OpenSavedSearchButton" button
    Then "删除" the data "alertSavedSearch" in columnNum "1"
    Then I click the "DeleteSavedSearch" button

