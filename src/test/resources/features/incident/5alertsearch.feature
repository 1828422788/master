@alertsearch
Feature: 监控搜索界面

  Background:
    Given open the "incident.AlertSearchPage" page for uri "/app/incident/alertsearch/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  Scenario Outline: 下载table用例结果
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "2000" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"

    And I wait for "2000" millsecond
    And I wait for "downloadButton" will be visible
    Then take a screenshot with name "incident/<name>"
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

    Examples: 新建成功
      | name                                                   | splQuery                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
       #正常结果
      #custom_info.alert_name: api00_spl统计_按行发送_抑制翻倍_cnt_10-59min_无分组 | table manager,summary
      | fillnull_string_to_resplen_sample | custom_info.alert_name: api00_spl统计_按行发送_抑制翻倍_cnt_10-59min_无分组 \| table manager,summary |
      #appname: alertcef | limit 100 | table ip

      | eval_noempty_logic_and | tag:sample04061424 \| eval bool_is_empty=empty(apache.request_path) \| eval bool_not_empty=! empty(apache.request_path) \| eval bool_is_false= false && empty(apache.request_path) \| table bool_is_empty, bool_not_empty,bool_is_false, apache.x_forward \| sort by  apache.x_forward |
      | eval_relation | tag:sample04061424 \| eval r1_not200=apache.status!=200 \| eval r2_is200=apache.status==200 \| eval r3_big200=apache.status>200 \| eval r4_bigequal200=apache.status>=200 \| eval r5_small200=apache.status<200 \| eval r6_smallequal200=apache.status<=200 \| table r1_not200,r2_is200,r3_big200, r4_bigequal200,r5_small200,r6_smallequal200,apache.status \| sort by apache.status |
      | eval_connect_table_sort | tag:sample04061424 \| eval ret_connect = appname + apache.clientip + apache.method + \"科罗拉多斯普林斯\"  \| table ret_connect \| sort by ret_connect |
      | eval_math_add_bracket | tag:sample04061424 \| eval r_len=apache.resp_len \| eval r_status=apache.status \| eval status_add10=apache.status+10 \| eval r_plus=apache.resp_len+apache.status \| eval r_plus_bracket=(apache.resp_len+apache.status)*r_status \| table r_len, r_status,status_add0, r_plus, r_plus_bracket, apache.x_forward \| sort by  apache.x_forward |
      | eval_ceil_floor_min_max_log | tag:sample04061424_json_sdyd_41 \| sort by json.purePathId \| limit 10 \|  eval r_ceil_cpuTime=ceil(json.cpuTime) \| eval r_floor_cpuTime=floor(json.cpuTime) \| eval r_min=min(json.execTime,json.responseTime) \| eval r_max=max(json.execTime,json.responseTime) \| eval r_log_responseTime=log(json.responseTime) \| table json.cpuTime, json.execTime, json.responseTime, r_ceil_cpuTime, r_floor_cpuTime, r_min, r_max, r_log_responseTime, json.purePathId |
      | eval_coalesce_sample | tag:sample04061424 \| eval ret_path=coalesce(apache.request_path,apache.referer) \| table ret_path, apache.x_forward \| sort by  apache.x_forward |
      | eval_empty_sample | tag:sample04061424 \| eval path_is_empty=empty(apache.referer_domain) \| table path_is_empty, apache.referer_domain, apache.x_forward \| sort by  apache.x_forward |
      | eval_empty_resp_len | tag:sample04061424 \| eval path_is_empty=empty(apache.resp_len) \| table path_is_empty, apache.x_forward \| sort by  apache.x_forward |
      | eval_2if | tag:sample04061424 \| eval ret_equal200=if(apache.status==200,\"equal200\",\"not_200\") \| eval ret_larger=if(apache.status>200,\"larger200\",\"not larger\") \| table apache.status, ret_equal200, ret_larger, apache.x_forward \| sort by  apache.x_forward |
      | eval_math_stats | tag:sample04061424 \| eval new_len = 1000 + apache.resp_len \| stats count(new_len) |
      | eval_case_stats_count | (logtype:apache AND tag:sample04061424) \| eval desc=case(apache.resp_len<0,\"nagetive\",apache.resp_len<100,\"low\",apache.resp_len>2000,\"high\",empty(apache.resp_len),\"Not found\",default,\"middle\") \| stats count(desc) by desc |
      | eval_tolong | (logtype:apache AND tag:sample04061424) \| eval int_status= tolong(apache.status) \| table int_status, apache.x_forward \| sort by  apache.x_forward |
      | eval_if_nest_empty_top | tag:sample04061424 \| eval len=if(empty(apache.resp_len),0,1) \| stats top(len,10) |
      | eval_empty_if_where | tag:sample04061424 \| eval is_resplen_empty=empty(apache.resp_len) \| eval res_str=if(is_resplen_empty,\"repslen_empty\",\"resplen_non_null\") \| table apache.resp_len, is_resplen_empty, res_str \| where is_resplen_empty==true |
      | add_1 | tag:sample04061424 AND apache.resp_len:>2000 \| eval resplen=apache.resp_len \| eval status=apache.status \| eval mid=apache.resp_len+apache.status \| eval res_mul=(apache.resp_len+apache.status)*apache.status \| table resplen, status, mid, res_mul, apache.x_forward \| sort by  apache.x_forward |
