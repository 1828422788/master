Feature: 对比使用宏搜索下载的文件和使用搜索语句搜索下载的文件

  Background:
    Given open the "macroSearch.ListPage" page for uri "/macro/"

  Scenario Outline:
    Then I compare source file "<name_macroSearch>" with target macro files "<name_spl>"

    Examples:
      | name_macroSearch             | name_spl               |
      | macro_UIAutoTest.csv         |UIAutoTest.csv          |
      |macro_sub_tran_resp_len_1.json|sub_tran_resp_len_1.json|
      |macro_alert_stats_len_avg.xlsx|alert_stats_len_avg.xlsx|


