@configsSmoke
Feature: 字段提取固定电话解析

  Scenario Outline: 固定电话解析（RZY-1558、RZY-1561）
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "<log>"
    And I click the "AddRule" button
    And I choose the "<parseRule>" from the "ParseRule"
    And I choose the "<field>" from the "SourceField"
    And I click the "<checkBox>" button
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"

    Examples:
      | log         | parseRule | field       | checkBox | result                                                                                                                                                  |
      | 03188433218 | 固定电话解析    | raw_message |          | Object\ngeo:Object\ncity:"衡水市"\ncountry:"中国"\nlatitude:37.72831\nlongitude:115.69151\nprovince:"河北"\ntelephone:"03188433218"\nraw_message:"03188433218" |
      | 03188433218 | 固定电话解析    | raw_message | Checkbox | Object\ncity:"衡水市"\ncountry:"中国"\nlatitude:37.72831\nlongitude:115.69151\nprovince:"河北"\nraw_message:"03188433218"                                      |
