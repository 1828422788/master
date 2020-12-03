@alldownload
Feature: table下载

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  @extra
  Scenario Outline: stats用例结果下载
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "2000" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "2000" millsecond
    And I wait for "10000" millsecond

    Examples:
      | name                                          | splQuery                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | eval_delete_collect_sample_step1       | tag:sample04061424\| collect index=collectone marker=\"appname=\\\\\"appcollect\\\\\"\", tag=\\\\\"spldeletecollect\\\\\"\"                                   |
      | eval_delete_collect_sample_step2       | starttime=\"now/d\" endtime=\"now/d+24h\" tag:spldeletecollect \| delete                                                                                     |
      | eval_delete_log_sample_step1           | starttime=\"now/d\" endtime=\"now/d+24h\" tag:spldelete \| delete                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |

  @collect2 @noret
  Scenario Outline: 下载table用例结果
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "2000" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "2000" millsecond
    Then I will see the "NoDataInfo" result will be "查询无结果。"

    Examples:
      | name                                   | splQuery                                                                                                                                                        |
      | eval_delete_collect_sample_step3       | starttime=\"now/d\" endtime=\"now/d+24h\" tag:spldeletecollect                                                                                   |
      | eval_delete_log_sample_step2           | starttime=\"now/d\" endtime=\"now/d+24h\" tag:spldelete                                                                                                         |
