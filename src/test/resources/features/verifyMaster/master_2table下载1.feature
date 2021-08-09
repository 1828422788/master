@master0
Feature: download_table下载part1

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  Scenario Outline: 下载table用例结果
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "5000" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then take a screenshot with name "spldownload/<name>"

    And I wait for "2000" millsecond
    When I wait for "SaveAsOther" will be visible
    And I choose the "下载" from the "SaveAsList"
    And I wait for "1000" millsecond

    And I set the parameter "DownloadName" with value "<name>"
    And I set the parameter "MaxLineNum" with value "<maxLineNum>"
#    Then I choose the "<unit>" from the "MaxLineDropdown"
    And I choose the "CSV" from the "DocumentTypeList"
    And I wait for "2000" millsecond
    And I choose the "UTF-8" from the "DocumentEncodeList"
    And I wait for "2000" millsecond
    When I click the "CreateDownloadTask" button
#    And I wait for "2000" millsecond
#    Then I will see the success message "提交成功，请到设置-下载管理页查看下载状态！"

    #下载到本地
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/#"
    When I set the parameter "DbListPageSearchInput" with value "<name>.csv"
    And I wait for "2000" millsecond
#    Given the data name is "<name>.csv" then i click the "下载" button
    And I click the "ListDownloadButton" button

    Examples: 新建成功
      | maxLineNum | name                                          | splQuery                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
      | 100        | eval_addinfo_sample                           | tag:sample04061424 \| sort by apache.x_forward \| limit 5 \| addinfo \| table info*                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
      | 100        | time_sequence                                 | tag:sample04061424_apachesample_dawn AND apache.resp_len:* \| eval res_reduce_time = collector_recv_timestamp - agent_send_timestamp \| eval f_timestamp = formatdate(timestamp,\"HH:mm:ss\")  \| table res_reduce_time, f_timestamp, agent_send_timestamp, collector_recv_timestamp \| where agent_send_timestamp<collector_recv_timestamp \|\|  agent_send_timestamp==collector_recv_timestamp                                                                                                                                                                                                                                                                                                      |
      | 100        | map_sample1                                   | tag:sample04061424 \| table hostname, apache.status \| limit 1 \| map \"tag:sample04061424 hostname:$hostname$ apache.status:>$apache.status$ \" \| table apache.clientip, apache.geo.latitude, apache.geo.longitude, apache.request_path,apache.resp_len,apache.x_forward                                                                                                                                                                                                                                                                                                                                                                                                                            |
      | 100        | mv_mvszip_traceip_sample                      | tag:traceip_list_3 \| eval kvpair=mvszip(json.traceip, json.cost,\"zzz\") \| table kvpair \| sort by kvpair                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
      | 100        | geostats_sample_count                         | tag:vendors_461 \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude count() as cnt \| limit 15                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
      | 100        | eval_if_stats_count                           | (logtype:apache AND tag:sample04061424) \| eval desc = if (apache.status==200, \"OK\", \"Error\") \| stats count(desc) by desc                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
      | 100        | append_sample                                 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| stats avg(apache.resp_len) as avg_resp_len \| append [[ starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats avg(apache.resp_len) as avg_resp_len \| append [[ starttime=\"now/d\" endtime=\"now/d+24h\"  tag:sample04061424 \| stats avg(apache.resp_len) as avg_resp_len]] ]]                                                                                                                                                                                                                                                                                                                        |
      | 100        | rename_apache_bucket_span1h_count_formatdate  | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| rename apache.c* as * \| bucket timestamp span=1h as ts \| stats count(lientip) as c_ip by ts \| eval f_timestamp = formatdate(ts,\"HH\") \| eval aa=tolong(f_timestamp)                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
      | 100        | gf_dapper_tracing                             | tag:gf_dapper* AND dapper.msg.traceId:\"511f8756ce1d0b8a\" dapper.msg.duration:>0 \| table dapper.msg.id, dapper.msg.parentId, dapper.class, dapper.msg.duration, dapper.msg.timestamp, dapper.msg.binaryAnnotations[].value, collector_recv_timestamp \| sort by dapper.msg.id                                                                                                                                                                                                                                                                                                                                                                                                                       |
