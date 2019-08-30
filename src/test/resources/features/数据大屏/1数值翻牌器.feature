@galaxee
Feature: 数据大屏数值翻牌器

  Background:
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"

  Scenario: 新建默认类型的数值翻牌器
    And I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Create" button
    And I set the parameter "Name" with value "数值翻牌器"
    And I click the "Ensure" button
    And I click the "Index" button
    And I click the "FlipNumber" button
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I set the parameter "ChartXaxis" with value "0"
    And I set the parameter "ChartYaxis" with value "0"
    And I click the "Data" button
    And I set the parameter "SplInput" with value "logtype:apache| eval is_resplen_empty=empty(apache.resp_len) | eval res_str=if(is_resplen_empty,"repslen_empty","resplen_non_null") | table apache.resp_len, is_resplen_empty, res_str | where is_resplen_empty==false"
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I choose the "apache.resp_len" from the "Type"
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario Outline: 修改为样式1
    When the galaxee name is "<name>" then I click the "el-button el-button--text" button
    And switch to window "<name>"
    Then I will see the "galaxee.CreatePage" page
    And I click the "Index" button
    And I click the "FlipNumber" button
    And I click the "Flip" button
    And I choose the "DINPro-Bold" from the "FlipWord"
    And I set the parameter "FlipWordSize" with value "62"
    And I set the parameter "Prefix" with value "$"
    And I set the parameter "Suffix" with value "¥"
    And I choose the "样式1" from the "FlipBackgroundStyle"
    And I click the "ChartPosition" button
    And I set the parameter "ChartXaxis" with value "0"
    And I set the parameter "ChartYaxis" with value "200"
    And I click the "Data" button
    And I set the parameter "SplInput" with value "logtype:apache| eval is_resplen_empty=empty(apache.resp_len) | eval res_str=if(is_resplen_empty,"repslen_empty","resplen_non_null") | table apache.resp_len, is_resplen_empty, res_str | where is_resplen_empty==false"
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I choose the "is_resplen_empty" from the "Type"
    And I click the "Save" button
    Then I will see the success message "保存成功"

    Examples:
      | name  |
      | 数值翻牌器 |

  Scenario Outline: 修改为无样式
    When the galaxee name is "<name>" then I click the "el-button el-button--text" button
    And switch to window "<name>"
    Then I will see the "galaxee.CreatePage" page
    And I click the "Index" button
    And I click the "FlipNumber" button
    And I click the "Flip" button
    And I choose the "DINPro-Bold" from the "FlipWord"
    And I set the parameter "FlipWordSize" with value "62"
    And I set the parameter "Prefix" with value "$"
    And I set the parameter "Suffix" with value "¥"
    And I choose the "K" from the "FlipScaling"
    And I click the "ChartPosition" button
    And I set the parameter "ChartXaxis" with value "0"
    And I set the parameter "ChartYaxis" with value "400"
    And I click the "Data" button
    And I set the parameter "SplInput" with value "logtype:apache| eval is_resplen_empty=empty(apache.resp_len) | eval res_str=if(is_resplen_empty,"repslen_empty","resplen_non_null") | table apache.resp_len, is_resplen_empty, res_str | where is_resplen_empty==false"
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I choose the "apache.resp_len" from the "Type"
    And I alter the element "RightArrow" style to "display: inline;"
    And I click the "RightArrow" button
    And I alter the element "LeftArrow" style to "display: inline;"
    And I click the "LeftArrow" button
    And I wait for "1000" millsecond
    And take part of "Preview" with name "galaxee/<name>"
    And I click the "Save" button
    Then I will see the success message "保存成功"

    Examples:
      | name  |
      | 数值翻牌器 |
