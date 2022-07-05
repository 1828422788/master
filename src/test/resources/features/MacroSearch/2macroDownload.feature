@searchMacro
Feature: 宏下载验证

  Scenario Outline:使用宏和使用spl搜索后下载csv
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "<macroSearch>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And take a screenshot with name "macro_<name>.png"

    When I wait for "SaveAsOther" will be visible
    And I choose the "下载" from the "SaveAsList"
    And I wait for loading invisible
    Then I set the parameter "DownloadName" with value "macro_<name>"
    Then I set the parameter "MaxLineNum" with value "100"
    Then I choose the "CSV" from the "DocumentTypeList"
    Then I choose the "UTF-8" from the "DocumentEncodeList"
    Then I click the "CreateDownloadTask" button
    Then I will see the success message "提交成功，请到设置-下载管理页查看下载状态！"

    #下载到本地
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/#"
    When I set the parameter "DbListPageSearchInput" with value "macro_<name>.csv"
    And I wait for loading invisible
    Then the data name is "macro_<name>.csv" then i click the "下载" button

    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "<splQuery1>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And take a screenshot with name "<name>.png"

    And I wait for "SaveAsOther" will be visible
    And I choose the "下载" from the "SaveAsList"
    And I wait for loading invisible
    Then I set the parameter "DownloadName" with value "<name>"
    Then I set the parameter "MaxLineNum" with value "100"
    Then I choose the "CSV" from the "DocumentTypeList"
    Then I choose the "UTF-8" from the "DocumentEncodeList"
    Then I click the "CreateDownloadTask" button
    Then I will see the success message "提交成功，请到设置-下载管理页查看下载状态！"

    #下载到本地
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/"
    When I set the parameter "DbListPageSearchInput" with value "<name>.csv"
    And I wait for loading invisible
    Then the data name is "<name>.csv" then i click the "下载" button

    Examples:
      | name                            | macroSearch                                                                    | splQuery1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
      | UIAutoTest                      | `UIAutoTest(\"23.166.125.53\")`                                                |tag:sample04061424 \| stats count() by apache.clientip, apache.version \| where apache.clientip==\"71.221.121.107\"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |

  Scenario Outline:使用宏和使用spl搜索后下载json
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "<macroSearch>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And take a screenshot with name "macro_<name>.png"

    And I wait for "DownloadEvent" will be visible
    And I click the "DownloadEvent" button
    And I wait for loading invisible
    And I set the parameter "DownloadName" with value "macro_<name>"
    And I set the parameter "MaxLineNum" with value "100"
    And I choose the "JSON" from the "DocumentTypeList"
    And I choose the "UTF-8" from the "DocumentEncodeList"
    And I click the "CreateDownloadTask" button
    Then I will see the success message "提交成功，请到设置-下载管理页查看下载状态！"

    #下载到本地
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/"
    When I set the parameter "DbListPageSearchInput" with value "macro_<name>.json"
    And I wait for loading invisible
    Then the data name is "macro_<name>.json" then i click the "下载" button

    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "<splQuery1>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And take a screenshot with name "<name>.png"

    And I wait for "DownloadEvent" will be visible
    And I click the "DownloadEvent" button
    And I wait for loading invisible
    And I set the parameter "DownloadName" with value "<name>"
    And I set the parameter "MaxLineNum" with value "100"
    And I choose the "JSON" from the "DocumentTypeList"
    And I choose the "UTF-8" from the "DocumentEncodeList"
    And I click the "CreateDownloadTask" button
    Then I will see the success message "提交成功，请到设置-下载管理页查看下载状态！"

    #下载到本地
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/"
    When I set the parameter "DbListPageSearchInput" with value "<name>.json"
    And I wait for loading invisible
    Then the data name is "<name>.json" then i click the "下载" button

    Examples:
      | name                      | macroSearch                       | splQuery1                                                                                                                                                                                 |
      | sub_tran_resp_len_1       | `sub_tran_resp_len_1(1955)`       | tag:sample04061424 AND [[ 1955 \| stats count(appanme) by apache.resp_len \| fields apache.resp_len]]  \| transaction apache.resp_len keepevicted=true contains=\"1955\"                  |

  Scenario Outline: 使用宏和使用spl搜索后下载xlsx
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "`<name>`"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And take a screenshot with name "macro_<name>.png"

    And I wait for "SaveAsOther" will be visible
    And I choose the "下载" from the "SaveAsList"
    And I wait for loading invisible
    Then I set the parameter "DownloadName" with value "macro_<name>"
    Then I set the parameter "MaxLineNum" with value "100"
    Then I choose the "XLSX" from the "DocumentTypeList"
    Then I choose the "UTF-8" from the "DocumentEncodeList"
    Then I click the "CreateDownloadTask" button
    Then I will see the success message "提交成功，请到设置-下载管理页查看下载状态！"

    #下载到本地
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/"
    When I set the parameter "DbListPageSearchInput" with value "macro_<name>.xlsx"
    And I wait for loading invisible
    Then the data name is "macro_<name>.xlsx" then i click the "下载" button

    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "<definition>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And take a screenshot with name "<name>.png"

    And I wait for "SaveAsOther" will be visible
    And I choose the "下载" from the "SaveAsList"
    And I wait for loading invisible
    Then I set the parameter "DownloadName" with value "<name>"
    Then I set the parameter "MaxLineNum" with value "100"
    Then I choose the "XLSX" from the "DocumentTypeList"
    Then I choose the "UTF-8" from the "DocumentEncodeList"
    Then I click the "CreateDownloadTask" button
    Then I will see the success message "提交成功，请到设置-下载管理页查看下载状态！"

    #下载到本地
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/"
    When I set the parameter "DbListPageSearchInput" with value "<name>.xlsx"
    And I wait for loading invisible
    Then the data name is "<name>.xlsx" then i click the "下载" button

    Examples:
      | name                                        | definition                                                                                                                                                                                                                                                                                                                             | validateExpression | validateFalseInfo |
      | alert_stats_len_avg                         | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| stats avg(apache.resp_len) as avg_len by apache.clientip \| sort by avg_len, apache.clientip                                                                                                                                                                           |                    |                   |