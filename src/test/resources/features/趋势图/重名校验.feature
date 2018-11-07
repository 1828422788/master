@trend @all
Feature: 趋势图重名校验

  Background:
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