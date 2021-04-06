@dlevent @dlevent1
Feature: download_事件搜索下载part1

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  Scenario Outline: 执行
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "5000" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then take a screenshot with name "downloadpng/<name>"

    And I wait for "2000" millsecond
    And I wait for "DownloadEvent" will be visible
    When I click the "DownloadEvent" button
    And I set the parameter "DownloadName" with value "<name>"
    And I set the parameter "MaxLineNum" with value "100"
#    And I choose the "<unit>" from the "MaxLineDropdown"
    And I choose the "TXT" from the "DocumentTypeList"
    And I wait for "2000" millsecond
    And I choose the "UTF-8" from the "DocumentEncodeList"
    When I click the "CreateDownloadTask" button
#    And I wait for "2000" millsecond
#    Then I will see the success message "提交成功，请到设置-下载管理页查看下载状态！"

    #下载到本地
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/#"
    When I set the parameter "DbListPageSearchInput" with value "<name>.txt"
    And I wait for "1000" millsecond
#    Given the data name is "<name>.txt" then i click the "下载" button
    And I click the "ListDownloadButton" button

    Examples:
      | name                                 | splQuery                                                                                                                                                                                                                                                                                                                                                                      |
      | sub_download                         | [[ starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\"\| stats avg(apache.resp_len) as avg_len by apache.clientip \| sort by +avg_len ]] \| sort by timestamp                                                                                                                                                                                                    |
      | search_verify_chart_log              | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart                                                                                                                                                                                                                                                                                                            |
      | search_regex_json                    | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_regex_json_100                                                                                                                                                                                                                                                                                                   |
      | search_json_sdyd_41                  | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_json_sdyd_41                                                                                                                                                                                                                                                                                                     |
      | search_json_sdyd_float               | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_json_sdyd_float_59                                                                                                                                                                                                                                                                                               |
      | search_alert_yctv                    | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_yctv_100 AND (NOT \"errno 104\") AND (NOT \"code 0\") AND (NOT \"errno 111\") AND (NOT \"errno 106\") AND (NOT \"verify failed\") AND (NOT \"errno 101\") AND (NOT \"errno 115\") AND (NOT \"errno 117\") AND (NOT \"Detect failed\") AND (NOT \"errno 109\") AND (NOT \"Job failed\") AND (NOT \"inner error\") |
      | first_sub_inner_ip                   | [[ starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\"\| stats count(apache.clientip) by apache.clientip, apache.method \| limit 2 \| fields apache.clientip apache.method ]]                                                                                                                                                                                    |
      | dedup_int                            | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| dedup 3 apache.status \| sort by timestamp                                                                                                                                                                                                                                                                    |
      | dedup_char_keepevents_true           | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| dedup 3 apache.version keepevents=true \| sort by timestamp                                                                                                                                                                                                                                                   |
      | dedup_char_keepevents_false          | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| dedup 3 apache.version keepevents=false \| sort by timestamp                                                                                                                                                                                                                                                  |
      | dedup_double_fields_keepevents_true  | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| dedup 3 apache.method, appname keepevents = true \| sort by timestamp                                                                                                                                                                                                                                         |
      | dedup_double_fields_keepevents_false | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| dedup 3 apache.status, appname keepevents = false \| sort by timestamp                                                                                                                                                                                                                                        |
      | dedup_keepempty_true                 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_win_sys_20 \| dedup json.Category keepempty = true                                                                                                                                                                                                                                                               |
      | dedup_keepempty_false                | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_win_sys_20 \| dedup json.Category keepempty = false                                                                                                                                                                                                                                                              |
      | eval_delete_after_where_step2        | starttime=\"now/d\" endtime=\"now/d+24h\" tag:spldelete1                                                                                                                                                                                                                                                                                                                      |
