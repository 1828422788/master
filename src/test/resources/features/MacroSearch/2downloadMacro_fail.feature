@dlmacrof @dlother
Feature: 验证宏

  Scenario Outline:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "<macroSearch>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
#    And I save the result "{'ClientIp':'Column1','Version':'Column2','Count':'Column3'}"

    And I wait for "2000" millsecond
    And I wait for "downloadButton" will be visible
    Then I click the "downloadButton" button
    Then I set the parameter "DownloadName" with value "macro_<name>"
    Then I set the parameter "MaxLineNum" with value "100"
#    Then I choose the "<unit>" from the "MaxLineDropdown"
    Then I choose the "CSV" from the "DocumentTypeList"
    Then I choose the "UTF" from the "DocumentEncodeList"
    Then I click the "CreateDownloadTask" button
#    And I wait for "2000" millsecond
#    Then I will see the success message "提交成功，请到设置-下载管理页查看下载状态！"

    #下载到本地
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/#"
    When I set the parameter "DbListPageSearchInput" with value "macro_<name>.csv"
    And I wait for "2000" millsecond
    Given the data name is "macro_<name>.csv" then i click the "下载" button

    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "<splQuery1>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
#    Then I compare with "{'ClientIp':'Column1','Version':'Column2','Count':'Column3'}"
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

    Examples:
      | name                           | macroSearch                                               | splQuery1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
#      | huanbi_2                       | `huanbi_2(\"apache\",count)`                              | starttime=\"now/d\" endtime=\"now\" appname:apache \| bucket timestamp span=1h as ts \|stats count() as count_ by ts\| eval hour=formatdate(tolong(ts),\"HH\")\|eval line=\"今天\"\|append [[starttime=\"-1d/d\" endtime=\"now/d\" appname:apache \| bucket timestamp span=1h as ts\|stats count() as count_ by ts\| eval hour=formatdate(tolong(ts),\"HH\")\|eval line=\"昨天\"]] \| append [[starttime=\"-7d/d\" endtime=\"-6d/d\" appname:apache \| bucket timestamp span=1h as ts\|stats count() as count_ by ts\| eval hour=formatdate(tolong(ts),"\HH\")\|eval line=\"一周前\"]] \| rename count_ as \"请求量\" |
      #      | n1                             | `macrosample_1param(\"23.166.125.53\")`                   | tag:sample04061424 \| stats count() by apache.clientip, apache.version \| where apache.clientip==\"23.166.125.53\"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
#      | n2                             | `macrosample_2param(\"23.166.125.53\",\"1.1\")`           | tag:sample04061424 \| stats count() by apache.clientip, apache.version \| where apache.clientip==\"23.166.125.53\" && apache.version==\"1.1\"                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
#      | me_substr_1                    | tag:sample04061424 \| eval x=`me_substr_1(\"VendorLongitude\")` | tag:sample04061424 \| eval x=substring(\"VendorLongitude\",2)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
#      | me_if_3                        | tag:sample04061424 \| eval x=`me_if_3(1,2,3)` \| table x        | tag:sample04061424 \| eval x=`me_if_3(1,2,3)` \| table x                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
#      | me_if_excp_2                   | tag:sample04061424 \| eval x=`me_if_excp_2(1,2)`                | tag:sample04061424 \| eval x=`me_if_excp_2(1,2)`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
#      | map_opt_count_2                | `map_opt_count_2(\"count\", \"count\")`                   | tag:\"sample04061424\" \| eval txt=\"count\"\| limit 1 \| table txt \| map \" tag:\"sample04061424\" \| stats count(timestamp) \"                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
#      | map_eval_resplen_stats_count_2 | `map_eval_resplen_stats_count_2(count,69)`            | tag:\"sample04061424\" \| eval resp_len=$int_resp_len$ \| limit 1 \| table resp_len \| map \" tag:\"sample04061424\" \| stats $fun_name$() \"                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
#      | sub_tran_resp_len_1            | `sub_tran_resp_len_1(1955)`                               | tag:sample04061424 AND [[ 1955 \| stats count(appanme) by apache.resp_len \| fields apache.resp_len]]  \| transaction apache.resp_len keepevicted=true contains=\"1955\"                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
#      | sub_tran_resp_len_param_1      | `sub_tran_resp_len_param_1(1955)`                         | tag: sample04061424 AND [[ apache.resp_len:1955 \| stats count(appname) by apache.resp_len \| fields apache.resp_len ]] \| transaction apache.resp_len keepevicted=true contains=\"1955\"                                                                                                                                                                                                                                                                                                                                                                                                                                    |

  Scenario Outline: 验证1
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "`<name>`"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
#    And I save the result "{'ClientIp':'Column1','Version':'Column2','Count':'Column3'}"

    And I wait for "2000" millsecond
    And I wait for "downloadButton" will be visible
    Then I click the "downloadButton" button
    Then I set the parameter "DownloadName" with value "macro_<name>"
    Then I set the parameter "MaxLineNum" with value "100"
#    Then I choose the "<unit>" from the "MaxLineDropdown"
    Then I choose the "CSV" from the "DocumentTypeList"
    Then I choose the "UTF" from the "DocumentEncodeList"
    Then I click the "CreateDownloadTask" button
#    And I wait for "2000" millsecond
#    Then I will see the success message "提交成功，请到设置-下载管理页查看下载状态！"

    #下载到本地
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/#"
    When I set the parameter "DbListPageSearchInput" with value "macro_<name>.csv"
    And I wait for "2000" millsecond
    Given the data name is "macro_<name>.csv" then i click the "下载" button

    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "<definition>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
#    Then I compare with "{'ClientIp':'Column1','Version':'Column2','Count':'Column3'}"
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

    Examples:
      | name                                        | definition                                                                                                                                                                                                                                                                                                                             | validateExpression | validateFalseInfo |
#      | autoregress_sample                          | starttime="\now/d\" endtime=\"now\" tag:\"sample04061424\" \| bucket timestamp span=10m as ts \| stats count(appname) as count_app by ts \| eval time=formatdate(ts) \| autoregress count_app p=6                                                                                                                                      |                    |                   |
#      | makesession                                 | transaction apache.clientip maxspan=30m                                                                                                                                                                                                                                                                                                |                    |                   |
