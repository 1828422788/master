@dlxtable  @dlxtable1
Feature: download_bucket下载part1

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  Scenario Outline: 下载bucket用例结果
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "2000" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"

    And I wait for "3000" millsecond
    And I wait for "downloadButton" will be visible
    Then take a screenshot with name "spldownload/<name>"
    Then I click the "downloadButton" button
    Then I set the parameter "DownloadName" with value "<name>"
    Then I set the parameter "MaxLineNum" with value "100"
#    Then I choose the "<unit>" from the "MaxLineDropdown"
    Then I choose the "CSV" from the "DocumentTypeList"
    Then I choose the "UTF" from the "DocumentEncodeList"
    Then I click the "CreateDownloadTask" button
    And I wait for "3000" millsecond
#    Then I will see the success message "提交成功，请到设置-下载管理页查看下载状态！"

    #下载到本地
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/#"
    When I set the parameter "DbListPageSearchInput" with value "<name>.csv"
    And I wait for "3000" millsecond
    Given the data name is "<name>.csv" then i click the "下载" button

    Examples:
      | name                                                | splQuery                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
      | autoregress_sample                                  | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_apachesample_dawn \| bucket timestamp span=30m as ts \| stats count(appname) as count_app by ts \| eval time=formatdate(ts,\"HH:mm:ss\") \| autoregress count_app p=6                                                                                                                                                                                                                                                                          |
      | earliest_timestamp_by_ip                            | tag:sample04061424_apachesample_dawn \| stats earliest(timestamp) as earliest_time by apache.clientip \| eval f_earliest_time=formatdate(earliest_time,\"HH:mm:SS\") \| sort by apache.clientip                                                                                                                                                                                                                                                                                                             |
      | latest_timestamp_by_ip                              | tag:sample04061424_apachesample_dawn \| stats latest(timestamp) as latest_time by apache.clientip \| eval f_latest_time =formatdate(latest_time,\"HH:mm:ss.SSS\")                                                                                                                                                                                                                                                                                                                                           |
      | first_timestamp                                     | tag:sample04061424_apachesample_dawn \| stats first(timestamp) as first_time \| eval f_first_time =formatdate(first_time)                                                                                                                                                                                                                                                                                                                                                                                   |
      | first_timestamp_by_ip                               | tag:sample04061424_apachesample_dawn \| stats first(timestamp) as first_time by apache.clientip \| eval f_first_time =formatdate(first_time)                                                                                                                                                                                                                                                                                                                                                                |
      | last_timestamp                                      | tag:sample04061424_apachesample_dawn \| stats last(timestamp) as last_time \| eval f_last_time =formatdate(last_time)                                                                                                                                                                                                                                                                                                                                                                                       |
      | last_timestamp_by_ip                                | tag:sample04061424_apachesample_dawn \| stats last(timestamp) as last_time by apache.clientip \| eval f_last_time=formatdate(last_time)                                                                                                                                                                                                                                                                                                                                                                     |
      | makecontinuous_sample                               | \| makeresults count=2 \| streamstats count() as cnt \| eval time=case(cnt==2,relative_time(now(),\"+1d\"), cnt==1, now()) \| makecontinuous time span=3h                                                                                                                                                                                                                                                                                                                                                   |
      | timechart_timewrap_align_now                        | starttime=\"now/d\" tag:sample04061424_display \| timechart span=1h count() as cnt \| timewrap 8h align=now                                                                                                                                                                                                                                                                                                                                                                                                 |
      | timechart_span12h_timewrap_1d                       | starttime=\"now-7d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=12h count() as cnt  \| timewrap 1d                                                                                                                                                                                                                                                                                                                                                                                  |
      | timechart_span1h_timewrap_1d                        | starttime=\"now-3d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=1h count() as cnt \| timewrap 1d                                                                                                                                                                                                                                                                                                                                                                                    |
      | timechart_span1h_timewrap_3d                        | starttime=\"now-7d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=1h count() as cnt max(apache.resp_len) as max_len by apache.status \| timewrap 3d                                                                                                                                                                                                                                                                                                                                   |
