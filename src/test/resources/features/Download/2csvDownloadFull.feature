@alldownload @collect @dlother
Feature: download_collect验证

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"

  @collect2
  Scenario Outline: table命令搜索结果下载
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then take a screenshot with name "downloadpng/<name>"

    And I wait for "saveAsOther" will be visible
    And I choose the "下载" from the "SaveAsList"
    And I set the parameter "DownloadName" with value "<name>"
    And I set the parameter "MaxLineNum" with value "100"
    When I click the "CreateDownloadTask" button
    Then I will see the success message "提交成功，请到设置-下载管理页查看下载状态！"

    #下载到本地
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/#"
    And I set the parameter "DbListPageSearchInput" with value "<name>.csv"
    And I wait for loading invisible
    And I click the "ListDownloadButton" button

    Examples:
      | name                                   | splQuery                                                                                                                        |
      | collect_sample_appcollect_step2        | index=collectone tag:sample04061424\| table tag, apache.resp_len, apache.x_forward \| sort by apache.x_forward                  |
      | collect_appcollect_newtagcollect_step2 | index=collecttwo tag:\"newtagcollect\"  \| table tag, apache.resp_len, apache.x_forward \| sort by apache.x_forward             |
      | collect_testmode_false_step2           | index=collectmodefalse tag:\"testmodefalse\" \| table tag, apache.resp_len, apache.x_forward \| sort by apache.x_forward        |
      | collect_to_collect_step2               | index=collecttocollect tag:newcollect \| table tag, apache.resp_len, apache.x_forward \| sort by apache.x_forward               |
      | collect_mulparam_step2                 | index=collectmulti tag:newtagcollect \| table tag, apache.resp_len, apache.status, apache.x_forward \| sort by apache.x_forward |

  @collect2
  Scenario Outline:搜索结果为"搜索无数据"
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then take a screenshot with name "downloadpng/<name>"

    And I wait for "1000" millsecond
    Then I will see the "NoDataInfo" result will be "搜索无数据"

    Examples:
      | name                        | splQuery                           |
      | collect_testmode_true_step2 | index=collectmodetrue tag:testmodetrue |

  @collect3
  Scenario Outline:delete命令搜索结果下载
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then take a screenshot with name "downloadpng/<name>"

    And I wait for "1000" millsecond

    Examples:
      | name                                   | splQuery                           |
      | collect_sample_appcollect_step2        | index=collectone * \| delete       |
      | collect_appcollect_newtagcollect_step2 | index=collecttwo * \| delete       |
      | collect_testmode_false_step2           | index=collectmodefalse * \| delete |
      | collect_to_collect_step2               | index=collecttocollect *\| delete  |
      | collect_mulparam_step2                 | index=collectmulti * \| delete     |
