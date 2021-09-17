@customcmd
Feature: 新建指令配置

  @uptgz
  Scenario Outline: 上传程序
    Given open the "customcommand.ListPage" page for uri "/customcommand/"
    And I wait for "ProcessManger" will be visible
    And I click the "ProcessManger" button
    Given I wait for loading complete
    Then I will see the "customcommand.CreatePage" page
    Given I wait for loading complete
    And I click the "Upload" button
    And I wait for "2000" millsecond
    When I upload a file "LocalUpload" with name "/src/test/resources/testdata/custom_commands/<tgzName>.tgz"
    And I will see the element "VerifyText" name is "上传完成"
    And I set the parameter "Name" with value "<tgzName>"
    And I set the parameter "ScriptName" with value "<tgzName>"
    Then I click the "confirmUpload" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "创建成功"

    Examples:
      | tgzName          |
      | calculate        |
      | calculate2       |
      | centralized_demo |
      | generating_demo  |
      | streaming_demo   |
      | transformed_demo |

  @newcmd1
  Scenario Outline: 新建指令配置
    Given open the "customcommand.ListPage" page for uri "/customcommand/"
    And I wait for "Create" will be visible
    And I click the "Create" button
    And I set the parameter "CommandName" with value "<tgzName>"
    And I choose the "<tgzName>.tgz" from the "ProcessName"
    And I wait for "1000" millsecond
    Then I choose the "<cmdType>" from the "CommandType"
    And I wait for "2000" millsecond
    Then I click the "Apply" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "创建成功"
    Then I logout current user

    Examples:
      | tgzName          | cmdType  |
      | centralized_demo | 集中处理命令   |
      | generating_demo  | 生成数据命令   |
      | streaming_demo   | 可分布式处理命令 |
      | transformed_demo | 集中处理命令   |

  @newcmd2
  Scenario Outline: 新建指令配置
    Given open the "customcommand.ListPage" page for uri "/customcommand/"
    And I wait for "Create" will be visible
    And I click the "Create" button
    And I set the parameter "CommandName" with value "<tgzName>"
    And I choose the "<tgzName>.tgz" from the "ProcessName"
    And I wait for "1000" millsecond
#    Then I choose the "autoui001" from the "ResourceTagList"
#    And I wait for "1000" millsecond
    And I set the parameter "Programparam" with value "<programparam>"
    And I wait for "1000" millsecond
#    When I click the "CmdChunked" button
#    Given I wait for loading complete
#    Then I will see the checkbox "CmdChunked" is "open"
    Then I choose the "<cmdType>" from the "CommandType"
    And I wait for "2000" millsecond
    Then I click the "Apply" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "创建成功"
    Then I logout current user

    Examples:
      | tgzName    | cmdType | programparam |
      | calculate  | 集中处理命令  | sum          |
      | calculate  | 集中处理命令  | cnt          |
      | calculate2 | 集中处理命令  | cnt          |
      | calculate2 | 集中处理命令  | avg          |

  @execmd
  Scenario Outline:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "5000" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then take a screenshot with name "spldownload/<name>"

    And I wait for "2000" millsecond
    When I wait for "SaveAsOther" will be visible
    And I choose the "下载" from the "SaveAsList"
    And I wait for "1000" millsecond

    And I set the parameter "DownloadName" with value "<name>"
    And I set the parameter "MaxLineNum" with value "<maxLineNum>"
#    Then I choose the "<unit>" from the "MaxLineDropdown"
    And I choose the "CSV" from the "DocumentTypeList"
    And I wait for "2000" millsecond
    And I choose the "UTF-8" from the "DocumentEncodeList"
    And I wait for "2000" millsecond
    When I click the "CreateDownloadTask" button
#    And I wait for "2000" millsecond
#    Then I will see the success message "提交成功，请到设置-下载管理页查看下载状态！"

    #下载到本地
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/#"
    When I set the parameter "DbListPageSearchInput" with value "<name>.csv"
    And I wait for "2000" millsecond
#    Given the data name is "<name>.csv" then i click the "下载" button
    And I click the "ListDownloadButton" button

    Examples: 新建成功
      | maxLineNum | name             | splQuery                                                                                              |
      | 100        | generating_demo  | \|generating_demo                                                                                     |
      | 100        | streaming_demo   | \| makeresults \| eval ct="1,2,3,4" \| eval ct=split(ct,",") \| mvexpand ct \| streaming_demo         |
      | 100        | centralized_demo | \| makeresults \| eval ct="1,2,3,4" \| eval ct=split(ct,",") \| mvexpand ct \| centralized_demo       |
      | 100        | transformed_demo | \| makeresults \| eval ct="1,2,3,4" \| eval ct=split(ct,",") \| mvexpand ct \| transformed_demo       |
      | 100        | caculate_cnt     | \| makeresults \| eval ct="1,2,3,4" \| eval ct=split(ct,",") \| mvexpand ct \| caculate_cnt           |
      | 100        | caculate_sum     | \| makeresults \| eval ct="1,2,3,4" \| eval ct=split(ct,",") \| mvexpand ct \| caculate_sum           |
      | 100        | caculate2_cnt    | \| makeresults \| eval ct="1,2,3,4" \| eval ct=split(ct,",") \| mvexpand ct \| caculate2 function=cnt |
      | 100        | caculate2_avg    | \| makeresults \| eval ct="1,2,3,4" \| eval ct=split(ct,",") \| mvexpand ct \| caculate2 function=avg |




