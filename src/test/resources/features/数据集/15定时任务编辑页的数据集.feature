@dataset
Feature: 数据集在定时任务中的应用【编辑页】

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  @dataset
  Scenario Outline: 数据集父子行为无
    Given I set the parameter "SearchInput" with value "<spl>"
        #选择父子行为为无的数据集
    And I click the "fatherChildNull" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"

    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I set the parameter "TaskName" with value "<taskName>"
    And I set the parameter "scheduleDescribe" with value "<describe>"

    And I set the parameter "CrontabInput" with value "<crontab>"

    And I click the "EnsureCrontab" button
    Then I will see the success message "保存成功"
    And I click the "timeTaskEnsure" button
        #验证数据集在定时任务中的显示
    And I click the "schedule" button
    Then I will see the "timedTask.ListPage" page
    And I wait for loading invisible

    When the data name is "{'column':'2','name':'无'}" then i click the "编辑" button

    And I will see the "timedTask.EditPage" page


    And I wait for loading invisible
    Then I will see the "dataSet" result will be "<dataSetResult>"

    Examples:
      |spl                         |taskName |describe               | crontab      |dataSetResult|
      |*\| stats count() by appname|无       |选择了父子行为为无的数据集 |0 */57 * * * ?|(tag:heka    |




  @dataset
  Scenario Outline: 数据集父子行为汇聚
    Given I set the parameter "SearchInput" with value "<spl>"
        #选择父子行为为汇聚的数据集
    And I click the "huiJu" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"

    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I set the parameter "TaskName" with value "<taskName>"
    And I set the parameter "scheduleDescribe" with value "<describe>"
    And I set the parameter "CrontabInput" with value "<crontab>"
    And I click the "EnsureCrontab" button
    Then I will see the success message "保存成功"
    And I click the "timeTaskEnsure" button
        #验证数据集在定时任务中的显示
    And I click the "schedule" button
    Then I will see the "timedTask.ListPage" page
    And I wait for loading invisible

    When the data name is "{'column':'2','name':'汇聚'}" then i click the "编辑" button
    And I will see the "timedTask.EditPage" page

    And I wait for loading invisible
    Then I will see the "dataSet" result will be "<dataSetResult>"

    Examples:
      |spl                         |taskName|describe               | crontab      | dataSetResult|
      |*\| stats count() by appname|汇聚     |选择了父子行为为汇聚的数据集|0 */57 * * * ?|(* AND tag:heka AND (tag:top_info OR appname:apache))|



  @dataset
  Scenario Outline: 数据集父子行为继承
    Given I set the parameter "SearchInput" with value "<spl>"
        #选择父子行为为继承的数据集
    And I click the "jiCheng" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"

    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I set the parameter "TaskName" with value "<taskName>"

    And I set the parameter "scheduleDescribe" with value "<describe>"


    And I set the parameter "CrontabInput" with value "<crontab>"
    And I click the "EnsureCrontab" button
    Then I will see the success message "保存成功"
    And I click the "timeTaskEnsure" button
        #验证数据集在定时任务中的显示
    And I click the "schedule" button
    Then I will see the "timedTask.ListPage" page
    And I wait for loading invisible

    When the data name is "{'column':'2','name':'继承'}" then i click the "编辑" button

    And I will see the "timedTask.EditPage" page

    And I wait for loading invisible
    Then I will see the "dataSet" result will be "<dataSetResult>"

    Examples:
      |spl                         |taskName |describe               | crontab       | dataSetResult|
      |*\| stats count() by appname|继承      |选择了父子行为为继承的数据集|0 */57 * * * ?|(* AND tag:heka)|
