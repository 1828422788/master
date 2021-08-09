@master0
Feature: download_table下载part0

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    Given I wait for loading complete
#    And I wait for element "SearchStatus" change text to "搜索完成!"

  Scenario Outline: 下载table用例结果
    Given I set the parameter "SearchInput" with value "<splQuery>"
    When I click the "DateEditor" button
    When I click the "Today" button
    When I click the "SearchButton" button
    And I wait for "5000" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then take a screenshot with name "spldownload/<name>"

    And I wait for "2000" millsecond
    And I wait for "saveAsOther" will be visible
    And I choose the "下载" from the "SaveAsList"
    And I wait for "1000" millsecond
    
    And I set the parameter "DownloadName" with value "<name>"
    And I set the parameter "MaxLineNum" with value "100"
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
      | name                                                   | splQuery                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
      | eval_empty_resp_len | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| eval path_is_empty=empty(apache.resp_len) \| table path_is_empty, apache.x_forward \| sort by  apache.x_forward |
      | eval_math_stats | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| eval new_len = 1000 + apache.resp_len \| stats count(new_len) |
      | eval_case_stats_count | starttime=\"now/d\" endtime=\"now/d+24h\" (logtype:apache AND tag:sample04061424) \| eval desc=case(apache.resp_len<0,\"nagetive\",apache.resp_len<100,\"low\",apache.resp_len>2000,\"high\",empty(apache.resp_len),\"Not found\",default,\"middle\") \| stats count(desc) by desc |
      | chart_sample_noparam | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| chart max(apache.status) as ma count() as cnt |
      | kvextract_request_query_sample | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| sort by -apache.x_forward \| limit 3 \| kvextract apache.request_query clean_keys=true pairdelim=\"&\" kvdelim=\"=\" \| table gw_address, gw_id, gw_port, mac, url |
      | eval_path_xml_heading_sample | starttime=\"now/d\" endtime=\"now/d+24h\" tag:xml_sample_1 \| xpath input=raw_message output=xmlheading path=\"/note/heading\" \| table xmlheading |
      | mv_split_sample | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| eval m_ips=split(apache.clientip, \".\") \| eval m_paths=split(apache.request_path, \"/\") \| table m_ips, m_paths |
      | stats_top | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| stats top(apache.status,2) |
      | stats_hg | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| stats hg(apache.status,50) |
      | stats_pct | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| stats pct(raw_message_length,1,5,25,50,75,95,99) |
      | top_1_resp_len | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| top 50 apache.resp_len \| sort by count, apache.resp_len |
      | tran_stats_cmd_limit | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| transaction apache.status, apache.method \| stats count() as cnt |
