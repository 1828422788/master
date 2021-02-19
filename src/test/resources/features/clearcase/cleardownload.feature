@cleardl
Feature: 清理下载列表

  Scenario Outline:
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/#"
    When I set the parameter "DbListPageSearchInput" with value "<name>"
    And I wait for "2000" millsecond
    Given the data name is "<name>" then i click the "下载" button

    Examples:
      | name |
      | _    |
      | _    |
      | _    |
      | _    |
      | _    |
      | _    |
      | _    |
      | _    |
      | _    |
      | _    |
      | _    |
      | _    |
      | _    |
      | _    |
      | _    |
      | _    |
      | _    |
      | _    |
      | _    |
      | _    |
      | _    |
      | _    |
      | _    |
      | _    |
      | _    |
      | _    |
      | _    |
      | _    |
      | _    |
      | _    |
      | _    |
      | _    |
