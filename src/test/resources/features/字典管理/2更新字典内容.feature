@dictionary
Feature: 字典管理_更新内容

  Background:
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible

  Scenario Outline: 更新字典内容-4个（上方插入行，下方插入行，左方插入列，右方插入列）
    When I click the "UploadButton" button
    Then I set the parameter "Name" with value "test_<button>"
    And I upload a file with name "/src/test/resources/testdata/dictionary/AutoTest.csv"
    And I wait for "FileName" will be visible
    And I click the "UploadConfirm" button
    Then I will see the success message "创建字典成功"
    And I click the "Ensure" button
    Given I wait for loading invisible
    Then the data name is "{'column':'0','name':'test_<button>.csv'}" then i click the "编辑" button
    Then I will see the "dictionary.CreatePage" page
    Given I wait for loading invisible
    And I open the context menu of the "Cell_A1" element
    And I click the Element with text "<button>"
    And I wait for loading invisible
    And I will see the element "<cell_1>" contains "<value_1>"
    And I will see the element "<cell_2>" contains "<value_2>"
    And I double click the "<new_cell_1>" element
    And I set the value "<new_cell_1>" to the textarea "CellInput"
    And I double click the "<new_cell_2>" element
    And I set the value "<new_cell_2>" to the textarea "CellInput"
    And I double click the "<new_cell_1>" element
    And I click the "Next" button
    Then I wait for element "Name" value change text to "test_<button>"
    Then I click the "Done" button
    And I will see the element "ResultMessage" contains "添加成功"
    And I click the "Return" button
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'test_<button>.csv'}" then i click the "编辑" button
    And I wait for loading invisible
    And I will see the element "<new_cell_1>" contains "<new_cell_1>"
    And I will see the element "<new_cell_2>" contains "<new_cell_2>"

    @dictionarySmoke
    Examples:
      | button     | cell_1   | value_1   | cell_2   |  value_2 | new_cell_1 | new_cell_2 |
      | 上方插入行 | Cell_A2  | logfile   | Cell_B2  | level    | Cell_A1    | Cell_B1    |

    Examples:
      | button     | cell_1   | value_1   | cell_2   |  value_2 | new_cell_1 | new_cell_2 |
      | 下方插入行 | Cell_A3  | System    | Cell_B3  | high     | Cell_A2    | Cell_B2    |
      | 左方插入列 | Cell_B1  | logfile   | Cell_B2  | System   | Cell_A1    | Cell_A2    |
      | 右方插入列 | Cell_C1  | level     | Cell_C2  | high     | Cell_B1    | Cell_B2    |


  Scenario Outline: 更新字典内容-1个（移除该行）
    When I click the "UploadButton" button
    Then I set the parameter "Name" with value "test_<button>"
    And I upload a file with name "/src/test/resources/testdata/dictionary/AutoTest.csv"
    And I wait for "FileName" will be visible
    And I click the "UploadConfirm" button
    Then I will see the success message "创建字典成功"
    And I click the "Ensure" button
    Given I wait for loading invisible
    Then the data name is "{'column':'0','name':'test_<button>.csv'}" then i click the "编辑" button
    Then I will see the "dictionary.CreatePage" page
    Given I wait for loading invisible
    And I open the context menu of the "<cell>" element
    And I click the Element with text "<button>"
    And I wait for loading invisible
    And I will see the element "<cell_1>" contains "<value_1>"
    And I will see the element "<cell_2>" contains "<value_2>"
    And I click the "Next" button
    Then I wait for element "Name" value change text to "test_<button>"
    Then I click the "Done" button
    And I will see the element "ResultMessage" contains "添加成功"
    And I click the "Return" button
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'test_<button>.csv'}" then i click the "编辑" button
    And I wait for loading invisible
    And I will see the element "<cell_1>" contains "<value_1>"
    And I will see the element "<cell_2>" contains "<value_2>"

    Examples:
      | button     | cell   | cell_1   | value_1   | cell_2   |  value_2 |
      | 移除该行   | Cell_1 | Cell_A1  | System    | Cell_B2  | middle   |


  Scenario Outline: 更新字典内容-1个（清空该列）
    When I click the "UploadButton" button
    Then I set the parameter "Name" with value "test_<button>"
    And I upload a file with name "/src/test/resources/testdata/dictionary/AutoTest.csv"
    And I wait for "FileName" will be visible
    And I click the "UploadConfirm" button
    Then I will see the success message "创建字典成功"
    And I click the "Ensure" button
    Given I wait for loading invisible
    Then the data name is "{'column':'0','name':'test_<button>.csv'}" then i click the "编辑" button
    Then I will see the "dictionary.CreatePage" page
    Given I wait for loading invisible
    And I open the context menu of the "<cell>" element
    And I click the Element with text "<button>"
    And I wait for loading invisible
    And I will see the text "logfile" is not existed in page
    And I will see the text "System" is not existed in page
    And I will see the text "sequrity" is not existed in page
    And I wait for loading invisible
    And I double click the "<cell_1>" element
    And I set the value "Cell_A1" to the textarea "CellInput"
    And I double click the "<cell_2>" element
    And I set the value "Cell_A2" to the textarea "CellInput"
    And I double click the "<cell_1>" element
    And I click the "Next" button
    Then I wait for element "Name" value change text to "test_<button>"
    Then I click the "Done" button
    And I will see the element "ResultMessage" contains "添加成功"
    And I click the "Return" button
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'test_<button>.csv'}" then i click the "编辑" button
    And I wait for loading invisible
    And I will see the text "logfile" is not existed in page
    And I will see the text "System" is not existed in page
    And I will see the element "<cell_1>" contains "Cell_A1"
    And I will see the element "<cell_2>" contains "Cell_A2"

    Examples:
      | button     | cell   | cell_1   | cell_2   |
      | 清空该列   | Cell_A | Cell_A1  | Cell_A2  |

  Scenario: 更新字典内容-1个（剪切，撤销，恢复）
    When I click the "UploadButton" button
    Then I set the parameter "Name" with value "test_剪切"
    And I upload a file with name "/src/test/resources/testdata/dictionary/AutoTest.csv"
    And I wait for "FileName" will be visible
    And I click the "UploadConfirm" button
    Then I will see the success message "创建字典成功"
    And I click the "Ensure" button
    Given I wait for loading invisible
    Then the data name is "{'column':'0','name':'test_剪切.csv'}" then i click the "编辑" button
    Then I will see the "dictionary.CreatePage" page
    Given I wait for loading invisible
    And I open the context menu of the "Cell_B1" element
    And I click the Element with text "剪切"
    And I wait for loading invisible
    And I will see the text "level" is not existed in page
    And I open the context menu of the "Cell_B1" element
    And I click the Element with text "撤销"
    And I wait for loading invisible
    And I will see the text "level" exist in page
    And I open the context menu of the "Cell_B1" element
    And I click the Element with text "恢复"
    And I wait for loading invisible
    And I will see the text "level" is not existed in page
    And I click the "Next" button
    Then I wait for element "Name" value change text to "test_剪切"
    Then I click the "Done" button
    And I will see the element "ResultMessage" contains "添加成功"
    And I click the "Return" button
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'test_剪切.csv'}" then i click the "编辑" button
    And I wait for loading invisible
    And I will see the text "level" is not existed in page

  @dictionarySmoke
  Scenario: 更新字典内容-1个（撤销，重置）
    When I click the "UploadButton" button
    Then I set the parameter "Name" with value "test_重置"
    And I upload a file with name "/src/test/resources/testdata/dictionary/AutoTest.csv"
    And I wait for "FileName" will be visible
    And I click the "UploadConfirm" button
    Then I will see the success message "创建字典成功"
    And I click the "Ensure" button
    Given I wait for loading invisible
    Then the data name is "{'column':'0','name':'test_重置.csv'}" then i click the "编辑" button
    Then I will see the "dictionary.CreatePage" page
    Given I wait for loading invisible
    And I click the Element with text "撤销"
    And I will see the message contains "没有可以回退的操作 (如果调整了浏览器窗口大小，表格被重新渲染，无法回退到调整前的状态)"
    And I click the "EnsureButton" button
    And I wait for loading invisible
    And I open the context menu of the "Cell_B1" element
    And I click the Element with text "移除该行"
    And I wait for loading invisible
    And I will see the text "level" is not existed in page
    And I click the Element with text "撤销"
    And I will see the text "level" exist in page
    And I open the context menu of the "Cell_B1" element
    And I click the Element with text "移除该行"
    And I wait for loading invisible
    And I will see the text "level" is not existed in page
    And I click the Element with text "重置"
    And I will see the text "level" exist in page
    And I click the "Next" button
    Then I wait for element "Name" value change text to "test_重置"
    Then I click the "Done" button
    And I will see the element "ResultMessage" contains "添加成功"
    And I click the "Return" button
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'test_重置.csv'}" then i click the "编辑" button
    And I wait for loading invisible
    And I will see the text "level" exist in page