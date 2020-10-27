@configsSmoke
Feature: 字段提取重命名字段

  Background:
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible

  @second
  Scenario Outline: 字段重命名（RZY-1590）
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "<log>"
    And I click the "AddRule" button
    And I choose the "JSON解析" from the "ParseRule" in config
    And I choose the "raw_message" from the "SourceField" in config
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I wait for "100" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "AddRule" button
    And I choose the "字段重命名" from the "ParseRule" in config
    And I set the parameter "SourceFieldInput" with value "a.b.c"
    And I set the parameter "TargetField" with value "c"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "100" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess2" will be visible
    Then I will see the element value in json "{'Result':'<result1>'}"

    Examples:
      | log                   | result                                                                 | result1                                            |
      | {"a":{"b":{"c":"d"}}} | Object\na:Object\nb:Object\nc:"d"\nraw_message:"{"a":{"b":{"c":"d"}}}" | Object\nc:"d"\nraw_message:"{"a":{"b":{"c":"d"}}}" |

  @second @configsSmoke
  Scenario Outline: RZY-2865、2866
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "<log>"
    And I click the "AddRule" button
    And I choose the "JSON解析" from the "ParseRule" in config
    And I choose the "raw_message" from the "SourceField" in config
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I wait for "100" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "AddRule" button
    And I choose the "字段重命名" from the "ParseRule" in config
    And I set the parameter "SourceFieldInput" with value "a.*.c"
    And I set the parameter "TargetField" with value "a.*.h"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "100" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess2" will be visible
    Then I will see the element value in json "{'Result':'<result1>'}"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    When I set the parameter "Name" with value "RZY2865支持通配符"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I upload a file with name "/src/test/resources/testdata/log/<lg>"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"
    Then I wait for "40000" millsecond
    When open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I set the parameter "SearchInput" with value "tag:<appName>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I move the mouse pointer to the "Result"
    And I click the "RightIcon" button
    Then I will see the spl search result "<searchResult>"

    Examples:
      | appName         | lg         | log                                 | result                                                                                                | result1                                                                                               | searchResult                                                    |
      | wym_test_rename | rename.log | {"a":{"b":{"c":"d"},"e":{"c":"g"}}} | Object\na:Object\nb:Object\nc:"d"\ne:Object\nc:"g"\nraw_message:"{"a":{"b":{"c":"d"},"e":{"c":"g"}}}" | Object\na:Object\nb:Object\nh:"d"\ne:Object\nh:"g"\nraw_message:"{"a":{"b":{"c":"d"},"e":{"c":"g"}}}" | {'other.a.b.h':'other.a.b.h: d ','other.a.e.h':'other.a.e.h: g '} |


  Scenario Outline: 重命名字段支持通配符详情页验证
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "<log>"
    And I click the "AddRule" button
    And I choose the "JSON解析" from the "ParseRule" in config
    And I choose the "raw_message" from the "SourceField" in config
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I wait for "100" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "AddRule" button
    And I choose the "字段重命名" from the "ParseRule" in config
    And I set the parameter "SourceFieldInput" with value "a.*.c"
    And I set the parameter "TargetField" with value "a.*.h"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "100" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess2" will be visible
    Then I will see the element value in json "{'Result':'<result1>'}"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I upload a file with name "/src/test/resources/testdata/log/<lg>"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"
    Then I wait for "90000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "详情" button
    And I wait for loading invisible
    Then I will see the config element "<rule1>" value is "<rule1> 1 1 0 0 0"
    Then I will see the config element "<rule2>" value is "<rule2> 1 1 0 0 0"

    Examples:
      | name           | rule1  | rule2 | appName         | lg         | log                                 | result                                                                                                | result1                                                                                               |
      | 重命名字段支持通配符详情验证 | JSON解析 | 字段重命名 | rename_detail | rename.log | {"a":{"b":{"c":"d"},"e":{"c":"g"}}} | Object\na:Object\nb:Object\nc:"d"\ne:Object\nc:"g"\nraw_message:"{"a":{"b":{"c":"d"},"e":{"c":"g"}}}" | Object\na:Object\nb:Object\nh:"d"\ne:Object\nh:"g"\nraw_message:"{"a":{"b":{"c":"d"},"e":{"c":"g"}}}" |
