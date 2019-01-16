@all @searchMacro
Feature: 搜索宏新建

  Scenario Outline:
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    When I click the "CreateButton" button
    Then I will see the "searchMacro.CreatePage" page
    When I set the parameter "Name" with value "<name>"
    And I choose the "<group>" from the "Group"
    And I set the parameter "Definition" with value "<definition>"
    And I click the "<button>" button
    And I set the parameter "Param" with value "<param>"
    And I set the parameter "ValidateExpression" with value "<validateExpression>"
    And I set the parameter "ValidateFalseInfo" with value "<validateFalseInfo>"
    And I click the "SaveButton" button
    Then I will see the <message>

  @smoke @searchMacroSmoke
    Examples: 新建成功
      | name           | group         | definition                                                                                                                  | button   | param | validateExpression   | validateFalseInfo | message                |
      | UIAutoTest(1)  | default_Macro | tag:sample04061424 \| stats count() by apache.clientip, apache.version \| where apache.clientip==$x$                        |          | x     | isstr(x)             | 请输⼊字符串            | success message "保存成功" |
      | UIAutoTest(2)  | default_Macro | tag:sample04061424 \| stats count() by apache.clientip, apache.version \| where apache.clientip==$x$ && apache.version==$y$ |          | x,y   | isstr(x) && isstr(y) | 参数错误，请输⼊正确的参数     | success message "保存成功" |
      | UIAutoTest(3)  | default_Macro | "if(isstr($z$),$x$-$y$,$x$+$y$)"                                                                                            | Checkbox | x,y,z |                      |                   | success message "保存成功" |
      | UIAutoTest1(3) | default_Macro | "if(isstr($z$),$x$-$y$,$x$+$y$)"                                                                                            |          | x,y,z |                      |                   | success message "保存成功" |
      | UIAutoTest1(1) | default_Macro | "substring($x$,2)"                                                                                                          | Checkbox | x     | isstr(x)             | 请输入字符串            | success message "保存成功" |

    Examples: 新建失败
      | name | group         | definition | button | param | validateExpression | validateFalseInfo | message                |
      |      |               |            |        |       |                    |                   | error message "名称不能为空" |

  @smoke @searchMacroSmoke
  Scenario Outline: 验证1-2个参数
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I save the result "{'ClientIp':'Column1','Version':'Column2','Count':'Column3'}"
    And I set the parameter "SearchInput" with value "<splQuery1>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I compare with "{'ClientIp':'Column1','Version':'Column2','Count':'Column3'}"

    Examples:
      | splQuery                            | splQuery1                                                                                                                                 |
      | `UIAutoTest("23.166.125.53")`       | tag:sample04061424 \| stats count() by apache.clientip, apache.version \| where apache.clientip=="23.166.125.53"                          |
      | `UIAutoTest("23.166.125.53","1.1")` | tag:sample04061424 \| stats count() by apache.clientip, apache.version \| where apache.clientip=="23.166.125.53" && apache.version=="1.1" |

  @smoke @searchMacroSmoke
  Scenario Outline: 验证（eval）
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "RightIcon" button
    Then I will see the "XValue" result will be "<value>"

    Examples: 新建成功
      | splQuery                                          | value                |
      | tag:sample04061424 \| eval x=`UIAutoTest(1,2,3)`  | 3                    |
      | tag:sample04061424 \| eval x=`UIAutoTest1(1,2,3)` | if(isstr(3),1-2,1+2) |
