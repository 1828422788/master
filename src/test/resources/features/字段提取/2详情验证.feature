@configsSmoke
Feature: 字段提取详情验证

  Scenario Outline: 验证详情a
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "详情" button
    And I wait for loading invisible
    Then I will see the config element "<rule1>" value is "<rule1> 1 1 0 0 0"
    Then I will see the config element "<rule2>" value is "<rule2> 1 1 0 0 0"

    Examples:
      | name             | rule1    | rule2  |
      | RZY2875script解析  | 自定义解析    | JSON解析 |
      | RZY2877base64解析  | base64解析 | 正则解析   |
      | RZY2883unicode解析 | 自定义解析    | 正则解析   |


  Scenario Outline: 验证详情b
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "详情" button
    And I wait for loading invisible
    Then I will see the config element "<rule1>" value is "<rule1> 1 1 0 0 0"

    Examples:
      | name               | rule1 |
      | RZY2870创建dissect解析 | 自定义解析 |

