@vdltest
Feature: download_处理下载结果

  Background:
    Given open the "splSearch.OfflineTaskPageNohup" page for uri "/download/#"

  Scenario Outline: 下载比较
    Then I compare source download file "<name>.csv" with target download files "<name>.csv"

    Examples: 新建成功
      | name                                                   | splQuery                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
      | spl_rangeline_outlier_is_0                             | tag:sample04061424_display \| bucket timestamp span=3h as ts\| stats count(appname) as count_ by ts\| movingavg count_,5 as ma\| rollingstd count_,5 as rs \| eval lower=ma-3*rs \| eval upper=ma+3*rs\| eval outlier=if(count_>upper\|\|count_<lower, count_, 0)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
