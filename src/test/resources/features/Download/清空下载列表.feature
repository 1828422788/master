@db
Feature: 新建下载任务

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"

  @cleardb
  Scenario Outline: 删除下载任务
    #下载到本地
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/#"
    When I set the parameter "DbListPageSearchInput" with value "<name>"
    And I wait for "2000" millsecond
    Given the data name is "<name>.csv" then i click the "删除" button

    Examples: 新建成功
      |  name  |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |
      |   _   |

