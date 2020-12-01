@alldownload
Feature: table下载

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  @dlpart2
  Scenario Outline: stats用例结果下载
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "2000" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"

    And I wait for "2000" millsecond
    And I wait for "DownloadEvent" will be visible
    Then I click the "DownloadEvent" button
    Then I set the parameter "DownloadName" with value "<name>"
    Then I set the parameter "MaxLineNum" with value "100"
#    Then I choose the "<unit>" from the "MaxLineDropdown"
    Then I choose the "TXT" from the "DocumentTypeList"
    Then I choose the "UTF" from the "DocumentEncodeList"
    Then I click the "CreateDownloadTask" button
#    And I wait for "2000" millsecond
#    Then I will see the success message "提交成功，请到设置-下载管理页查看下载状态！"

    #下载到本地
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/#"
    When I set the parameter "DbListPageSearchInput" with value "<name>.txt"
    And I wait for "1000" millsecond
    Given the data name is "<name>.txt" then i click the "下载" button

    Examples:
      | name                                          | splQuery                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | collect_sample_appcollect_step2 | index=collectone tag:sample04061424\| table tag, apache.resp_len, apache.x_forward \| sort by apache.x_forward |
      | collect_appcollect_newtagcollect_step2 | index=collecttwo tag:\"newtagcollect\"  \| table tag, apache.resp_len, apache.x_forward \| sort by apache.x_forward |
      | collect_testmode_true_step2 | index=collectmode tag:\"testmode1\" \| table tag, apache.resp_len, apache.x_forward \| sort by apache.x_forward |
      | collect_testmode_false_step2 | index=collectmode tag:\"testmode1\" \| table tag, apache.resp_len, apache.x_forward \| sort by apache.x_forward |
      | collect_to_collect_step2 | index=collecttocollect tag:newcollect \| table tag, apache.resp_len, apache.x_forward \| sort by apache.x_forward |
      | collect_mulparam_step2 | tag:sample04061424 \| collect index=collectmulti marker=\"tag=\\\\\"newtagcollect\\\\\",ip=\\\\\"192.168.1.100\\\\\", apache.status=100, apache.resp_len=23.0\" |
      | eval_delete_sample_step2                      | starttime=\"now/d\" endtime=\"now/d+24h\" tag:spldelete
