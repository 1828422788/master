@alldownload
Feature: download_eval下载

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  @dleval
  Scenario Outline: 执行
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "2000" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"

    And I wait for "2000" millsecond
    And I wait for "downloadButton" will be visible
    Then I click the "downloadButton" button
    Then I set the parameter "DownloadName" with value "<name>"
    Then I set the parameter "MaxLineNum" with value "100"
#    Then I choose the "<unit>" from the "MaxLineDropdown"
    Then I choose the "CSV" from the "DocumentTypeList"
    Then I choose the "UTF" from the "DocumentEncodeList"
    Then I click the "CreateDownloadTask" button
#    And I wait for "2000" millsecond
#    Then I will see the success message "提交成功，请到设置-下载管理页查看下载状态！"

    #下载到本地
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/#"
    When I set the parameter "DbListPageSearchInput" with value "<name>.csv"
    And I wait for "2000" millsecond
    Given the data name is "<name>.csv" then i click the "下载" button
#    And I wait for "2000" millsecond
#    Then I compare source download file "expect/<name>.csv" with target download files "<name>.csv"

    Examples: 新建成功
      | name                                        | splQuery                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
      | eval_noempty_logic_and                      | tag:\"sample04061424\" \| eval bool_is_empty=empty(apache.request_path) \| eval bool_not_empty=! empty(apache.request_path) \| eval bool_is_false= false && empty(apache.request_path) \| table bool_is_empty, bool_not_empty,bool_is_false, apache.x_forward \| sort by  apache.x_forward                                                                                                                                                                                                                                                                                 |