Feature: 验证宏

  @test901
  Scenario Outline:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "<macroSearch>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
#    And I save the result "{'ClientIp':'Column1','Version':'Column2','Count':'Column3'}"

    And I wait for "2000" millsecond
    And take a screenshot with name "macro_<name>.png"

    And I wait for "downloadButton" will be visible
    Then I click the "downloadButton" button
    Then I set the parameter "DownloadName" with value "macro_<name>"
    Then I set the parameter "MaxLineNum" with value "100"s
#    Then I choose the "<unit>" from the "MaxLineDropdown"
    Then I choose the "CSV" from the "DocumentTypeList"
    Then I choose the "UTF" from the "DocumentEncodeList"
    Then I click the "CreateDownloadTask" button
#    And I wait for "2000" millsecond
#    Then I will see the success message "提交成功，请到设置-下载管理页查看下载状态！"

    #下载到本地
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/#"
    When I set the parameter "DbListPageSearchInput" with value "macro_<name>.csv"
    And I wait for "2000" millsecond
    Given the data name is "macro_<name>.csv" then i click the "下载" button

    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "<splQuery1>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"

#    Then I compare with "{'ClientIp':'Column1','Version':'Column2','Count':'Column3'}"
    And I wait for "2000" millsecond
    And take a screenshot with name "<name>.png"

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
      | name                            | macroSearch                                                   | splQuery1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
      | app_permission_sample_two_param | `app_permission_sample_two_param(\"23.166.125.53\", \"1.1\")` | tag:sample04061424 \| stats count() as ip_cnt by apache.clientip, apache.version \| where apache.clientip==\"23.166.125.53\" && apache.version==\"1.1\"                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
