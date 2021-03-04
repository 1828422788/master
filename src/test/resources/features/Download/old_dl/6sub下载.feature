@db1
Feature: 新建下载任务

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"

  @v35dbsub
  Scenario Outline: 新建下载任务3个
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "2000" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"

    And I wait for "2000" millsecond
    Then I click the "DownloadEvent" button
    Then I set the parameter "DownloadName" with value "<name>"
    Then I set the parameter "MaxLineNum" with value "100"
#    Then I choose the "<unit>" from the "MaxLineDropdown"
    Then I choose the "TXT" from the "DocumentTypeList"
    Then I choose the "UTF" from the "DocumentEncodeList"
    Then I click the "CreateDownloadTask" button
    And I wait for "2000" millsecond
    Then I will see the success message "提交成功，请到设置-下载管理页查看下载状态！"

    #下载到本地
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/#"
    When I set the parameter "DbListPageSearchInput" with value "<name>"
    And I wait for "1000" millsecond
    Given the data name is "<name>.txt" then i click the "下载" button
    And I wait for "1000" millsecond
    Then I compare source download file "expect/<name>.txt" with target download files "<name>.txt"

    Examples: 新建成功
      | name                                         | splQuery                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
      | sub_count | (logtype:apache AND tag:\"sample04061424\") AND [[ appname:apache \| stats count(apache.method) as method_count by apache.method \|  sort by method_count \| limit 1 \| fields apache.method]] |
      | sub4 | (logtype:apache AND tag:\"sample04061424\") AND [[ appname:apache \| stats count(apache.method) as method_count by apache.method \| sort by method_count \| limit 1 \| fields apache.method]] |
      | sub5 | (logtype:apache AND tag:\"sample04061424\") AND [[ logtype:apache AND [[ * \| stats count(appname) by apache.method \| fields apache.method \| limit 2 ]] \| stats count(appname) as appcount by apache.method \| fields apache.method ]] |
      | sub6 | (logtype:apache AND tag:\"sample04061424\") AND [[ logtype:apache AND [[ * \| stats count(appname) by apache.method \| fields apache.method \| limit 2 ]] \| stats count(appname) as appcount by apache.method \| fields apache.method ]] |
      | sub7 | (logtype:apache AND tag:\"sample04061424\") AND [[ * \| stats es(apache.status) as es_status by apache.method \| fields apache.method ]] |
      | sub_download | [[ tag:\"sample04061424\"\| stats avg(apache.resp_len) as avg_len by apache.clientip \| sort by +avg_len ]] \| sort by timestamp |
      | sub_sample | tag:\"sample04061424\" AND [[ tag:\"sample04061424\"  \| stats count(apache.clientip) as count_ by apache.clientip \| sort by count_ \| limit 1 \| fields apache.clientip ]] |
      | sub_sample1 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\" AND [[ tag:\"sample04061424\"\| stats count(apache.clientip) by apache.clientip, apache.method \| limit 2 \| fields apache.clientip apache.method ]] |
      | sub_sample2 | [[ tag:\"sample04061424\"  \| stats count(apache.clientip) as count_ by apache.clientip \| sort by count_ \| limit 1  ]] |
      | sub_es | tag:\"sample04061424\" AND [[tag:\"sample04061424\" \| stats es(apache.status) by apache.method \| fields apache.method]] |
      | sub_nest_2 | starttime=\"-d/d\" endtime=\"now/d\" tag:\"sample04061424\" \| append [[ starttime=\"-5h\" endtime=\"now\" tag:\"sample04061424\" apache.status:200 AND apache.method:\"GET\" \| append [[ tag:\"sample04061424\" \| stats count() as cnt by apache.status]] ]] |
      | sub_join_left2 | tag:\"sample04061424\"\| fields apache.method apache.clientip \| join type=left apache.clientip [[ tag:\"sample04061424\" \| stats sum(apache.status) by apache.clientip ]] |
      | sub_join_inner3 | starttime = \"-1d/d\" endtime = \"now/d\" tag:\"sample04061424\" \| fields apache.clientip, apache.method \| join type=inner apache.clientip [[starttime = \"now/d\" endtime = \"now/d+24h\" tag:\"sample04061424\" \| stats avg(apache.status) as sub_status by apache.clientip ]] |
      | sub_join_left3 | starttime = \"-1d/d\" endtime = \"now/d\" tag:\"sample04061424\" \| bucket timestamp span=1h as ts \| stats count() as ip_count by apache.clientip,ts \| join type=left ts [[starttime = \"-1d/d\" endtime = \"now/d\" tag:\"sample04061424\" \| bucket timestamp span=1h as ts \| stats count() as hour_count by ts ]] \| eval ippercent=100 * ip_count / hour_count \| eval r_fomart = formatdate(ts,\"HH:mm:ss\") |
      | append_bucket_bucket | starttime=\"now/d\" endtime=\"now/d+12h\" tag:\"sample04061424_display\" \| bucket timestamp span=1h as ts \| stats max(apache.resp_len) as count_1 by ts \| eval time=formatdate(ts, \"HH:mm:ss.SSS\") \| eval line=\"max_line\" \| append [[starttime=\"now/d\" endtime=\"now/d+12h\" tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.resp_len) as count_2 by ts \| eval time=formatdate(ts, \"HH:mm:ss.SSS\") \| eval line=\"count_line\" ]] |
      | sub_where_count_big5 | (apache.resp_len:69 AND tag:\"sample04061424\") AND [[tag:\"sample04061424\" \| stats count(apache.clientip) as count_ by apache.clientip,apache.method \| where count_>5 \| fields apache.clientip,apache.method ]] |
      | append_bucket_stats_mathematical | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_chart\" \| bucket timestamp span=1h as ts \| stats avg(apache.resp_len) as stats_resplen by ts \| eval time=formatdate(ts,\"HH\") \| eval line=\"avg_line\" \| append [[starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats max(apache.resp_len) as stats_resplen by ts \| eval time=formatdate(ts,\"HH\") \| eval line=\"max_line\"]] \| append [[starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats min(apache.resp_len) as stats_resplen by ts \| eval time=formatdate(ts,\"HH\") \| eval line=\"min_line\" ]] |


