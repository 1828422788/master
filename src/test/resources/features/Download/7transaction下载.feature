@alldownload
Feature: 事件搜索下载

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  @dltran
  Scenario Outline: 执行
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "2000" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"

    And I wait for "2000" millsecond
    And I wait for "DownloadEvent" will be visible
    Then I click the "DownloadEvent" button
    Then I set the parameter "DownloadName" with value "<name>"
    Then I set the parameter "MaxLineNum" with value "100"
#    Then I choose the "<unit>" from the "MaxLineDropdown"
    Then I choose the "TXT" from the "DocumentTypeList"
    Then I choose the "UTF" from the "DocumentEncodeList"
    Then I click the "CreateDownloadTask" button
#    And I wait for "2000" millsecond
#    Then I will see the success message "提交成功，请到设置-下载管理页查看下载状态！"

    #下载到本地
#    Given open the "splSearch.OfflineTaskPage" page for uri "/download/#"
#    When I set the parameter "DbListPageSearchInput" with value "<name>.txt"
#    And I wait for "1000" millsecond
#    Given the data name is "<name>.txt" then i click the "下载" button

    Examples:
      | name                                          | splQuery                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
      | eval_case_tran                                | tag:sample04061424_display OR tag:sample04061424_chart \| eval status_com = case(tag==\"sample04061424_display\", apache.status, tag==\"sample04061424_chart\", apache.status) \| transaction status_com maxevents=100                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
      | rename_apache_tran2len_sort                   | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| rename apache.* as new.* \| transaction new.resp_len keepevicted=true \| sort by new.resp_len                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
      | transaction_status_sortfield_sample | tag:sample04061424 AND (NOT apache.status:499 AND NOT apache.status:206) \| transaction apache.status keepevicted=true sortfield=apache.x_forward \| limit 2 |
      | transaction_status_sortfield_forward_desc | tag:sample04061424 AND (NOT apache.status:499 AND NOT apache.status:206) \| transaction apache.status keepevicted=true sortfield=-apache.x_forward \| limit 2 |
      | transaction_status_sortfield_forward_asc | tag:sample04061424 AND (NOT apache.status:499 AND NOT apache.status:206) \| transaction apache.status keepevicted=true sortfield=+apache.x_forward \| limit 2 |
      | transaction_status_sortfield_clientip | tag:sample04061424 AND (NOT apache.status:499 AND NOT apache.status:206) \| transaction apache.status keepevicted=true sortfield=apache.clientip \| limit 2 |
      | transaction_clientip_sortfield_resplen_xforward | tag:sample04061424 AND (NOT apache.status:499 AND NOT apache.status:206) \| transaction apache.clientip keepevicted=true sortfield=apache.resp_len,apache.x_forward \| limit 2 |
      | transaction_clientip_sortfield_resplen | tag:sample04061424 AND (NOT apache.status:499 AND NOT apache.status:206) \| transaction apache.clientip keepevicted=true sortfield=+apache.resp_len \| limit 2 |
      | tran_ip_maxopen_max | (logtype:apache AND tag:sample04061424) \| transaction apache.clientip maxopenevents=10 maxevents=10 |
      #add
      | tran_apachelen_sort | tag:sample04061424 \| transaction  apache.resp_len keepevicted=true \| sort by apache.resp_len |
      #add
      | tran_sort_ascend | tag:sample04061424 \| transaction apache.status keepevicted=true\| sort by + apache.status |
      | tran_param_max_txn_maxopen10 | tag:sample04061424 \| transaction apache.status maxevents=10 maxopentxn=100 maxopenevents=100 |
      | tran_param_max_txn_maxopen3 | tag:sample04061424 AND apache.status:\"200\" \| transaction apache.status maxevents=3 maxopentxn=100 maxopenevents=100 |
      #add
      | tran_status_contains_maxevents_10 | tag:sample04061424 AND clientconfig \| transaction apache.status keepevicted=true maxevents=10 maxopenevents=100 contains=\"clientconfig\" |
      #add
      | tran_status_contains_maxevents_100 | tag:sample04061424 AND clientconfig \| transaction apache.status  keepevicted=true maxevents=100 maxopenevents=100 contains=\"clientconfig\" |
      | tran_method_max_maxopen_contains1 | \"clientconfig\" AND tag:sample04061424 \| transaction apache.method contains=\"clientconfig\"  maxevents=10 maxopenevents=100 |
      #add
      | tran_method_max_maxopen_contains2 | \"GET /index/portal/\" AND tag:sample04061424 \| transaction apache.method contains=\"GET /index/portal/\" keepevicted=true maxevents=300 maxopenevents=1000 |
      #add
      | tran_count_where | tag:sample04061424 \| transaction apache.resp_len keepevicted=true \| where _count==4 |
      #add
      | tran_duration_where | tag:sample04061424 \| transaction apache.resp_len keepevicted=true \| where _duration<500 |
      | tran_endswith_eval_contains | tag:sample04061424 \| transaction apache.clientip endswith=eval(apache.status == 200) maxevents=10 contains=\"Dalvik\" |
      | tran_startswith_endswith_maxspan_5s | starttime = \"now/d\" endtime = \"now\" tag:sample04061424 \| transaction apache.clientip startswith=\"Android\" endswith=\"Dalvik\" maxspan=5s maxevents=50 maxopentxn=1000 maxopenevents=1000 |
      #add
      | tran_startswith_endswith_maxopenevents2 | starttime=\"now/d\" endtime = \"now/d+24h\" tag:sample04061424 \| transaction apache.clientip  startswith=\"1977\" endswith=\"Android 4.3\"  keepevicted=true maxspan=1d maxevents=50 maxopentxn=1000 maxopenevents=1000 |
      #add
      | tran_sort | tag:sample04061424 \| transaction apache.resp_len keepevicted=true \| sort by apache.resp_len |
      | bug_tran_with | tag:t_with \| transaction json.sid keepevicted=true with states a, b, c in json.module results by flow |

