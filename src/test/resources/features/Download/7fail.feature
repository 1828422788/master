Feature: fail待修改

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
#    And I drag the element "SearchPageSvg" to the "left" side

  @dlfail0
  Scenario Outline: 执行
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "2000" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"

    And I wait for "1000" millsecond
    And I wait for "downloadButton" will be visible
    Then I click the "downloadButton" button
    Then I set the parameter "DownloadName" with value "<name>"
    Then I set the parameter "MaxLineNum" with value "100"
#    Then I choose the "<unit>" from the "MaxLineDropdown"
    Then I choose the "CSV" from the "DocumentTypeList"
    Then I choose the "UTF" from the "DocumentEncodeList"
    Then I click the "CreateDownloadTask" button
    And I wait for "2000" millsecond
    Then I will see the success message "提交成功，请到设置-下载管理页查看下载状态！"

    #下载到本地
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/#"
    When I set the parameter "DbListPageSearchInput" with value "<name>.csv"
    And I wait for "1000" millsecond
    Given the data name is "<name>.csv" then i click the "下载" button
#    And I wait for "1000" millsecond
#    Then I compare source download file "expect/<name>.json" with target download files "<name>.json"

    Examples: 新建成功
      | name                                         | splQuery                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
      | mvrange_step_minus | tag:sample04061424 \| eval base=mvrange(10,2,-3) \| table base |
      | mvfilter_sample | tag:sample04061424 AND apache.referer_domain:m5.baidu.com \| eval m_referers=split(apache.referer, \"%\") \| eval m_referers_filter = mvfilter(m_referers, _x == \"E4\") \| table apache.referer, m_referers, m_referers_filter |
      | mvjoin_sample | tag:sample04061424 \| eval m_ips=split(apache.clientip, \".\") \| eval m_ips_join = mvjoin(m_ips, \", \") \| table m_ips,m_ips_join |
      | mvfind_from0 | tag:sample04061424 AND apache.referer_domain:m5.baidu.com  \| eval m_referers=split(apache.referer, \"%\") \| eval m_referers_find=mvfind(m_referers, \"http://m5.baidu.com/s?from=124n&word=\") \| table m_referers, m_referers_find |
      | mvdedup | tag:sample04061424 AND apache.referer_domain:m5.baidu.com \| eval m_referers=split(apache.referer, \"%\") \| eval r_dup = mvdedup(m_referers) \| table m_referers, r_dup |
      | mv_where_split | tag:sample04061424 \| where !empty(apache.request_query) \| eval m_querys = split(apache.request_query, \"=\") \| table m_querys,apache.request_query |
      | spl_rangeline_outlier_not_all_0 | tag:sample04061424_display \| bucket timestamp span=3h as ts\| stats count(appname) as count_ by ts\| movingavg count_,5 as ma\| rollingstd count_,5 as rs\| eval lower=ma-1*rs\| eval upper=ma+1*rs\| eval outlier=if(count_>upper\|\|count_<lower, count_, 0) |
      | eval_match_query | tag:sample04061424 AND apache.request_query:* \| eval r_match1 = match(apache.request_query, \"b.*e\") \| eval r_match2 = match(apache.request_query, \"^bcd\") \| table apache.request_query, r_match1, r_match2, apache.x_forward \| sort by  apache.x_forward |

  @dlfail1
  Scenario Outline: 执行
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "2000" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"

    And I wait for "1000" millsecond
    And I wait for "downloadButton" will be visible
    Then I click the "downloadButton" button
    Then I set the parameter "DownloadName" with value "<name>"
    Then I set the parameter "MaxLineNum" with value "100"
#    Then I choose the "<unit>" from the "MaxLineDropdown"
    Then I choose the "CSV" from the "DocumentTypeList"
    Then I choose the "UTF" from the "DocumentEncodeList"
    Then I click the "CreateDownloadTask" button
    And I wait for "2000" millsecond
    Then I will see the success message "提交成功，请到设置-下载管理页查看下载状态！"

    #下载到本地
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/#"
    When I set the parameter "DbListPageSearchInput" with value "<name>.csv"
    And I wait for "1000" millsecond
    Given the data name is "<name>.csv" then i click the "下载" button
#    And I wait for "1000" millsecond
#    Then I compare source download file "expect/<name>.json" with target download files "<name>.json"

    Examples: 新建成功
      | name                                         | splQuery                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
      | map_index_param                              | index=* tag:\"sample04061424_chart\" \| stats min(timestamp) as min_time, max(timestamp) as max_time \| eval start=min_time - 30*1000 \| eval start_f = formatdate(tolong(start), \"yyyy-MM-dd:HH:mm:ss\") \| eval end_f = formatdate(tolong(max_time+60000), \"yyyy-MM-dd:HH:mm:ss\") \| eval index_name=\"index\" \| map \" $index_name$=* starttime=$start_f$ endtime=$end_f$ tag:sample04061424* \" \| fields tag, apache.resp_len, apache.clientip, apache.x_forward, apache.request_query, apache.referer, timestamp \| sort by timestamp, apache.x_forward |
      | parse_chinese_char_maxmatch100_exceed_rawlen | tag:sample04061424_chinese_5 \| limit 1 \| parse field=raw_message \"(?<first_chinese_char>[\u4e00-\u9fa5])\" max_match=100 \| table first_chinese_char                                                                                                                                                                                                                                                                                                                                                                                                           |
      | parse_to_table                               | tag:sample04061424 \| parse \"(?<digital_list>\d+)\" max_match=5 \| table digital_list, apache.x_forward \| sort by  apache.x_forward                                                                                                                                                                                                                                                                                                                                                                                                                             |
      | mv_split_sample                              | tag:\"sample04061424\" \| eval m_ips=split(apache.clientip, \".\") \| eval m_paths=split(apache.request_path, \"/\") \| table m_ips, m_paths                                                                                                                                                                                                                                                                                                                                                                                                                      |
      | mvcount                                      | tag:\"sample04061424\" \| eval m_ips=split(apache.clientip, \".\") \| eval m_paths=split(apache.request_path, \"/\") \| eval m_ips_count = mvcount(m_ips) \| eval m_paths_count = mvcount(m_paths)  \| table m_ips, m_paths,m_ips_count, m_paths_count                                                                                                                                                                                                                                                                                                            |
      | mvappend                                     | tag:\"sample04061424\" \| eval m_ips=split(apache.clientip, \".\") \| eval m_paths=split(apache.request_path, \"/\") \| eval m_ips_count = mvcount(m_ips) \| eval m_paths_count = mvcount(m_paths)  \| eval r_count_append=mvappend('m_ips_count', 'm_paths_count') \| table m_ips_count, m_paths_count, r_count_append                                                                                                                                                                                                                                           |
      | mvfind_from1                                 | tag:\"sample04061424\" AND apache.referer_domain:m5.baidu.com  \| eval m_referers=split(apache.referer, \"%\") \| eval m_referers_find=mvfind(m_referers, \"http://m5.baidu.com/s?from=124n&word=ii\") \| table m_referers, m_referers_find                                                                                                                                                                                                                                                                                                                       |
      | mvindex_sample_1_4                           | tag:\"sample04061424\" AND apache.referer_domain:m5.baidu.com  \| eval m_referers=split(apache.referer, \"%\") \| eval m_referers_index= mvindex(m_referers, 1,4) \| table m_referers, m_referers_index                                                                                                                                                                                                                                                                                                                                                           |
      | mv_msort_int                                 | tag:\"sample04061424\" \| eval m_ips=split(apache.clientip, \".\") \| eval r_mvsort= mvsort(m_ips) \| table m_ips, r_mvsort \| sort by +apache.x_forward                                                                                                                                                                                                                                                                                                                                                                                                          |
      | mvzip_sample1                                | tag:\"sample04061424\" \| eval m_ips=split(apache.clientip, \".\") \| eval m_paths=split(apache.request_path, \"/\") \| eval r_zips = mvzip(m_ips,m_paths) \| eval zips_count = mvcount(r_zips) \| eval zips_idx=mvindex(r_zips,2) \| table m_ips, m_paths, r_zips, zips_count,zips_idx                                                                                                                                                                                                                                                                           |
      | mvfilter_sample1                             | tag:\"sample04061424\" AND apache.referer_domain:m5.baidu.com \| eval m_referers=split(apache.referer, \"%\") \| eval m_referers_filter = mvfilter(m_referers, _x == \"E4erqe\") \| table apache.referer, m_referers, m_referers_filter                                                                                                                                                                                                                                                                                                                           |
      | mv_mvrange_step_add2                         | tag:\"sample04061424\" \| eval base=mvrange(1,6,2) \| table base                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
      | map_sample1                                  | tag:\"sample04061424\" \| table hostname, apache.status \| limit 1 \| map \"tag:\"sample04061424\" hostname:$hostname$ apache.status:>$apache.status$ \"                                                                                                                                                                                                                                                                                                                                                                                                          |
      | map_stats_two_fields_rename_clientip         | tag: sample04061424 \| stats count() by apache.clientip, apache.resp_len \| fields apache.clientip, apache.resp_len \| rename apache.clientip as src_ip \| map \"raw_message:$src_ip$\" \| fields hostname, appname, raw_message                                                                                                                                                                                                                                                                                                                                  |
      | map_sample4                                  | tag:\"sample04061424\" \| stats max(timestamp) as max_time \| eval start=max_time \| eval start_f = formatdate(tolong(start-5*360000), \"yyyy-MM-dd:HH:mm:ss\")  \| eval end_f = formatdate(tolong(max_time+360000), \"yyyy-MM-dd:HH:mm:ss\")  \|  map \" starttime=$start_f$ endtime=$end_f$ tag:\"sample04061424\"  AND \"android\" \"                                                                                                                                                                                                                          |