@configs @cleanConfigs
Feature: 字段提取删除

  Scenario Outline:
    Given open the "configs.ListPage" page for uri "/configs/"
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureButton" button

  @configsSmoke
    Examples:
      | name         |
      | AutoTest(副本) |

    Examples:
      | name            |
      | return          |
      | message         |
      | workflow        |
      | RZY-2866搜索页结果验证 |
      | RZY-2861新建字段提取  |

  @cleanTrend @cleanEssentialData
    Examples:
      | name             |
      | dapper           |
      | AutoTestForTrend |

  @clean @cleanSecond
    Examples:
      | name               |
      | 脱敏                 |
      | RZY2883unicode解析   |
      | RZY2877base64解析    |
      | RZY2875script解析    |
      | RZY2872正则片段解析      |
      | RZY2870创建dissect解析 |
      | redirect主规则        |
      | redirect副规则        |
      | RZY2864在搜索页验证严格解析  |

  @cleanFirst @clean
    Examples:
      | name     |
      | AutoTest |