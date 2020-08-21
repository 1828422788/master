@beaver
Feature: 删索引

  Background:
    Given open the "incident.BeaverPage" page for uri "/beaver/indices/"

  Scenario Outline: 开始删除
#    Given open the "incident.beaverPage" page for uri
    And I click the "IndexManagerLi" button
    And I wait for "2000" millsecond

    When I set the parameter "BeaverIndexListSearchInput" with value "<IndexName>"
    And I click the "DeleteBeaverIndexNameButton" button
    And I wait for "ConfirmDeleteBeaverIndexNameButton" will be visible
    And I click the "ConfirmDeleteBeaverIndexNameButton" button

    Examples:
      | IndexName |
      | ops_* |
#      | ops_ |
#      | ops_ |