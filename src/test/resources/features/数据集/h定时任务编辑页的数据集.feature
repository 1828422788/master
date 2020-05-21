@dataset
Feature: 数据集-14在定时任务编辑页

  Scenario Outline: 新建数据集父子行为无的定时任务
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Given I set the parameter "SearchInput" with value "<spl>"
        #选择父子行为为无的数据集
    And I click the "fatherChildNull" button
    And I click the "DateEditor" button
    And I click the "RecentSevenDay" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"

    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I set the parameter "TaskName" with value "<taskName>"
    And I set the parameter "scheduleDescribe" with value "<describe>"

    And I set the parameter "CrontabInput" with value "<crontab>"

    And I set the parameter "TaskName" with value "<taskName>"

    And I click the "EnsureCrontab" button
    Then I will see the success message "保存成功"

    Examples:
      |spl                         |taskName |describe               | crontab      |
      |tag:"sample04061424" \| stats count() by apache.status|父子行为无       |选择了父子行为为无的数据集 |0 */57 * * * ?|



  Scenario Outline: 定时任务编辑页面验证数据集（无）
    Given open the "timedTask.ListPage" page for uri "/schedule/"
        #验证数据集在定时任务中的显示
    When the data name is "{'column':'2','name':'<taskName>'}" then i click the "编辑" button
    And I will see the "timedTask.EditPage" page
    And I wait for "5000" millsecond
    And I wait for "dataSet" will be visible
    Then I will see the "dataSet" result will be "<dataSetResult>"

    Examples:
     |taskName  |dataSetResult|
     |父子行为无  |(tag:sample*) |


##################################无耻的分割线###############################

  Scenario Outline: 新建数据集父子行为汇聚的定时任务
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Given I set the parameter "SearchInput" with value "<spl>"
        #选择父子行为为汇聚的数据集
    And I click the "huiJu" button
    And I click the "DateEditor" button
    And I click the "RecentSevenDay" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"

    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I set the parameter "TaskName" with value "<taskName>"
    And I set the parameter "scheduleDescribe" with value "<describe>"
    And I set the parameter "CrontabInput" with value "<crontab>"

    And I set the parameter "TaskName" with value "<taskName>"
    And I click the "EnsureCrontab" button
    Then I will see the success message "保存成功"


    Examples:
      |spl                         |taskName|describe               | crontab      |
      |tag:"sample04061424" \| stats count() by apache.status|父子行为汇聚     |选择了父子行为为汇聚的数据集|0 */57 * * * ?|



  Scenario Outline: 定时任务编辑页面验证数据集（汇聚）
    Given open the "timedTask.ListPage" page for uri "/schedule/"
        #验证数据集在定时任务中的显示
    When the data name is "{'column':'2','name':'<taskName>'}" then i click the "编辑" button
    And I will see the "timedTask.EditPage" page
    And I wait for "5000" millsecond
    And I wait for "dataSet" will be visible
    Then I will see the "dataSet" result will be "<dataSetResult>"

    Examples:
    |taskName     | dataSetResult|
    |父子行为汇聚   |(* AND tag:sample* AND (tag:beyond4 OR appname:apache))|

##################################无耻的分割线###############################

  Scenario Outline: 数据集父子行为继承
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Given I set the parameter "SearchInput" with value "<spl>"
        #选择父子行为为继承的数据集
    And I click the "jiCheng" button
    And I click the "DateEditor" button
    And I click the "RecentSevenDay" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"

    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I set the parameter "TaskName" with value "<taskName>"
    And I set the parameter "scheduleDescribe" with value "<describe>"
    And I set the parameter "CrontabInput" with value "<crontab>"

    And I set the parameter "TaskName" with value "<taskName>"
    And I click the "EnsureCrontab" button
    Then I will see the success message "保存成功"

    Examples:
      |spl                         |taskName |describe               | crontab       |
      |tag:"sample04061424" \| stats count() by apache.status|父子行为继承      |选择了父子行为为继承的数据集|0 */57 * * * ?|



  Scenario Outline: 定时任务编辑页面验证数据集（继承）
    Given open the "timedTask.ListPage" page for uri "/schedule/"
        #验证数据集在定时任务中的显示
    When the data name is "{'column':'2','name':'<taskName>'}" then i click the "编辑" button
    And I will see the "timedTask.EditPage" page
    And I wait for "5000" millsecond
    And I wait for "dataSet" will be visible
    Then I will see the "dataSet" result will be "<dataSetResult>"

    Examples:
       |taskName  | dataSetResult|
       |父子行为继承    |(* AND tag:sample*)|