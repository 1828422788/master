@spldelete @dlother @spldelete0
Feature: collect下载

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  @spldelete01
  Scenario Outline:
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then take a screenshot with name "spldownload/<name>"

    And I wait for "downloadEvent" will be visible
    And I click the "downloadEvent" button
    And I set the parameter "DownloadName" with value "<name>"
    And I set the parameter "MaxLineNum" with value "100"
    When I click the "CreateDownloadTask" button
    Then I will see the success message "提交成功，请到设置-下载管理页查看下载状态！"

    #下载到本地
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/#"
    And I set the parameter "DbListPageSearchInput" with value "<name>.csv"
    And I wait for loading invisible
    Then the data name is "<name>.csv" then i click the "下载" button

    Examples:
      | name                             | splQuery                                                                                                                     |
      | eval_delete_collect_sample_step1 | tag:sample04061424\| collect index=collectdelete marker=\"appname=\\\\\"appcollect\\\\\", tag=\\\\\"spldeletecollect\\\\\"\" |

  @spldelete02
  Scenario Outline:
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then take a screenshot with name "spldownload/<name>"

    And I wait for "DownloadEvent" will be visible
    Then I click the "DownloadEvent" button
    Then I set the parameter "DownloadName" with value "<name>"
    Then I set the parameter "MaxLineNum" with value "100"
    Then I choose the "TXT" from the "DocumentTypeList"
    Then I choose the "UTF-8" from the "DocumentEncodeList"
    Then I click the "CreateDownloadTask" button
    Then I will see the success message "提交成功，请到设置-下载管理页查看下载状态！"

    #下载到本地
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/#"
    When I set the parameter "DbListPageSearchInput" with value "<name>.txt"
    And I wait for loading invisible
    Then the data name is "<name>.txt" then i click the "下载" button

    Examples:
      | name                             | splQuery                                                                           |
      | eval_delete_collect_sample_step2 | starttime=\"now/d\" endtime=\"now/d+24h\" index=collectdelete tag:spldeletecollect |

  @spldelete03
  Scenario Outline:
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then take a screenshot with name "spldownload/<name>"

    And I wait for "downloadEvent" will be visible
    And I click the "downloadEvent" button
    And I set the parameter "DownloadName" with value "<name>"
    And I set the parameter "MaxLineNum" with value "100"
    When I click the "CreateDownloadTask" button
    Then I will see the success message "提交成功，请到设置-下载管理页查看下载状态！"

    #下载到本地
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/#"
    And I set the parameter "DbListPageSearchInput" with value "<name>.csv"
    And I wait for loading invisible
    Then the data name is "<name>.csv" then i click the "下载" button

    Examples:
      | name                             | splQuery                                                                                     |
      | eval_delete_collect_sample_step3 | starttime=\"now/d\" endtime=\"now/d+24h\" index=collectdelete tag:spldeletecollect \| delete |