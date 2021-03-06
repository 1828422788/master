@galaxeeRC   @galaxee @galaxeeR
Feature: 数据大屏-所有控件发布

  Scenario Outline: 数据大屏-所有控件发布
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    And I wait for "7000" millsecond
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
    And I wait for "2000" millsecond
    And switch to window "<name>"
    And I wait for "loadingPage" will be invisible
    And I wait for "2000" millsecond
    And I close all tabs except main tab
    And I wait for "1000" millsecond
#    Then take a screenshot with name "galaxee/<name>"


    Examples:
      | name |
      | 折线图-搜索 |
      |折线图-静态数据|
      |折线图-绑定搜索|

      |数值翻牌器-样式搜索 |
      |数值翻牌器-静态数据  |
      |数值翻牌器-绑定搜索 |

      | 双轴折线图-XY轴-布局-搜索|
      |双轴折线图-静态数据|
      |双轴折线图-绑定搜索|

      |状态图demo |
      |状态图值异常-搜索 |
      |状态图值正常-静态数据 |
      |状态图值严重-绑定搜索 |

      |Top3样式-搜索    |
      |Top3数据之静态数据  |
      |Top3数据之绑定搜索 |

      | 区间图XY轴布局搜索 |
      |区间图-图例-静态数据|
      |区间图-绑定搜索|


      |百分比样式-搜索       |
      |百分比数据之静态数据  |
      |百分比数据之绑定搜索 |

      |揭示牌样式搜索   |
      |揭示牌数据之静态数据   |
      |揭示牌数据之绑定搜索 |


      |动态卡片样式搜索   |
      |动态卡片数据之静态数据  |
      |动态卡片数据之绑定搜索 |

      |动态卡片二样式搜索   |
      |动态卡片二数据之静态数据  |
      |动态卡片二数据之绑定搜索 |

      | 标题   |

      | 表格   |
      |表格数据之静态数据  |
      |表格数据之绑定搜索 |

      |实体数据之搜索值异常   |
      |实体数据之静态数据值严重   |
      |实体数据之绑定搜索 |


      |流程线默认设置      |
      |流程线样式       |


      | 全屏|


      | 边框默认设置样式1 |
      | 边框样式2 |
      | 边框样式3 |


      | 单张图片|


      |时间器默认设置    |
      |时间器样式   |
      |时间器样式2   |
      |时间器样式3   |

      |视频流   |
      |视频流样式   |

      |齿轮组合默认设置    |
      |齿轮组合样式      |


































