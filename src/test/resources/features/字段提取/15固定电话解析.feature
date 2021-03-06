@configs @configsFixedPhone
Feature: 字段提取固定电话解析

  Scenario Outline: 固定电话解析（RZY-1558、RZY-1561）
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "03188433218"
    And I click the "AddRule" button
    And I choose the "固定电话解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I click the "<checkBox>" button
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    And I will see the field extraction result "<result>"

    Examples:
      | checkBox | result  |
      |          | {'geo.city':'衡水市','geo.country':'中国','geo.latitude':'37.72831','geo.longitude':'115.69151','geo.province':'河北','geo.telephone':'03188433218','raw_message':'03188433218'} |

    @configsSmoke
    Examples:
      | checkBox | result  |
      | Checkbox | {'city':'衡水市','country':'中国','latitude':'37.72831','longitude':'115.69151','province':'河北','raw_message':'03188433218'}                             |