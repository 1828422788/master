@timedTask @all
Feature: 定时任务重名校验

  Background:
    Given I insert into table "SavedSchedule" with "{'name':'AutoTestForDuplicateName','domain_id':'1','owner_id':'1'}"
    Given I insert into table "SavedSchedule" with "{'name':'11','domain_id':'1','owner_id':'1'}"
    Given I insert into table "SavedSchedule" with "{'name':'test','domain_id':'1','owner_id':'1'}"
    Given I insert into table "SavedSchedule" with "{'name':'1test','domain_id':'1','owner_id':'1'}"
    Given I insert into table "SavedSchedule" with "{'name':'1重名','domain_id':'1','owner_id':'1'}"
    Given I insert into table "SavedSchedule" with "{'name':'test重名','domain_id':'1','owner_id':'1'}"
    Given I insert into table "SavedSchedule" with "{'name':'test重名12','domain_id':'1','owner_id':'1'}"
    And open the "splSearch.SearchPage" page for uri "/search/"

  Scenario Outline:
    When I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I set the parameter "TaskName" with value "<name>"
    And I set the parameter "Describe" with value "<describe>"
    And I choose the "<users>" from the "UserComboBox"
    And I choose the "<groups>" from the "GroupComboBox"
    And I set the parameter "Period" with value "<period>"
    And I set the time input "StartTime" to "2" minutes later
    And I click the "EnsureButton" button
    And I display the element "TimePanel"
    And I click the "Ensure" button
    Then I will see the success message "<message>"

    Examples: 保存成功
      | splQuery                                      | name                     | describe | users | groups                | period | message |
      | tag:"sample04061424" \| top 1 apache.resp_len | AutoTestForDuplicateName | autotest | owner | default_SavedSchedule | 360    | 保存成功    |
      | tag:"sample04061424" \| top 1 apache.resp_len | 11                       | autotest | owner | default_SavedSchedule | 360    | 保存成功    |
      | tag:"sample04061424" \| top 1 apache.resp_len | test                     | autotest | owner | default_SavedSchedule | 360    | 保存成功    |
      | tag:"sample04061424" \| top 1 apache.resp_len | 1test                    | autotest | owner | default_SavedSchedule | 360    | 保存成功    |
      | tag:"sample04061424" \| top 1 apache.resp_len | 1重名                      | autotest | owner | default_SavedSchedule | 360    | 保存成功    |
      | tag:"sample04061424" \| top 1 apache.resp_len | test重名                   | autotest | owner | default_SavedSchedule | 360    | 保存成功    |
      | tag:"sample04061424" \| top 1 apache.resp_len | test重名12                 | autotest | owner | default_SavedSchedule | 360    | 保存成功    |

  Scenario:
    Given I delete from "SavedSchedule" where "{'name':['AutoTestForDuplicateName','11','test','1test','1重名','test重名','test重名12']}"

