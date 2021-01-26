Feature: 验证宏

  Background:
    Given open the "macroSearch.ListPage" page for uri "/macro/"
    And I wait for "2000" millsecond

  @vdlmacro1
  Scenario Outline:
    Then I compare source file "<name>.csv" with target macro files "macro_<name>.csv"

    Examples:
      | name      | macroSearch                                      | splQuery1                                        |
      | two_param                             | `map_opt_count_2("count", "count")`                                                                                                                                                                                                                                                                                                      | tag:\"sample04061424\" \| eval txt=\"count\"\| limit 1 \| table txt \| map \" tag:\"sample04061424\" \| stats count(timestamp) \"                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
      | sub_tran_resp_len_1       | `sub_tran_resp_len_1(1955)`       | tag:sample04061424 AND [[ 1955 \| stats count(appanme) by apache.resp_len \| fields apache.resp_len]]  \| transaction apache.resp_len keepevicted=true contains=\"1955\"                  |
      | sub_tran_resp_len_param_1 | `sub_tran_resp_len_param_1(1955)` | tag: sample04061424 AND [[ apache.resp_len:1955 \| stats count(appname) by apache.resp_len \| fields apache.resp_len ]] \| transaction apache.resp_len keepevicted=true contains=\"1955\" |
