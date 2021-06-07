package com.javasm.util;


import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.DruidDataSourceFactory;
import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

/**
 * @Author：chy
 * @Version：1.0
 * @Date：2021/4/21-17:02
 * @Since:jdk1.8
 * @Description: 数据库工具类  JdbcUtil
 */

public class JdbcUtil {


    private static DruidDataSource dataSource;

    static {
        InputStream inputStream = JdbcUtil.class.getClassLoader().getResourceAsStream("com/javasm/util/druid.properties");
        Properties properties = new Properties();
        try {
            properties.load(inputStream);
            dataSource = (DruidDataSource) DruidDataSourceFactory.createDataSource(properties);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    /**
     * 获取连接
     *
     * @return
     */
    public static Connection getCon() {
        Connection connection = null;
        try {
            //Class.forName(DBConstants.DRIVER);
            //connection = DriverManager.getConnection(DBConstants.URL, DBConstants.USER, DBConstants.PWD);
            connection = dataSource.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    /**
     * 增 删 改
     *
     * @param sql
     * @param params
     * @return
     */
    public static int executeUpdate(String sql, Object... params) {
        Connection con = getCon();
        int update = 0;
        QueryRunner queryRunner = new QueryRunner();
        try {
            update = queryRunner.update(con, sql, params);
        } catch (SQLException e) {
                e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(con);
        }
        return update;
    }

    /**
     * 单个插入返回插入的id
     *
     * @param sql
     * @param params
     * @return
     */
    public static int executeInsetId(String sql, Object... params) {
        Connection con = getCon();
        int update = 0;
        QueryRunner queryRunner = new QueryRunner();
        try {
            update = queryRunner.insert(con, sql, new ScalarHandler<Long>(), params).intValue();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(con);
        }
        return update;
    }

    /**
     * 重载  单个插入返回插入的id 带有con
     *
     * @param con
     * @param sql
     * @param params
     * @return
     */
    public static int executeInsetId(Connection con, String sql, Object... params) {
        int update = 0;
        QueryRunner queryRunner = new QueryRunner();
        try {
            update = queryRunner.insert(con, sql, new ScalarHandler<Long>(), params).intValue();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return update;
    }

    /**
     * 重载  单个插入返回插入的id   增 删 改
     *
     * @param sql
     * @param params
     * @return
     */
    public static int executeUpdate(Connection con, String sql, Object... params) {
        int update = 0;
        QueryRunner queryRunner = new QueryRunner();
        try {
            update = queryRunner.update(con, sql, params);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return update;
    }

    /**
     * 根据id查一个单个
     *
     * @param id
     */
    public static <T> T getById(String sql, Class clazz, Object id) {
        Connection con = getCon();
        T query = null;
        QueryRunner queryRunner = new QueryRunner();
        try {
            query = queryRunner.query(con, sql, new BeanHandler<T>(clazz), id);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(con);
        }
        return query;
    }

    /**
     * 查一个单个
     *
     * @param params
     */
    public static <T> T getByParam(String sql, Class clazz, Object... params) {
        Connection con = getCon();
        T query = null;
        QueryRunner queryRunner = new QueryRunner();
        try {
            query = queryRunner.query(con, sql, new BeanHandler<T>(clazz), params);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(con);
        }
        return query;
    }

    /**
     * 返回所有的list
     *
     * @param sql
     * @param clazz
     * @param params
     * @param <T>
     * @return
     */
    public static <T> List<T> getAll(String sql, Class clazz, Object... params) {
        Connection con = getCon();
        List<T> query = new ArrayList<>();
        QueryRunner queryRunner = new QueryRunner();
        try {
            query = queryRunner.query(con, sql, new BeanListHandler<T>(clazz), params);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(con);
        }
        return query;
    }

    /**
     * 获取条数
     *
     * @param sql
     * @param params
     * @return
     */
    public static Integer getCount(String sql, Object... params) {
        Connection con = getCon();
        QueryRunner queryRunner = new QueryRunner();
        int query = 0;
        try {
            query = queryRunner.query(con, sql, new ScalarHandler<Long>(), params).intValue();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(con);
        }
        return query;
    }

}