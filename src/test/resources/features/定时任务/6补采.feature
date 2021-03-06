@timedTask @complementTimedTask
Feature:定时任务_6补采

  Scenario Outline: 新建定时任务
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "* | stats count() by tag"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And switch to window "编辑报表"
    And I close all tabs except main tab
    Then I will see the "timedTask.EditPage" page
    And I wait for element "SelectedUser" change text to username
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "CrontabInput" with value "0 */30 * * * ?"
    And I click the "Submit" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"

    @timedTaskSmoke
    Examples:
      |    name              |
      | Test_Complement      |

    Examples:
      |    name              |
      | Test_Complement_2    |

  Scenario: 创建补采任务_覆盖已存在定时任务结果
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for loading invisible
    And I click the "Complement" button
    And I will see the "timedTask.ListPage" page
    And I wait for loading invisible
    When I click the "CreateComplement" button
    Then I wait for "ComplementPanel" will be visible
    And I wait for "1000" millsecond
    When I choose the "Test_Complement_2" from the "SelectName"
    And I click the "DatePicker" button
    And I set the parameter "StartDate" with value "2020-04-28"
    And I set the parameter "StartTime" with value "00:00:00.000"
    And I set the parameter "EndDate" with value "2020-04-28"
    And I set the parameter "EndTime" with value "05:00:00.000"
    And I click the "Apply" button
    And I click the "Overwrite" button
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "创建成功"
#    And I will see the data "{'column':'0','name':'Test_Complement_2'}" values "{'column':'6','name':'准备执行'}"
    And I will see the data "{'column':'0','name':'Test_Complement_2'}" values "{'column':'5','name':'是'}"

  @timedTaskSmoke
  Scenario: 创建补采任务
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for loading invisible
    And I click the "Complement" button
    And I will see the "timedTask.ListPage" page
    And I wait for loading invisible
    When I click the "CreateComplement" button
    Then I wait for "ComplementPanel" will be visible
    When I choose the "Test_Complement" from the "SelectName"
    And I click the "DatePicker" button
    And I set the parameter "StartDate" with value "2020-04-28"
    And I set the parameter "StartTime" with value "00:00:00.000"
    And I set the parameter "EndDate" with value "2020-04-28"
    And I set the parameter "EndTime" with value "05:00:00.000"
    And I click the "Apply" button
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "创建成功"
    And I refresh the website
    And I will see the "timedTask.ListPage" page
    And I wait for "2000" millsecond
#    And I will see the data "{'column':'0','name':'Test_Complement'}" values "{'column':'6','name':'准备执行'}"
    And I will see the data "{'column':'0','name':'Test_Complement'}" values "{'column':'5','name':'否'}"
    When the data name is "{'column':'0','name':'Test_Complement'}" then i click the "暂停" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "暂停成功"
    And I refresh the website
    And I will see the "timedTask.ListPage" page
    And I wait for "2000" millsecond
    And I will see the data "{'column':'0','name':'Test_Complement'}" values "{'column':'6','name':'停止'}"
    When the data name is "{'column':'0','name':'Test_Complement'}" then i click the "恢复" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "恢复成功"


  Scenario: 创建补采任务_检查提示1
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for loading invisible
    And I click the "Complement" button
    And I will see the "timedTask.ListPage" page
    And I wait for loading invisible
    When I click the "CreateComplement" button
    Then I wait for "ComplementPanel" will be visible
    When I click the "Ensure" button
    And I wait for "Notice" will be visible
    Then I will see the element "Notice" contains "请选择定时任务"

  Scenario: 创建补采任务_检查提示2
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for loading invisible
    And I click the "Complement" button
    And I will see the "timedTask.ListPage" page
    And I wait for loading invisible
    When I click the "CreateComplement" button
    Then I wait for "ComplementPanel" will be visible
    When I choose the "Test_Complement" from the "SelectName"
    And I click the "DatePicker" button
    And I set the parameter "StartDate" with value "2021-04-28"
    And I set the parameter "StartTime" with value "00:00:00.000"
    And I set the parameter "EndDate" with value "2021-04-29"
    And I set the parameter "EndTime" with value "05:00:00.000"
    And I click the "Apply" button
    And I wait for "2000" millsecond
    And I move the mouse pointer to the "SelectNameField"
    And I click the "DeleteSelection" button
    When I click the "Ensure" button
    #问题：RZY-6574
#    And I wait for "Notice" will be visible
#    Then I will see the element "Notice" contains "请选择定时任务"

  Scenario: 创建补采任务_检查提示3
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for loading invisible
    And I click the "Complement" button
    And I will see the "timedTask.ListPage" page
    And I wait for loading invisible
    When I click the "CreateComplement" button
    Then I wait for "ComplementPanel" will be visible
    When I choose the "Test_Complement" from the "SelectName"
    And I click the "Ensure" button
    And I wait for "Notice" will be visible
    Then I will see the element "Notice" contains "请选择时间范围"

  Scenario: 创建补采任务_检查提示4
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for loading invisible
    And I click the "Complement" button
    And I will see the "timedTask.ListPage" page
    And I wait for loading invisible
    When I click the "CreateComplement" button
    Then I wait for "ComplementPanel" will be visible
    When I choose the "Test_Complement" from the "SelectName"
    And I click the "DatePicker" button
    And I set the parameter "StartDate" with value "2020-04-28"
    And I set the parameter "StartTime" with value "00:00:00.000"
    And I set the parameter "EndDate" with value "2029-04-28"
    And I set the parameter "EndTime" with value "05:00:00.000"
    And I click the "Apply" button
    And I click the "Ensure" button
    And I wait for "Notice" will be visible
    Then I will see the element "Notice" contains "非法时间范围"

