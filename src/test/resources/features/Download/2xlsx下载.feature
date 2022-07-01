@dltable @dltable1
Feature: download_xlsx格式

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  Scenario Outline: 下载xlsx格式数据_成功
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "TwoDays" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then take a screenshot with name "spldownload/<name>"

    When I wait for "SaveAsOther" will be visible
    And I choose the "下载" from the "SaveAsList"

    And I set the parameter "DownloadName" with value "<name>"
    And I set the parameter "MaxLineNum" with value "<maxLineNum>"
    When I wait for "DocumentTypeList" will be visible
    And I choose the "XLSX" from the "DocumentTypeList"
    When I wait for "DocumentEncodeList" will be visible
    And I choose the "UTF-8" from the "DocumentEncodeList"
    When I click the "CreateDownloadTask" button
    Then I will see the success message "提交成功，请到设置-下载管理页查看下载状态！"

    #下载到本地
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/#"
    When I set the parameter "DbListPageSearchInput" with value "<name>.xlsx"
    And I wait for loading invisible
    Then the data name is "<name>.xlsx" then i click the "下载" button

    Examples: 新建成功
      | maxLineNum | name                     | splQuery                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
      | 100        | download_test_stats       | logtype:apache \| stats count() by hostname,apache.clientip \| strcat hostname \"/\" apache.clientip NameIp   |
      | 60         | 中文测试                   | logtype:apache \| stats count() by hostname,apache.clientip \| strcat hostname \"/\" apache.clientip NameIp   |
      | 10         | download_test_makeresults | \| makeresults count=10 \| streamstats count() as c \| eval c = if(c==3,null,c) \| head c<6 keeplast=false null=true   |

  Scenario Outline: 下载xlsx格式数据_校验失败
    Given I set the parameter "SearchInput" with value "logtype:apache | stats count() by hostname"
    And I click the "DateEditor" button
    And I click the "TwoDays" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I wait for "SaveAsOther" will be visible
    And I choose the "下载" from the "SaveAsList"

    And I set the parameter "DownloadName" with value "<name>"
    And I set the parameter "MaxLineNum" with value "100"
    When I wait for "DocumentTypeList" will be visible
    And I choose the "XLSX" from the "DocumentTypeList"
    When I wait for "DocumentEncodeList" will be visible
    And I choose the "UTF-8" from the "DocumentEncodeList"
    When I click the "CreateDownloadTask" button
    And I wait for element "<Helpmessage>" change text to "<message>"

    Examples: 新建成功
      | name                     | Helpmessage | message               |
      |                          |Helpmessage  |  请输入名称                |
      | @#test                   |Helpmessage  |  名称格式有误，仅支持中文、数字、字母、中划线、下划线以及括号的组合。|
      |  testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest | ErrorMessage | 名称太长，请输入小于254个字符的名称。|

  Scenario: 下载xlsx格式数据_同名失败
    Given I set the parameter "SearchInput" with value "logtype:apache | stats count() by hostname"
    And I click the "DateEditor" button
    And I click the "TwoDays" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I wait for "SaveAsOther" will be visible
    And I choose the "下载" from the "SaveAsList"

    And I set the parameter "DownloadName" with value "中文测试"
    And I set the parameter "MaxLineNum" with value "100"
    When I wait for "DocumentTypeList" will be visible
    And I choose the "XLSX" from the "DocumentTypeList"
    When I wait for "DocumentEncodeList" will be visible
    And I choose the "UTF-8" from the "DocumentEncodeList"
    When I click the "CreateDownloadTask" button
    And I will see the element "ErrorMessage" contains "Duplicate file name"

