@dataset @datasetCreate
Feature: 数据集_01新建

  Background:
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading invisible

  Scenario Outline: RZY-4082:新建数据集
    When I click the "Create" button
    And I set the parameter "Name" with value "<name>"
    And I choose the "test_app" from the "AppField"
    And I set the parameter "Alias" with value "<alias>"
    And I set the parameter "Spl" with value "<spl>"
    And I choose the "auto_package" from the "TagField"
    And I click the "Ensure" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible
    And I click the "Return" button
    Then I will see the "dataset.ListPage" page
    And I wait for loading invisible
    When I set the parameter "TextFilter" with value "<name>"
    And I wait for loading invisible
    Then I will see the data "{'column':'0','name':'JNDTest'}" values "{'column':'2','name':'jnd'}"
    And I will see the data "{'column':'0','name':'JNDTest'}" values "{'column':'3','name':'无'}"
    And I will see the data "{'column':'0','name':'JNDTest'}" values "{'column':'4','name':'test_app'}"
    And the data name is "{'column':'0','name':'JNDTest'}" then I "expand" the item
    And I will see the element "ExpandedRow" contains "创建者..................admin"
    And I will see the element "ExpandedRow" contains "资源标签..............auto_package"

    Examples: 新建成功
      | name    | alias | spl |
      | JNDTest | jnd   | *   |

  Scenario Outline: RZY-4075:按资源查询
    When I choose the "<tag>" from the "TagFilter"
    And I wait for loading invisible
    And the data name is "{'column':'0','name':'<name>'}" then I "expand" the item
    And I will see the element "ExpandedRow" contains "资源标签..............<tag>"
    Then I will see the search result "{'column':'0','name':'all_','contains':'no'}"

    Examples:
      | tag          | name    |
      | auto_package | JNDTest |

  Scenario Outline: RZY-4076:按名称查询
    When I set the parameter "TextFilter" with value "<name>"
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'<name>'}"
    Then I will see the search result "{'column':'0','name':'all_','contains':'no'}"

    Examples:
      | name    |
      | JNDTest |

  Scenario: RZY-4074:按应用查询
    And I choose the "test_app" from the "AppFilter"
    And I wait for loading invisible
    Then I will see the data "{'column':'0','name':'JNDTest'}" values "{'column':'4','name':'test_app'}"
    Then I will see the search result "{'column':'0','name':'all_','contains':'no'}"

  Scenario Outline: RZY-4078:标签
    When the data name is "{'column':'0','name':'<name>'}" then i click the "标签" button in more menu
    And I choose the "<tag>" from the "TagField"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    And I wait for loading invisible
    And the data name is "{'column':'0','name':'<name>'}" then I "expand" the item
    And I will see the element "ExpandedRow" contains "auto_package"
    And I will see the element "ExpandedRow" contains "1pre_package"

    Examples:
      | name    | tag          |
      | JNDTest | 1pre_package |

  Scenario Outline: 新建数据集失败-RZY-4086,4087,4088
    When I click the "Create" button
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Alias" with value "<alias>"
    And I click the "Ensure" button
    And I will see the element "HelpMessage" contains "<message>"

  Examples:
    | name | alias | message          |
    |      |       | 请输入数据集名称 |
    | test |       | 请输入别名       |
    | test | test  | 请输入约束语句   |