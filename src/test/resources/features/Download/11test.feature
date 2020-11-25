Feature: 处理下载结果

  Background:
    Given open the "splSearch.OfflineTaskPageNohup" page for uri "/download/#"

  @vdl1
  Scenario Outline: 测试比较
    Then I compare source bucket file "<name>.csv" with target bucket files "<name>.csv"

    Examples:
      | name                                      | splQuery                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
      | bucket_ts_stats_sum_eval                  | (logtype:apache AND tag:\"sample04061424_chart\") \| bucket timestamp span=1m as ts \| stats sum(apache.resp_len) as sum_len by ts,apache.status \| eval time=formatdate(ts,\"HH:mm:ss\")                                                                                                                                                                                                                                                                                                                   |
      | bucket_stats_eval_movingavg               | starttime=\"now/d\" endtime=\"now/d+24h\"  tag:\"sample04061424_chart\"\| bucket timestamp span=1m as ts \| stats sum(apache.resp_len) as sum_resp_len by ts \| eval time=formatdate(ts,\"HH:mm:ss\") \| movingavg sum_resp_len,3 as moving_avg_resp_len                                                                                                                                                                                                                                                    |
