@alldownload @collect
Feature: download_collect验证

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  @collect2
  Scenario Outline: 下载table用例结果
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "2000" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"

    And I wait for "2000" millsecond
    And I wait for "downloadButton" will be visible
    Then I click the "downloadButton" button
    Then I set the parameter "DownloadName" with value "<name>"
    Then I set the parameter "MaxLineNum" with value "100"
#    Then I choose the "<unit>" from the "MaxLineDropdown"
    Then I choose the "CSV" from the "DocumentTypeList"
    Then I choose the "UTF" from the "DocumentEncodeList"
    Then I click the "CreateDownloadTask" button
#    And I wait for "2000" millsecond
#    Then I will see the success message "提交成功，请到设置-下载管理页查看下载状态！"

    #下载到本地
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/#"
    When I set the parameter "DbListPageSearchInput" with value "<name>.csv"
    And I wait for "2000" millsecond
    Given the data name is "<name>.csv" then i click the "下载" button

    Examples:
      | name                                   | splQuery                                                                                                                        |
      | collect_sample_appcollect_step2        | index=collectone tag:sample04061424\| table tag, apache.resp_len, apache.x_forward \| sort by apache.x_forward                  |
      | collect_appcollect_newtagcollect_step2 | index=collecttwo tag:\"newtagcollect\"  \| table tag, apache.resp_len, apache.x_forward \| sort by apache.x_forward             |
      | collect_testmode_false_step2           | index=collectmodefalse tag:\"testmodefalse\" \| table tag, apache.resp_len, apache.x_forward \| sort by apache.x_forward        |
      | collect_to_collect_step2               | index=collecttocollect tag:newcollect \| table tag, apache.resp_len, apache.x_forward \| sort by apache.x_forward               |
      | collect_mulparam_step2                 | index=collectmulti tag:newtagcollect \| table tag, apache.resp_len, apache.status, apache.x_forward \| sort by apache.x_forward |

  @collect2
  Scenario Outline: 下载table用例结果
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "2000" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"

    And I wait for "2000" millsecond

    Examples:
      | name                        | splQuery                           |
      | collect_testmode_true_step2 | index=collectmodetrue tag:testmodetrue |

  @collect3
  Scenario Outline: 下载table用例结果
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "2000" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"

    And I wait for "2000" millsecond

    Examples:
      | name                                   | splQuery                           |
      | collect_sample_appcollect_step2        | index=collectone * \| delete       |
      | collect_appcollect_newtagcollect_step2 | index=collecttwo * \| delete       |
      | collect_testmode_false_step2           | index=collectmodefalse * \| delete |
      | collect_to_collect_step2               | index=collecttocollect *\| delete  |
      | collect_mulparam_step2                 | index=collectmulti * \| delete     |
