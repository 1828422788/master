@testuse
Feature: 处理下载结果

  Background:
    Given open the "splSearch.OfflineTaskPageNohup" page for uri "/download/#"

  @testuse1
  Scenario Outline: 下载比较
    And I compare1 xtable "<name>.csv" Keep figures in column list "5"
#    And I compare xtable "<name>.csv" Keep figures "5" in column list "[0,1,2]"

    Examples:
      | name                                                   | splQuery                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
      | geostats_china_maxzoomlevel_sum_by_province | tag:sample04061424 \| eval bool_is_empty=empty(apache.request_path) \| eval bool_not_empty=! empty(apache.request_path) \| eval bool_is_false= false && empty(apache.request_path) \| table bool_is_empty, bool_not_empty,bool_is_false, apache.x_forward \| sort by  apache.x_forward |

  @testuse2
  Scenario Outline: 下载比较
    Then I compare source download file "<name>.csv" with target download files "<name>.csv"

    Examples:
      | name                                                   | splQuery                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
      | eval_noempty_logic_and | tag:sample04061424 \| eval bool_is_empty=empty(apache.request_path) \| eval bool_not_empty=! empty(apache.request_path) \| eval bool_is_false= false && empty(apache.request_path) \| table bool_is_empty, bool_not_empty,bool_is_false, apache.x_forward \| sort by  apache.x_forward |