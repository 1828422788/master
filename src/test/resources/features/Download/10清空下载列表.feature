Feature: 清空下载列表页面

  @cleardl
  Scenario Outline: 清空下载列表
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/#"
    When I set the parameter "DbListPageSearchInput" with value "<name>"
    And I click the "DelDownLoadButton" button
    And I click the "EnsureAfterDelDownload" button

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
      | csv  |
      | csv  |
