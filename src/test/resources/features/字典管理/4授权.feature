@dictionary
Feature: 字典_授权

  Background:
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible

  Scenario Outline: RZY-4151(授权页：添加用户权限-取消)
    When I click the "UploadButton" button
    Then I set the parameter "Name" with value "<dictionaryName>"
    And I upload a file with name "/src/test/resources/testdata/dictionary/wymtest1.csv"
    And I wait for "FileName" will be visible
    And I click the "UploadConfirm" button
    Then I will see the success message "创建字典成功"
    Then I click the "Ensure" button
    Then I refresh the website
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<dictionaryName>.csv'}" then i click the "授权" button in more menu
    And I wait for loading invisible
    Then I set the parameter "UserFilter" with value "<user>"
    And I click the "FilterIcon" button
    And I wait for loading invisible
    Then I "checked" the label before "<user> (-)" in the dictionary
    Then I check the label "checked" status before "<user> (-)" in the dictionary
    Then I click the "Cancel" button
    Then the data name is "{'column':'0','name':'<dictionaryName>.csv'}" then i click the "授权" button in more menu
    And I wait for loading invisible
    Then I set the parameter "UserFilter" with value "<user>"
    And I click the "FilterIcon" button
    And I wait for loading invisible
    Then I check the label "unchecked" status before "<user> (-)" in the dictionary

    Examples:
      | dictionaryName           | user |
      | wymtestauthorizecancel   | wym  |

  Scenario Outline: RZY-4149(授权页：添加用户权限-保存)
    When I click the "UploadButton" button
    Then I set the parameter "Name" with value "<dictionaryName>"
    And I upload a file with name "/src/test/resources/testdata/dictionary/wymtest1.csv"
    And I wait for "FileName" will be visible
    And I click the "UploadConfirm" button
    Then I will see the success message "创建字典成功"
    Then I click the "Ensure" button
    Then I refresh the website
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<dictionaryName>.csv'}" then i click the "授权" button in more menu
    And I wait for loading invisible
    Then I set the parameter "UserFilter" with value "<user>"
    And I click the "FilterIcon" button
    And I wait for loading invisible
    Then I "checked" the label before "<user> (-)" in the dictionary
    Then I check the label "checked" status before "<user> (-)" in the dictionary
    Then I click the "Ensure" button
    Then I will see the success message "保存成功"
    Then I click the "Ensure" button
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<dictionaryName>.csv'}" then i click the "授权" button in more menu
    And I wait for loading invisible
    Then I set the parameter "UserFilter" with value "<user>"
    And I click the "FilterIcon" button
    And I wait for loading invisible
    Then I check the label "checked" status before "<user> (-)" in the dictionary

    Examples:
      | dictionaryName        | user |
      | wymtestauthorizesave  | wym  |

  Scenario Outline: RZY-4150(授权页：取消用户权限-取消)
    When I click the "UploadButton" button
    Then I set the parameter "Name" with value "<dictionaryName>"
    And I upload a file with name "/src/test/resources/testdata/dictionary/wymtest1.csv"
    And I wait for "FileName" will be visible
    And I click the "UploadConfirm" button
    Then I will see the success message "创建字典成功"
    Then I click the "Ensure" button
    Then I refresh the website
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<dictionaryName>.csv'}" then i click the "授权" button in more menu
    And I wait for loading invisible
    Then I set the parameter "UserFilter" with value "<user>"
    And I click the "FilterIcon" button
    And I wait for loading invisible
    Then I "checked" the label before "<user> (-)" in the dictionary
    Then I check the label "checked" status before "<user> (-)" in the dictionary
    Then I click the "Ensure" button
    Then I will see the success message "保存成功"
    Then I click the "Ensure" button
    Then the data name is "{'column':'0','name':'<dictionaryName>.csv'}" then i click the "授权" button in more menu
    And I wait for loading invisible
    Then I set the parameter "UserFilter" with value "<user>"
    And I click the "FilterIcon" button
    Then I wait for loading invisible
    Then I "unchecked" the label before "<user> (-)" in the dictionary
    Then I check the label "unchecked" status before "<user> (-)" in the dictionary
    Then I click the "Cancel" button
    Then the data name is "{'column':'0','name':'<dictionaryName>.csv'}" then i click the "授权" button in more menu
    And I wait for loading invisible
    Then I set the parameter "UserFilter" with value "<user>"
    And I click the "FilterIcon" button
    And I wait for loading invisible
    Then I check the label "checked" status before "<user> (-)" in the dictionary

    Examples:
      | dictionaryName        | user |
      | wymtestrevokeauthexit | wym  |

  Scenario Outline: RZY-4152(授权页：取消用户权限-保存)
    When I click the "UploadButton" button
    Then I set the parameter "Name" with value "<dictionaryName>"
    And I upload a file with name "/src/test/resources/testdata/dictionary/wymtest1.csv"
    And I wait for "FileName" will be visible
    And I click the "UploadConfirm" button
    Then I will see the success message "创建字典成功"
    Then I click the "Ensure" button
    Then I refresh the website
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<dictionaryName>.csv'}" then i click the "授权" button in more menu
    And I wait for loading invisible
    Then I set the parameter "UserFilter" with value "<user>"
    And I click the "FilterIcon" button
    And I wait for loading invisible
    Then I "checked" the label before "<user> (-)" in the dictionary
    Then I check the label "checked" status before "<user> (-)" in the dictionary
    Then I click the "Ensure" button
    Then I will see the success message "保存成功"
    Then I click the "Ensure" button
    Then I wait for loading invisible
    Then the data name is "{'column':'0','name':'<dictionaryName>.csv'}" then i click the "授权" button in more menu
    And I wait for loading invisible
    Then I set the parameter "UserFilter" with value "<user>"
    And I click the "FilterIcon" button
    Then I wait for loading invisible
    Then I "unchecked" the label before "<user> (-)" in the dictionary
    Then I check the label "unchecked" status before "<user> (-)" in the dictionary
    Then I click the "Ensure" button
    Then I will see the success message "保存成功"
    Then I click the "Ensure" button
    Then the data name is "{'column':'0','name':'<dictionaryName>.csv'}" then i click the "授权" button in more menu
    And I wait for loading invisible
    Then I set the parameter "UserFilter" with value "<user>"
    And I click the "FilterIcon" button
    Then I wait for loading invisible
    Then I check the label "unchecked" status before "<user> (-)" in the dictionary

    Examples:
      | dictionaryName        | user |
      | wymtestrevokeauthsave | wym  |

  Scenario Outline: RZY-4160(授权页：自定义有效期-当前日期)
    When I click the "UploadButton" button
    Then I set the parameter "Name" with value "<dictionaryName>"
    And I upload a file with name "/src/test/resources/testdata/dictionary/wymtest1.csv"
    And I wait for "FileName" will be visible
    And I click the "UploadConfirm" button
    Then I will see the success message "创建字典成功"
    Then I click the "Ensure" button
    Then I refresh the website
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<dictionaryName>.csv'}" then i click the "授权" button in more menu
    And I wait for loading invisible
    Then I set the parameter "UserFilter" with value "<user>"
    And I click the "FilterIcon" button
    And I wait for loading invisible
    Then I "checked" the label before "<user> (-)" in the dictionary
    Then I check the label "checked" status before "<user> (-)" in the dictionary
    Then I click the "Indefinitely" button
    Then I click the "Customize" button
    And I click the "TimeSelector" button
    Then I click the "DateNow" button
    And I wait for "DateNow" will be invisible
    Then I will see the element "DeadLine" contains "20"
    Then I click the "Cancel" button
    Then the data name is "{'column':'0','name':'<dictionaryName>.csv'}" then i click the "授权" button in more menu
    And I wait for loading invisible
    Then I set the parameter "UserFilter" with value "<user>"
    And I click the "FilterIcon" button
    And I wait for loading invisible
    Then I check the label "unchecked" status before "<user> (-)" in the dictionary
    Then I will see the element "DeadLine" contains "无限期"

    Examples:
      | dictionaryName     | user |
      | wymtestcurrentdate | wym  |

  Scenario Outline: RZY-4158删除字典
    Then I set the parameter "SearchInput" with value "<dictionaryName>.csv"
    Given I wait for loading invisible
    When the data name is "{'column':'0','name':'<dictionaryName>.csv'}" then i click the "删除" button in more menu
    Then I will see the success message "确认删除 [<dictionaryName>.csv] ?"
    When I click the "Ensure" button
    Then I wait for element "SuccessMessage" change text to "删除成功"

    Examples:
      | dictionaryName              |
      | wymtestauthorizecancel      |
      | wymtestrevokeauthsave       |
      | wymtestrevokeauthexit       |
      | wymtestauthorizesave        |
      | wymtestcurrentdate          |