@all @searchMacro @newmacro
Feature: 搜索宏新建

  @newmacro1
  Scenario Outline: 创建eval定义的宏-2个
    Given open the "macroSearch.ListPage" page for uri "/macro/"

  Scenario Outline: 验证1-2个参数
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
#    And I save the result "{'ClientIp':'Column1','Version':'Column2','Count':'Column3'}"

    And I wait for "2000" millsecond
    And I wait for "downloadButton" will be visible
    Then I click the "downloadButton" button
    Then I set the parameter "DownloadName" with value "macro_<name>"
    Then I set the parameter "MaxLineNum" with value "100"
#    Then I choose the "<unit>" from the "MaxLineDropdown"
    Then I choose the "CSV" from the "DocumentTypeList"
    Then I choose the "UTF" from the "DocumentEncodeList"
    Then I click the "CreateDownloadTask" button
#    And I wait for "2000" millsecond
#    Then I will see the success message "提交成功，请到设置-下载管理页查看下载状态！"

    #下载到本地
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/#"
    When I set the parameter "DbListPageSearchInput" with value "macro_<name>.csv"
    And I wait for "2000" millsecond
    Given the data name is "macro_<name>.csv" then i click the "下载" button

    And I set the parameter "SearchInput" with value "<splQuery1>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
#    Then I compare with "{'ClientIp':'Column1','Version':'Column2','Count':'Column3'}"
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

    Examples:
      | name | splQuery                                        | splQuery1                                                                                                                                     |
      | n1   | `macrosample_1param(\"23.166.125.53\")`         | tag:sample04061424 \| stats count() by apache.clientip, apache.version \| where apache.clientip==\"23.166.125.53\"                            |
      | n1   | `macrosample_2param(\"23.166.125.53\",\"1.1\")` | tag:sample04061424 \| stats count() by apache.clientip, apache.version \| where apache.clientip==\"23.166.125.53\" && apache.version==\"1.1\" |


  Scenario Outline: 验证1-2个参数
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "`<name>`"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
#    And I save the result "{'ClientIp':'Column1','Version':'Column2','Count':'Column3'}"

    And I wait for "2000" millsecond
    And I wait for "downloadButton" will be visible
    Then I click the "downloadButton" button
    Then I set the parameter "DownloadName" with value "macro_<name>"
    Then I set the parameter "MaxLineNum" with value "100"
#    Then I choose the "<unit>" from the "MaxLineDropdown"
    Then I choose the "CSV" from the "DocumentTypeList"
    Then I choose the "UTF" from the "DocumentEncodeList"
    Then I click the "CreateDownloadTask" button
#    And I wait for "2000" millsecond
#    Then I will see the success message "提交成功，请到设置-下载管理页查看下载状态！"

    #下载到本地
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/#"
    When I set the parameter "DbListPageSearchInput" with value "macro_<name>.csv"
    And I wait for "2000" millsecond
    Given the data name is "macro_<name>.csv" then i click the "下载" button

    And I set the parameter "SearchInput" with value "<splQuery1>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
#    Then I compare with "{'ClientIp':'Column1','Version':'Column2','Count':'Column3'}"
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

    Examples:
      | name                                        | splQuery1                                                                                                                                     |
      | lookup_stats                                | tag:"sample04061424" \| stats count() by hostname \| lookup user,department /data/rizhiyi/share/host_user.csv on hostname = host                                                                                                                                                                                                         |                    |                   |
      | mvcount                                     | tag:"sample04061424" \| eval m_ips=split(apache.clientip, ".") \| eval m_paths=split(apache.request_path, "/") \| eval m_ips_count = mvcount(m_ips) \| eval m_paths_count = mvcount(m_paths)  \| table m_ips, m_paths,m_ips_count, m_paths_count                                                                                         |                    |                   |
      | noparam                                     | tag:sample04061424 \| stats count() by apache.clientip, apache.version \| where apache.clientip=="23.166.125.53"                                                                                                                                                                                                                         |                    |                   |
      | sub_nest_2                                  | starttime="-d/d" endtime="now/d" tag:"sample04061424"  \| append [[ starttime="-5h" endtime="now" tag:"sample04061424" apache.status:200 AND apache.method:"GET" \| append [[ tag:"sample04061424" \| stats count() as cnt by apache.status]] ]]                                                                                         |                    |                   |
      | tran_count                                  | tag:sample04061424 \| `makesession` \| stats count(apache.clientip)                                                                                                                                                                                                                                                                      |                    |                   |
      | mvappend                                    | tag:"sample04061424" \| eval m_ips=split(apache.clientip, ".") \| eval m_paths=split(apache.request_path, "/") \| eval m_ips_count = mvcount(m_ips) \| eval m_paths_count = mvcount(m_paths)  \| eval r_count_append=mvappend('m_ips_count', 'm_paths_count') \| table m_ips_count, m_paths_count, r_count_append                        |                    |                   |
      | preview1d_perhour_perip_precent_currenthour | starttime="-1d/d" endtime="now/d" logtype:apache \| bucket timestamp span=1h as ts \| stats count() as ip_count by apache.clientip,ts \| join type=left ts [[ logtype:apache \| bucket timestamp span=1h as ts \| stats count() as hour_count by ts ]] \| eval ippercent=100 * ip_count / hour_count                                     |                    |                   |
      | append_sample                               | starttime="-1d/d" endtime="now/d"  tag:"sample04061424" \| stats avg(apache.resp_len) as avg_resp_len \| append [[ starttime="now/d" endtime="now" tag:"sample04061424" \| stats avg(apache.resp_len) as avg_resp_len]]                                                                                                                  |                    |                   |
      | fields_sample                               | starttime="now/d" endtime="now+d/d" tag:"sample04061424" \| stats count() as count_res by appname,apache.clientip \| fields apache.clientip, count_res                                                                                                                                                                                   |                    |                   |
      | where_dc                                    | tag:"sample04061424" \| where apache.status>400 \| stats dc(apache.status)                                                                                                                                                                                                                                                               |                    |                   |
      | where_logic_and                             | tag:"sample04061424" \| where  apache.status > 200 && apache.status < 400                                                                                                                                                                                                                                         \| table apache.status |                    |                   |
      | start_time_para_mon                         | starttime="now-1M/M-1d/w"  endtime="now" tag:sample04061424                                                                                                                                                                                                                                                                              |                    |                   |
      | parse_eval_stats                            | tag:"sample04061424" \| parse field=apache.clientip "(?<ip_addr>\d+\.\d+\.\d+\.\d+)" \| eval ip_str = "ip:" + ip_addr  \| stats count(appname) by ip_str                                                                                                                                                                                 |                    |                   |
      | autoregress_sample                          | starttime="-5h/h" endtime="now" tag:"sample04061424" \| bucket timestamp span=10m as ts \| stats count(appname) as count_app by ts \| eval time=formatdate(ts) \| autoregress count_app p=6                                                                                                                                              |                    |                   |
      | makesession                                 | transaction apache.clientip maxspan=30m                                                                                                                                                                                                                                                                                                  |                    |                   |
      | top_sample_2                                | tag:"sample04061424" \| top 11 apache.clientip countfield=clientip_count  percentfield=clientip_percent                                                                                                                                                                                                                                  |                    |                   |
      | stats_count                                 | tag:"sample04061424" \| sort by +apache.status,+apache.resp_len \| table apache.status, apache.resp_len                                                                                                                                                                                                                                  |                    |                   |
      | dup_names_1                                 | tag:"sample04061424" \| stats avg(apache.status) by apache.clientip \| join type=left apache.clientip [[ tag:"sample04061424" AND apache.clientip:23.166.125.53 \| stats sum(apache.status) by apache.clientip ]]                                                                                                                        |                    |                   |
      | dup_names_1                                 | tag:"sample04061424" \| stats count(apache.status)                                                                                                                                                                                                                                                                                       |                    |                   |
      | save_stats_avg_ip                           | tag:"sample04061424" \| stats avg(apache.resp_len) as status,count(apache.resp_len) by apache.clientip \| save /data/rizhiyi/spldata/apache_latency.csv                                                                                                                                                                                  |                    |                   |
      | spl_movingavg                               | tag:"sample04061424"\|bucket timestamp span=1h as ts \| stats sum(apache.resp_len) as sum_resp_len by ts \| eval time=formatdate(ts)\| movingavg sum_resp_len,3 as moving_avg_resp_len                                                                                                                                                   |                    |                   |
