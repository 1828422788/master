@autoui02 @newsaved
Feature: 新建已存搜索组织结构树

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "2000" millsecond

  @newsavedevent1
  Scenario Outline: 新建已存搜索
    When I set the parameter "SearchInput" with value "<splQuery>"
    And I wait for loading complete

    And I choose the "新建" from the "SavedSearchList"
    And I wait for loading complete

    And I click the "resourceTagDiv" button
    When I wait for loading complete
    And I click the "resourceTagDiv" button
    When I wait for loading complete
    And I set the parameter "SavedSearchName" with value "<name>"
    And I set the parameter "ResourceTagInput" with value "<searchResName>"
    And I choose the "<searchResName>" from the "ResourceGroupList"
    And I click the "EnsureCreateSavedSearch" button
    And I wait for loading complete
    Then I will see the success message "创建成功"

    Examples:
      | searchResName       | name                                 | splQuery                                                                                                                                                                                                                                                                                                                                                                      |
      | searchResName       | chart_over_timestamp_span1h          | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display  \| chart count() over timestamp span=\"1h\"                                                                                                                                                                                                                                                             |
      | org.saved1.search1  | sub_download                         | [[ starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\"\| stats avg(apache.resp_len) as avg_len by apache.clientip \| sort by +avg_len ]] \| sort by timestamp                                                                                                                                                                                                    |
      | org.saved1.search2  | search_verify_chart_log              | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart                                                                                                                                                                                                                                                                                                            |
      | org.saved1.search3  | search_regex_json                    | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_regex_json_100                                                                                                                                                                                                                                                                                                   |
      | org.saved1.search4  | search_json_sdyd_41                  | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_json_sdyd_41                                                                                                                                                                                                                                                                                                     |
      | org.saved1.search5  | search_json_sdyd_float               | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_json_sdyd_float_59                                                                                                                                                                                                                                                                                               |
      | org.saved1.search6  | search_alert_yctv                    | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_yctv_100 AND (NOT \"errno 104\") AND (NOT \"code 0\") AND (NOT \"errno 111\") AND (NOT \"errno 106\") AND (NOT \"verify failed\") AND (NOT \"errno 101\") AND (NOT \"errno 115\") AND (NOT \"errno 117\") AND (NOT \"Detect failed\") AND (NOT \"errno 109\") AND (NOT \"Job failed\") AND (NOT \"inner error\") |
      | org.saved1.search7  | first_sub_inner_ip                   | [[ starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\"\| stats count(apache.clientip) by apache.clientip, apache.method \| limit 2 \| fields apache.clientip apache.method ]]                                                                                                                                                                                    |
      | org.saved1.search8  | dedup_int                            | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| dedup 3 apache.status \| sort by timestamp                                                                                                                                                                                                                                                                    |
      | org.saved1.search9  | dedup_char_keepevents_true           | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| dedup 3 apache.version keepevents=true \| sort by timestamp                                                                                                                                                                                                                                                   |
      | org.saved1.search10 | dedup_char_keepevents_false          | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| dedup 3 apache.version keepevents=false \| sort by timestamp                                                                                                                                                                                                                                                  |
      | org.saved1.search11 | dedup_double_fields_keepevents_true  | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| dedup 3 apache.method, appname keepevents = true \| sort by timestamp                                                                                                                                                                                                                                         |
      | org.saved1.search12 | dedup_double_fields_keepevents_false | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| dedup 3 apache.status, appname keepevents = false \| sort by timestamp                                                                                                                                                                                                                                        |
      | org.saved1.search13 | dedup_keepempty_true                 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_win_sys_20 \| dedup json.Category keepempty = true                                                                                                                                                                                                                                                               |
      | org.saved1.search14 | dedup_keepempty_false                | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_win_sys_20 \| dedup json.Category keepempty = false                                                                                                                                                                                                                                                              |
      | org.saved1.搜索15     | eval_delete_after_where_step2        | starttime=\"now/d\" endtime=\"now/d+24h\" tag:spldelete1                                                                                                                                                                                                                                                                                                                      |
