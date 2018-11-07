@all @smoke @trend @trendSmoke
Feature: 趋势图搜索

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"

  Scenario Outline:
    When search "<search>" and I will see the column number "<num>" contains "<name>"

    Examples:
      | search                    | num | name          |
      | {'group':'default_Trend'} | 3   | default_Trend |
      | {'input':'auto'}          | 1   | auto          |