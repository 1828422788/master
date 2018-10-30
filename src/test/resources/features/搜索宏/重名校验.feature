@all @searchMacro
Feature: 搜索宏重名校验

  Background:
    Given I insert into table "Macro" with "{'name':'AutoTestForDuplicateName','domain_id':'1'}"
    Given I insert into table "Macro" with "{'name':'11','domain_id':'1'}"
    Given I insert into table "Macro" with "{'name':'test','domain_id':'1'}"
    Given I insert into table "Macro" with "{'name':'1test','domain_id':'1'}"
    Given I insert into table "Macro" with "{'name':'1重名','domain_id':'1'}"
    Given I insert into table "Macro" with "{'name':'test重名','domain_id':'1'}"
    Given I insert into table "Macro" with "{'name':'test重名12','domain_id':'1'}"
    And open the "searchMacro.ListPage" page for uri "/macro/"
    And I click the "CreateButton" button
    Then I will see the "searchMacro.CreatePage" page

  Scenario Outline:
    When I set the parameter "Name" with value "<name>"
    And I choose the "<group>" from the "Group"
    And I set the parameter "Definition" with value "<definition>"
    And I click the "SaveButton" button
    Then I will see the success message "<message>"

    Examples: 新建成功
      | name                     | group         | definition | message |
      | AutoTestForDuplicateName | default_Macro | $arg1$     | 保存成功    |
      | 11                       | default_Macro | $arg1$     | 保存成功    |
      | test                     | default_Macro | $arg1$     | 保存成功    |
      | 1test                    | default_Macro | $arg1$     | 保存成功    |
      | 1重名                      | default_Macro | $arg1$     | 保存成功    |
      | test重名                   | default_Macro | $arg1$     | 保存成功    |
      | test重名12                 | default_Macro | $arg1$     | 保存成功    |

  Scenario:
    Given I delete from "Macro" where "{'name':['AutoTestForDuplicateName','11','test','1test','1重名','test重名','test重名12']}"
