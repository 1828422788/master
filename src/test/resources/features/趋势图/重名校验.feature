@trend @all
Feature: 趋势图重名校验

  Background:
    Given I insert into table "Trend" with "{'name':'sunxjautotest','domain_id':'1','creator_id':'1'}"
    Given I insert into table "Trend" with "{'name':'11','domain_id':'1','creator_id':'1'}"
    Given I insert into table "Trend" with "{'name':'test','domain_id':'1','creator_id':'1'}"
    Given I insert into table "Trend" with "{'name':'1test','domain_id':'1','creator_id':'1'}"
    Given I insert into table "Trend" with "{'name':'1重名','domain_id':'1','creator_id':'1'}"
    Given I insert into table "Trend" with "{'name':'test重名','domain_id':'1','creator_id':'1'}"
    Given I insert into table "Trend" with "{'name':'test重名11','domain_id':'1','creator_id':'1'}"
    And open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    Then I will see the "trend.CreatePage" page

  Scenario Outline:
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "<describe>"
    And I choose the "<group>" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "Save" button
    Then I will see the success message "创建成功"

    Examples:
      | name          | describe | group         | spl                                  |
      | sunxjautotest | test     | default_Trend | * \|stats count() by appname,logtype |
      | 11            | test     | default_Trend | * \|stats count() by appname,logtype |
      | test          | test     | default_Trend | * \|stats count() by appname,logtype |
      | 1test         | test     | default_Trend | * \|stats count() by appname,logtype |
      | 1重名           | test     | default_Trend | * \|stats count() by appname,logtype |
      | test重名        | test     | default_Trend | * \|stats count() by appname,logtype |
      | test重名11      | test     | default_Trend | * \|stats count() by appname,logtype |

  Scenario:
    Given I delete from "Trend" where "{'name':['sunxjautotest','11','test','1test','1重名','test重名','test重名11']}"




