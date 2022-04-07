@dictionary
Feature: 字典管理

  Background:
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible

  @dictionarySmoke
  Scenario Outline: 新建字典
    When I click the "UploadButton" button
    Then I set the parameter "Name" with value "<dictionaryName>"
    And I upload a file with name "/src/test/resources/testdata/dictionary/wymtest1.csv"
    And I wait for "FileName" will be visible
    And I click the "UploadConfirm" button
    Then I will see the success message "创建字典成功"

    Examples:
      | dictionaryName  |
      | create_dict_1   |

  @dictionarySmoke
  Scenario Outline: 下载字典
    Then I set the parameter "SearchInput" with value "<dictionaryName>.csv"
    Given I wait for loading invisible
    And I will see the element "TotalItem" contains "共 1 条"
    When the data name is "{'column':'0','name':'<dictionaryName>.csv'}" then i click the "下载" button in more menu

    Examples:
      | dictionaryName  |
      | create_dict_1   |

  @dictionarySmoke
  Scenario Outline: 上传字典_名称重复
    When I click the "UploadButton" button
    Then I set the parameter "Name" with value "<dictionaryName>"
    And I upload a file with name "/src/test/resources/testdata/dictionary/wymtest1.csv"
    And I wait for "FileName" will be visible
    And I click the "UploadConfirm" button
    And I wait for loading invisible
    And I will see the text "名称重复" exist in page

    Examples:
      | dictionaryName  |
      | create_dict_1   |

  Scenario Outline: 上传字典_缺少文件
    When I click the "UploadButton" button
    Then I set the parameter "Name" with value "<dictionaryName>"
    And I click the "UploadConfirm" button
    And I wait for loading invisible
    And I will see the text "请上传字典文件" exist in page

    Examples:
      | dictionaryName  |
      | create_dict_2   |

  Scenario Outline: 上传文件step2
    Then I set the parameter "SearchInput" with value "<dictionaryName>.csv"
    Given I wait for loading invisible
    Then the data name is "{'column':'0','name':'<dictionaryName>.csv'}" then i click the "编辑" button
    Then I will see the "dictionary.CreatePage" page
    Given I wait for loading invisible
    And I upload a file with name "/src/test/resources/testdata/dictionary/wymdoubletest1.csv"
    And I wait for "FileName" will be visible
    And I click the "Next" button
    Then I wait for element "Name" value change text to "<dictionaryName>"
    Then I click the "Done" button
    And I will see the element "ResultMessage" contains "添加成功"

    Examples:
      | dictionaryName |
      | create_dict_1  |

  Scenario Outline: 修改名称
    Then I set the parameter "SearchInput" with value "<dictionaryName>.csv"
    Given I wait for loading invisible
    Then the data name is "{'column':'0','name':'<dictionaryName>.csv'}" then i click the "编辑" button
    Then I will see the "dictionary.CreatePage" page
    Given I wait for loading invisible
    And I will see the last line "bubble.test^archiver.process.fds" is display
    And I click the "Next" button
    Then I wait for element "Name" value change text to "<dictionaryName>"
    And I set the parameter "Name" with value "<new_name>"
    Then I click the "Done" button
    And I will see the element "ResultMessage" contains "添加成功"

    Examples:
      | dictionaryName | new_name       |
      | create_dict_1  |  create_dict_2 |

  Scenario Outline: 验证名称修改
    Then I set the parameter "SearchInput" with value "<dictionaryName>.csv"
    Given I wait for loading invisible
    And I will see the element "TotalItem" contains "共 1 条"
    When I click the "UploadButton" button
    Then I set the parameter "Name" with value "<dictionaryName>"
    And I upload a file with name "/src/test/resources/testdata/dictionary/wymtest1.csv"
    And I wait for "FileName" will be visible
    And I click the "UploadConfirm" button
    And I wait for loading invisible
    And I will see the text "名称重复" exist in page

    Examples:
      | dictionaryName  |
      | create_dict_2   |

  Scenario Outline: 名称重复_step3
    When I click the "UploadButton" button
    Then I set the parameter "Name" with value "<old_name>"
    And I upload a file with name "/src/test/resources/testdata/dictionary/wymtest1.csv"
    And I wait for "FileName" will be visible
    And I click the "UploadConfirm" button
    Then I will see the success message "创建字典成功"
    And I click the "Ensure" button
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<old_name>.csv'}" then i click the "编辑" button
    Then I will see the "dictionary.CreatePage" page
    Given I wait for loading invisible
    And I click the "Next" button
    And I set the parameter "Name" with value "<new_name>"
    Then I click the "Done" button
    And I will see the message contains "名称重复"
    And I wait for loading invisible
    And I click the "EnsureButton" button
    When I click the "Return" button
    And I wait for loading invisible
    Then I will see the "dictionary.ListPage" page
    Then I set the parameter "SearchInput" with value "<new_name>.csv"
    And I wait for loading invisible
    And I will see the element "TotalItem" contains "共 1 条"

    Examples:
      | new_name        | old_name       |
      | create_dict_2   | create_dict_1  |

  Scenario Outline: 删除字典
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    Then I set the parameter "SearchInput" with value "<dictionaryName>.csv"
    And I wait for loading invisible
    When the data name is "{'column':'0','name':'<dictionaryName>.csv'}" then i click the "删除" button in more menu
    Then I will see the success message "确认删除 [<dictionaryName>.csv] ?"
    When I click the "Ensure" button
    And I wait for loading invisible
    Then I will see the success message "删除成功"

    @dictionarySmoke
    Examples:
      | dictionaryName      |
      | create_dict_1       |

    Examples:
      | dictionaryName      |
      | create_dict_2       |