@dictionary
Feature: 字典_标签

  Background:
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible

  Scenario Outline: RZY-4145(列表页添加一个标签)
    When I click the "UploadButton" button
    Then I set the parameter "Name" with value "<dictionaryName>"
    And I upload a file with name "/src/test/resources/testdata/dictionary/wymtest1.csv"
    And I wait for "FileName" will be visible
    And I click the "UploadConfirm" button
    Then I will see the success message "创建字典成功"
    Then I click the "Ensure" button
    Then I refresh the website
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<dictionaryName>.csv'}" then i click the "标签" button in more menu
    And I choose the "<newTag>" from the "TagField"
    Then I click the "Ensure" button
    And I will see the success message "修改成功"
    Then I click the "Ensure" button
    And I wait for loading invisible
    And the data name is "<dictionaryName>.csv" then I "expand" the item
    And I will see the element "ExpandedRow" contains "资源标签..............<newTag>"

    Examples:
      | dictionaryName             | newTag       |
      | wymtestaddonetagatlistpage | auto_package |

  Scenario Outline: RZY-4146(列表页修改标签old->new)
    When I click the "UploadButton" button
    Then I set the parameter "Name" with value "<dictionaryName>"
    And I upload a file with name "/src/test/resources/testdata/dictionary/wymtest1.csv"
    And I wait for "FileName" will be visible
    And I choose the "<oldTag>" from the "TagField"
    And I click the "UploadConfirm" button
    Then I will see the success message "创建字典成功"
    Then I click the "Ensure" button
    Then I refresh the website
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<dictionaryName>.csv'}" then i click the "标签" button in more menu
    Then I click the "DeleteIcon" button
    And I choose the "<newTag>" from the "TagField"
    Then I click the "Ensure" button
    And I will see the success message "修改成功"
    Then I click the "Ensure" button
    And I wait for loading invisible
    And the data name is "<dictionaryName>.csv" then I "expand" the item
    And I will see the element "ExpandedRow" contains "资源标签..............<newTag>"

    Examples:
      | dictionaryName             | newTag      | oldTag       |
      | wymtestchangetagatlistpage | pre_package | auto_package |


  Scenario Outline: 按照标签搜索字典
    When I click the "UploadButton" button
    Then I set the parameter "Name" with value "<dictionaryName>"
    And I upload a file with name "/src/test/resources/testdata/dictionary/wymtest1.csv"
    And I wait for "FileName" will be visible
    And I choose the "<tag>" from the "TagField"
    And I click the "UploadConfirm" button
    Then I will see the success message "创建字典成功"
    Then I click the "Ensure" button
    Then I refresh the website
    And I wait for loading invisible
    And I choose the "<tag>" from the "ResourceDropdown"
    And I wait for loading invisible
    Then I will see the search result contains "{'column':'0','name':'<dictionaryName>.csv'}"

    Examples:
      | dictionaryName | tag          |
      | wymtest        | auto_package |

  Scenario Outline: RZY-4147(列表页清空全部标签)
    When I click the "UploadButton" button
    Then I set the parameter "Name" with value "<dictionaryName>"
    And I upload a file with name "/src/test/resources/testdata/dictionary/wymtest1.csv"
    And I wait for "1000" millsecond
    And I choose the "<twoTag>" from the "TagField"
    And I click the "UploadConfirm" button
    Then I will see the success message "创建字典成功"
    Then I click the "Ensure" button
    Then I refresh the website
    And I wait for loading invisible
    And the data name is "<dictionaryName>.csv" then I "expand" the item
    And I will see the element "ExpandedRow" contains "auto_package"
    And I will see the element "ExpandedRow" contains "pre_package"
    Then the data name is "{'column':'0','name':'<dictionaryName>.csv'}" then i click the "标签" button in more menu
    Then I click the "DeleteIcon" button
    Then I click the "DeleteIcon" button
    Then I click the "Ensure" button
    And I will see the success message "修改成功"
    Then I click the "Ensure" button
    Then I wait for loading invisible
    And the data name is "<dictionaryName>.csv" then I "expand" the item
    And I will see the element "ExpandedRow" contains "资源标签..............<newTag>"

    Examples:
      | dictionaryName            | newTag | twoTag                   |
      | wymtestcleartagatlistpage | 无     | auto_package,pre_package |

  Scenario Outline: RZY-4158删除字典
    Then I set the parameter "TextFilter" with value "<dictionaryName>.csv"
    Given I wait for loading invisible
    When the data name is "{'column':'0','name':'<dictionaryName>.csv'}" then i click the "删除" button in more menu
    Then I will see the success message "确认删除 [<dictionaryName>.csv] ?"
    When I click the "Ensure" button
    Then I wait for element "SuccessMessage" change text to "删除成功"

    Examples:
      | dictionaryName              |
      | wymtestaddonetagatlistpage  |
      | wymtestchangetagatlistpage  |
      | wymtest                     |
      | wymtestcleartagatlistpage   |