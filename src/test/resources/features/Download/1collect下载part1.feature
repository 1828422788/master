@dlother @collect
Feature: download_v3.2新增功能下载

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  @collect1
  Scenario Outline: 执行
    Given I set the parameter "SearchInput" with value "<splQuery>"
    When I click the "DateEditor" button
    When I click the "Today" button
    When I click the "SearchButton" button
    And I wait for "2000" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then take a screenshot with name "v37dl/<name>"

    And I wait for "2000" millsecond
    And I wait for "DownloadEvent" will be visible
    When I click the "DownloadEvent" button
    And I set the parameter "DownloadName" with value "<name>"
    And I set the parameter "MaxLineNum" with value "100"
#    Then I choose the "<unit>" from the "MaxLineDropdown"
    And I choose the "TXT" from the "DocumentTypeList"
    And I wait for "2000" millsecond
    And I choose the "UTF-8" from the "DocumentEncodeList"
    And I wait for "2000" millsecond
    When I click the "CreateDownloadTask" button
#    And I wait for "2000" millsecond
#    Then I will see the success message "提交成功，请到设置-下载管理页查看下载状态！"

    #下载到本地
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/#"
    And I set the parameter "DbListPageSearchInput" with value "<name>.txt"
    And I wait for "1000" millsecond
#    Given the data name is "<name>.txt" then i click the "下载" button
    And I click the "ListDownloadButton" button

    Examples:
      | name                                   | splQuery                                                                                                                                                        |
      | collect_sample_appcollect_step1        | tag:sample04061424\| collect index=collectone marker=\"appname=\\\\\"appcollect\\\\\"\"                                                                         |
      | collect_appcollect_newtagcollect_step1 | tag:sample04061424\| collect index=collecttwo marker=\"appname=\\\\\"appcollect\\\\\", tag=\\\\\"newtagcollect\\\\\"\"                                          |
      | collect_testmode_false_step1           | tag:sample04061424 \| collect index=collectmodefalse marker=\"tag=\\\\\"testmodefalse\\\\\"\" testmode=false                                                         |
      | collect_testmode_true_step1            | tag:sample04061424 \| collect index=collectmodetrue marker=\"tag=\\\\\"testmodetrue\\\\\"\" testmode=true                                                           |
      | collect_to_collect_step1               | index=collectone appname:appcollect \| collect index=collecttocollect marker=\"tag=\\\\\"newcollect\\\\\"\"                                                     |
      | collect_mulparam_step1                 | tag:sample04061424 \| collect index=collectmulti marker=\"tag=\\\\\"newtagcollect\\\\\",ip=\\\\\"192.168.1.100\\\\\", apache.status=100, apache.resp_len=23.0\" |