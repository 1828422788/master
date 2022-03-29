package com.yottabyte.utils;

import java.util.List;

/**
 * @author sunxj,sunxc
 */
public class Agent {
    private String ip;
    private List<String> ipList;
    private List<String> ipListWithdb;


    public Agent() {
        String sql = "SELECT ip FROM AgentStatus WHERE (`status`='Running' or `status`='Pending') AND last_update_timestamp> SUBDATE(NOW(),interval 15 minute)";
        String sqlWithdb = "SELECT ip FROM AgentStatus WHERE (`status`='Running' or `status`='Pending') AND last_update_timestamp> SUBDATE(NOW(),interval 15 minute) AND  platform like'%db%'";
        this.ipList = JdbcUtils.query(sql);
        this.ipListWithdb = JdbcUtils.query(sqlWithdb);
    }

    public String getIp() {
        if (ipList.size() != 0) {
            this.ip = ipList.get(0);
        }
        return ip;
    }
    public String getIpWithdb() {
        if (ipListWithdb.size() != 0) {
            this.ip = ipListWithdb.get(0);
        }
        return ip;
    }

}
