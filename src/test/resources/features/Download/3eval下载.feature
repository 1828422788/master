@alldownload @dleval
Feature: download_eval下载

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  @dl36
  Scenario Outline: 执行
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "2000" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"

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
#    And I wait for "2000" millsecond
#    Then I compare source download file "expect/<name>.csv" with target download files "<name>.csv"

    Examples:
      | name                                          | splQuery                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
      | lookup_case_sensitive_match_false_sample | \| makeresults \| eval company=\"baidu\" \| lookup DNS, Company /data/rizhiyi/spldata/lookup/dns.csv on company=Company  case_sensitive_match=false |
      | lookup_case_sensitive_match_true_sample | \| makeresults \| eval company=\"baidu\" \| lookup DNS, Company /data/rizhiyi/spldata/lookup/dns.csv on company=Company  case_sensitive_match=true |
      | lookup_case_sensitive_match_false_nodns | \| makeresults \| eval company=\"baidu\" \| lookup dns, Company /data/rizhiyi/spldata/lookup/dns.csv on company=Company  case_sensitive_match=false |
      | lookup_case_sensitive_match_false_nohost | \| makeresults \| eval company=\"baidu\" \| lookup HOST, Company /data/rizhiyi/spldata/lookup/dns.csv on company=Company  case_sensitive_match=false |
      | eval_md5_sha1_sha256_sample | tag:sample04061424 \| eval cip=apache.clientip \| eval r_md5=md5(cip), r_sha1=sha1(cip), r_sha256=sha256(cip) \| table cip,r_md5,r_sha1,r_sha256 |
      | eval_md5_sha1_sha256_sample1 | tag:sample04061424 \| limit 1 \| eval cip=\"All#123456\" \| eval r_md5=md5(cip), r_sha1=sha1(cip), r_sha256=sha256(cip) \| table cip,r_md5,r_sha1,r_sha256 |
      | ipmath_sample | tag:sample04061424 \| sort by apache.x_forward \| limit 1 \| eval cip=apache.clientip \| eval testip=is_valid_ip(cip),r_ip2long=ip2long(cip) \| eval r_long2ip=long2ip(r_ip2long) \| table cip, testip, r_ip2long, r_long2ip |
      | ipmath_expand_ip_range_to_cidr | tag:sample04061424 \| sort by apache.x_forward \| limit 1 \| eval cip=apache.clientip \| eval r_mvappend=mvappend(cip,\"192.168.1.200\") \|eval r_cidr=expand_ip_range_to_cidr(r_mvappend) \| table cip, r_mvappend, r_cidr |
      | distinct_sample | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424* \| stats distinct(timestamp),estdc(timestamp),dc(timestamp) |
      | iplocation_sample | \| makeresults \| eval tmpip=\"1.157.46.56\" \| fields -timestamp \| iplocation tmpip |
      | iplocation_sample1 | \| makeresults \| eval ip=split(\"202.106.0.20 2400:da00::dbf:0:100 117.50.11.11\", \" \")  \| mvexpand ip \| fields -timestamp \| iplocation ip |
      | iplocation_clientip_sample2 | tag:sample04061424 \| sort by apache.x_foward \| table apache.clientip \| iplocation apache.clientip |
      | iplocation_clientip_zero | \| makeresults \| eval ip=0  \| mvexpand ip \| fields -timestamp \| iplocation ip |
      | unpivot_sample | starttime=\"now/d\" endtime=\"now/d+24h\" tag:top_info \| stats avg(json.net.packets_recv), latest('json.net.packets_recv'), es('json.net.packets_recv') \| unpivot |
      | unpivot_bygroup_sample | starttime=\"now/d\" endtime=\"now/d+24h\" tag:top_info \| stats latest('json.disk.used'), es('json.disk.used') by json.disk.path \| unpivot |
      | unpivot_bygroup_header_field | starttime=\"now/d\" endtime=\"now/d+24h\" tag:top_info \| stats latest('json.disk.used'), es('json.disk.used') by json.disk.path \| unpivot header_field=json.disk.path column_name=function |
      | unpivot_bygroup_header_field_unpivot | starttime=\"now/d\" endtime=\"now/d+24h\" tag:top_info \| stats latest('json.disk.used'), es('json.disk.used') by json.disk.path \| unpivot header_field=json.disk.path column_name=function \| unpivot header_field=function |
      | foreach_avg_disk_used | starttime=\"now/d\" endtime=\"now/d+24h\" tag:top_info \| timechart avg(json.disk.used) as a by json.disk.path \| foreach a* [[ eval '<<FIELD>>'='<<FIELD>>'/1024/1024/1024 ]] \| fields -_time |
      | foreach_json_sample | \| makeresults \| eval json.as=\"a\", json.a2=\"b\",json.a3=\"c\" \| foreach json.* [[ eval test = if(empty(test),\"\",tet+\"\")+\"<<FIELD>>\"]] \| fields -timestamp |
      | foreach_apache | tag:sample04061424 \| sort by apache.x_foward \| table apache.geo.l* \| foreach apache.g* [[ eval new_field='<<FIELD>>']] |
      | autofield_jpath_output_city_sample | tag:json_jpath_mv_where \| jpath output=city path=\"a[*].city\" |
      | autofield_spl_eval_empty | tag:sample04061424 \| eval path_is_empty=empty(apache.resp_len) |
      | autofield_spl_eval_match | tag:\"sample04061424\" AND apache.request_query:* \| eval r_match1 = match(apache.request_query, \"b.*e\") |
      | autofield_spl_eval_parse | tag:sample04061424 AND  apache.x_forward:1\| parse \"(?<digital_list>\\\\d+)\" max_match=100 |
      | autofield_spl_eval_kvextract | tag:sample04061424 \| sort by -apache.x_forward \| limit 3 \| kvextract apache.request_query clean_keys=true pairdelim=\"&\" kvdelim=\"=\" |
