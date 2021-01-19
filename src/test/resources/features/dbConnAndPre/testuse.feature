@vdl
Feature: 处理下载结果

  Background:
    Given open the "splSearch.OfflineTaskPageNohup" page for uri "/download/#"

  @vdltable0
  Scenario Outline: 下载比较
    Then I compare source download file "<name>.csv" with target download files "<name>.csv"

    Examples:
      | name                                                   | splQuery                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
      | eval_noempty_logic_and | tag:sample04061424 \| eval bool_is_empty=empty(apache.request_path) \| eval bool_not_empty=! empty(apache.request_path) \| eval bool_is_false= false && empty(apache.request_path) \| table bool_is_empty, bool_not_empty,bool_is_false, apache.x_forward \| sort by  apache.x_forward |
      | eval_relation | tag:sample04061424 \| eval r1_not200=apache.status!=200 \| eval r2_is200=apache.status==200 \| eval r3_big200=apache.status>200 \| eval r4_bigequal200=apache.status>=200 \| eval r5_small200=apache.status<200 \| eval r6_smallequal200=apache.status<=200 \| table r1_not200,r2_is200,r3_big200, r4_bigequal200,r5_small200,r6_smallequal200,apache.status \| sort by apache.status |
      | eval_connect_table_sort | tag:sample04061424 \| eval ret_connect = appname + apache.clientip + apache.method + \"科罗拉多斯普林斯\"  \| table ret_connect \| sort by ret_connect |

  @vdltable
  Scenario Outline: 下载比较
    Then I compare source download file "<name>.csv" with target download files "<name>.csv"

    Examples:
      | name                                                   | splQuery                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
    # | sub_join_left_if_divide | tag:sample04061424 \| stats count(logtype) as count_all by apache.clientip \| sort by count_all \| limit 5 \| join type=left apache.clientip [[logtype:\"apache\" AND apache.status:[400 TO 499]\|stats count(logtype) as count_400 by apache.clientip]]\|join type=left apache.clientip [[logtype:\"apache\" AND apache.status:[500 TO 599]\|stats count(logtype) as count_500 by apache.clientip]]\|join type=left apache.clientip [[logtype:\"apache\" AND apache.resp_len:>1000\|stats count(logtype) as len_1000 by apache.clientip]]\|eval rate_400=if(empty(count_400),0,count_400/count_all)\|eval rate_500=if(empty(count_500),0,count_500/count_all)\|eval rate_len_1000=if(empty(len_1000),0,len_1000/count_all) |
      | eval_noempty_logic_and | tag:sample04061424 \| eval bool_is_empty=empty(apache.request_path) \| eval bool_not_empty=! empty(apache.request_path) \| eval bool_is_false= false && empty(apache.request_path) \| table bool_is_empty, bool_not_empty,bool_is_false, apache.x_forward \| sort by  apache.x_forward |
      | eval_relation | tag:sample04061424 \| eval r1_not200=apache.status!=200 \| eval r2_is200=apache.status==200 \| eval r3_big200=apache.status>200 \| eval r4_bigequal200=apache.status>=200 \| eval r5_small200=apache.status<200 \| eval r6_smallequal200=apache.status<=200 \| table r1_not200,r2_is200,r3_big200, r4_bigequal200,r5_small200,r6_smallequal200,apache.status \| sort by apache.status |
      | eval_connect_table_sort | tag:sample04061424 \| eval ret_connect = appname + apache.clientip + apache.method + \"科罗拉多斯普林斯\"  \| table ret_connect \| sort by ret_connect |
      | eval_math_add_bracket | tag:sample04061424 \| eval r_len=apache.resp_len \| eval r_status=apache.status \| eval status_add10=apache.status+10 \| eval r_plus=apache.resp_len+apache.status \| eval r_plus_bracket=(apache.resp_len+apache.status)*r_status \| table r_len, r_status,status_add0, r_plus, r_plus_bracket, apache.x_forward \| sort by  apache.x_forward |
      | eval_ceil_floor_min_max_log | tag:sample04061424_json_sdyd_41 \| sort by json.purePathId \| limit 10 \|  eval r_ceil_cpuTime=ceil(json.cpuTime) \| eval r_floor_cpuTime=floor(json.cpuTime) \| eval r_min=min(json.execTime,json.responseTime) \| eval r_max=max(json.execTime,json.responseTime) \| eval r_log_responseTime=log(json.responseTime) \| table json.cpuTime, json.execTime, json.responseTime, r_ceil_cpuTime, r_floor_cpuTime, r_min, r_max, r_log_responseTime, json.purePathId |
      | eval_coalesce_sample | tag:sample04061424 \| eval ret_path=coalesce(apache.request_path,apache.referer) \| table ret_path, apache.x_forward \| sort by  apache.x_forward |
