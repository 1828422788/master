@vdl
Feature: 处理下载结果

  Background:
#    Given open the "splSearch.SearchPage" page for uri "/search/"
#    And I wait for element "SearchStatus" change text to "搜索完成!"

  @vdlftp
  Scenario Outline: 下载
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/#"
    And I wait for loading complete
#    Then I compare source download file "expect/<name>.csv" with target download files "<name>.csv"
    Then I get remote ftp download file "<name>.csv"
    And I wait for "1000" millsecond

    Examples:
      | name                                         | splQuery                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
      | search_verify_chart_log | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart |

  @vldt
  Scenario Outline: 测试比较
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/#"
#    And I download file "<name>.csv" to local
    Then I compare source download file "expect/<name>.csv" with target download files "<name>.csv"

    Examples:
      | name                                         | splQuery                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
      | bucket_movingavg_rollingstd_eval | (logtype:apache AND tag:\"sample04061424_chart\") \| bucket timestamp span=1m as ts \| stats sum(apache.resp_len) as sum_len by ts,apache.status \| eval time=formatdate(ts,\"HH:mm:ss\") |
