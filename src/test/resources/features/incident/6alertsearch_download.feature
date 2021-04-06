@alertsearch
Feature: 监控搜索界面

  Background:
    Given open the "incident.AlertSearchPage" page for uri "/app/incident/alertsearch/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  Scenario Outline: 下载table用例结果
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "5000" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then take a screenshot with name "incident/<name>"

    And I wait for "2000" millsecond
    And I wait for "saveAsOther" will be visible
    Then I click the "downloadButton" button
    Then I set the parameter "DownloadName" with value "<name>"
    Then I set the parameter "MaxLineNum" with value "100"
#    Then I choose the "<unit>" from the "MaxLineDropdown"
    And I choose the "CSV" from the "DocumentTypeList"
    And I choose the "UTF-8" from the "DocumentEncodeList"
    Then I click the "CreateDownloadTask" button
#    And I wait for "2000" millsecond
#    Then I will see the success message "提交成功，请到设置-下载管理页查看下载状态！"

    #下载到本地
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/#"
    When I set the parameter "DbListPageSearchInput" with value "<name>.csv"
    And I wait for "2000" millsecond
    Given the data name is "<name>.csv" then i click the "下载" button

    Examples: 新建成功
      | name                      | splQuery                                                                                |
      #custom_info.alert_name: api00_spl统计_按行发送_抑制翻倍_cnt_10-59min_无分组 | table manager,summary
      | incident_alert_name       | custom_info.alert_name: api00_spl统计_按行发送_抑制翻倍_cnt_10-59min_无分组 \| table manager,summary |
      #appname: alertcef | limit 100 | table ip
      | incident_appname_alertcef | appname: alertcef \| limit 100 \| table ip                                              |
      #* | top 5 appname
      | incident_top_appname      | * \| top 5 appname                                                                      |
      #* | table appname | limit 100
      | incident_table_appname    | * \| table appname \| limit 100                                                         |


