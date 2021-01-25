Feature: 验证宏

  Background:
    Given open the "macroSearch.ListPage" page for uri "/macro/"
    And I wait for "2000" millsecond

  @vdlmacro1
  Scenario Outline:
    Then I compare source file "<name>.csv" with target macro files "macro_<name>.csv"

    Examples:
      | name      | macroSearch                                      | splQuery1                                        |
      | map_opt_count_2                             | `map_opt_count_2("count", "count")`                                                                                                                                                                                                                                                                                                      | tag:\"sample04061424\" \| eval txt=\"count\"\| limit 1 \| table txt \| map \" tag:\"sample04061424\" \| stats count(timestamp) \"                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
