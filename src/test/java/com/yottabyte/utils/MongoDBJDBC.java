package com.yottabyte.utils;

import com.mongodb.BasicDBObject;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.gridfs.GridFSBucket;
import com.mongodb.client.gridfs.GridFSBuckets;
import com.mongodb.gridfs.GridFS;
import com.yottabyte.entity.Account;
import org.bson.Document;
import org.bson.types.ObjectId;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author sunxj
 */
public class MongoDBJDBC {

    private static MongoDatabase getMongoDatabase() {
        MongoDatabase mongoDatabase = getMongoClient().getDatabase("spl");
        return mongoDatabase;
    }

    private static MongoClient getMongoClient() {
        String uri = getUri();
        MongoClientURI mongoClientURI = new MongoClientURI(uri);

        //通过连接认证获取MongoDB连接
        MongoClient mongoClient = new MongoClient(mongoClientURI);
        System.out.println("Connect to database successfully");
        return mongoClient;
    }

    private static String getUri() {
        JdbcUtils jdbcUtils = new JdbcUtils();
        jdbcUtils.setProperties();

        String sql = "select i.NAME from rizhiyi_manager.instance i left join rizhiyi_manager.module m on m.id = i.module_id where m.name = 'mongodb'";
        List<String> ipList = JdbcUtils.query(sql);
        StringBuffer uri = new StringBuffer("mongodb://rizhiyi:rizhiyi&2018@");
        for (String ip : ipList) {
            uri.append(ip).append(":27017,");
        }
        String finalUri = uri.toString().substring(0, uri.length() - 1);
        finalUri += ("/?readPreference=secondaryPreferred&w=majority&fsync=false&journal=true&connectTimeoutMS=10000&socketTimeoutMS=1000");

        return finalUri;
    }

    private static List<ObjectId> search(Map<String, Object> map, String documentName) {
        MongoCollection<Document> collection = getMongoDatabase().getCollection(documentName);
        List<ObjectId> idList = new ArrayList<>();

        BasicDBObject basicDBObject = new BasicDBObject();
        for (String key : map.keySet()) {
            List<String> valueList = new ArrayList<>();
            if (map.get(key).toString().contains(","))
                valueList = (List<String>) map.get(key);
            else
                valueList.add(map.get(key).toString());

            for (String value : valueList) {
                basicDBObject.put(key, value);
                basicDBObject.put("metadata.domain", Account.getAccountName());
                basicDBObject.put("metadata.user_id", Account.getAccountId());

                FindIterable<Document> dbCursor = collection.find(basicDBObject);
                MongoCursor<Document> dbCursorIterator = dbCursor.iterator();
                ObjectId resultId = null;
                while (dbCursorIterator.hasNext()) {
                    Document result = dbCursorIterator.next();
                    resultId = (ObjectId) result.get("_id");
                }
                idList.add(resultId);
            }
        }

        return idList;
    }

    public static void delete(String documentName, String deleteData) {
        MongoCollection<Document> collection = getMongoDatabase().getCollection(documentName);
        GridFS fs = null;
        if (documentName.contains(".files")) {
            fs = new GridFS(getMongoClient().getDB("spl"), documentName.split("\\.")[0]);
        }

        Map<String, Object> deleteMap = JsonStringPaser.json2Stirng(deleteData);
        if (deleteMap.containsKey("key")) {
            normalDelete(deleteMap, collection);
        } else {
            List<ObjectId> deleteIdList = search(deleteMap, documentName);
            for (ObjectId deleteId : deleteIdList) {
                if (deleteId != null) {
                    fs.remove(deleteId);
                }
            }
        }
    }

    private static void normalDelete(Map<String, Object> map, MongoCollection<Document> collection) {
        String accountName = Account.getAccountName();
        String accountId = Account.getAccountId();

        List<String> list = new ArrayList<>();
        if (map.get("key").toString().contains(","))
            list = (List) map.get("key");
        else
            list.add(map.get("key").toString());

        for (String value : list) {
            value = accountName + "/" + accountId + value;
            Document document = new Document();
            document.put("key", value);
            collection.deleteOne(document);
        }
    }
}
