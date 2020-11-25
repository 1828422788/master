@newalldownload
Feature: table下载

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  @newxtable
  Scenario Outline: stats用例结果下载
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
#    Given open the "splSearch.OfflineTaskPage" page for uri "/download/#"
#    When I set the parameter "DbListPageSearchInput" with value "<name>.csv"
#    And I wait for "2000" millsecond
#    Given the data name is "<name>.csv" then i click the "下载" button

    Examples:
      | name                                                   | splQuery                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
      | chart_over_timestamp_span1h | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display  \| chart count() over timestamp span=\"1h\" |
      | chart_over_timestamp_span1d | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| chart count() over timestamp span=\"1d\" |
      | chart_bins3_span1h | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| chart count() over timestamp bins=3 span=\"1h\" |
      | chart_bins24_span1h | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| chart count() over timestamp bins=24 span=\"1h\" |
      | chart_sep_sample | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| chart sep=\"-sep分格-\" count() max(apache.resp_len) over timestamp span=\"1h\" by apache.status |
      | chart_sep_format | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| chart sep=\"-sep分格-\" format=\"$AGG\|format分格\|$VAL\" count() max(apache.resp_len) over timestamp span=\"1h\" by apache.status |
      | chart_sep_format1 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| chart sep=\"-sep分格-\" format=\"$VAL\|format分格\|$AGG\" count() max(apache.resp_len) over timestamp span=\"1h\" by apache.status |
