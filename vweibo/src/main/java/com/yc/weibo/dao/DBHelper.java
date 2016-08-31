package com.yc.weibo.dao;

import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


/**
 * DBHelper
 * 
 * @author rdz
 */
@Component
public class DBHelper {
	@Autowired
	private DataSource dataSource;
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public Connection getConnection(){
		try {
//			DataSource dataSource=(DataSource)BasicDataSourceFactory.createDataSource(Env.getInstance());
			/*Context context=new InitialContext();
			DataSource dataSource=(DataSource)context.lookup("java:comp/env/jdbc/orcl");
			conn=dataSource.getConnection();*/
			conn = dataSource.getConnection();
		} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return conn;
	}
	/**
	 * 给占位符赋值
	 * 
	 * @param pstmt
	 *            要操作的sql语句
	 * @param params
	 *            要执行的sql语句中对应的占位符的值 为null则没有占位符
	 * @throws SQLException
	 */
	public void setValue(PreparedStatement pstmt, List<Object> params)
			throws SQLException {
		// 给占位符赋值
		if (params != null && params.size() > 0) {
			Object obj = null;
			String type = "";
			for (int i = 0; i < params.size(); i++) {
				obj = params.get(i);
				if (obj != null) {
					type = obj.getClass().getName();
					if ("[B".equals(type)) {
						pstmt.setBytes(i + 1, (byte[]) obj);
					} else {
						pstmt.setString(i + 1, String.valueOf(obj));
					}
				} else {
					pstmt.setString(i + 1, String.valueOf(obj));
				}
			}
		}
	}

	/**
	 * 更新操作
	 * 
	 * @param sql
	 *            要操作的sql语句
	 * @param params
	 *            要执行的sql语句中对应的占位符的值 为null则没有占位符
	 * @return
	 */
	public int update(String sql, List<Object> params) {
		int result = 0;

		try {
			conn = this.getConnection();
			pstmt = conn.prepareStatement(sql);

			this.setValue(pstmt, params);

			result = pstmt.executeUpdate(); // 执行语句
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 查询结果集
	 * 
	 * @param sql
	 *            要执行的sql语句
	 * @param params
	 *            要执行的sql语句中对应的占位符的值 为null则没有占位符
	 * @return
	 */
	public List<Map<String, Object>> select(String sql, List<Object> params) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> map = null; // 以列名为键，以对应的值为键

		try {
			conn = this.getConnection();
			pstmt = conn.prepareStatement(sql);

			this.setValue(pstmt, params);

			rs = pstmt.executeQuery();

			ResultSetMetaData rsmd = rs.getMetaData();// 获取元数据
			// 从元数据中获取列的信息

			String[] colNames = new String[rsmd.getColumnCount()];
			;
			for (int i = 0; i < colNames.length; i++) {
				colNames[i] = rsmd.getColumnName(i + 1);
			}

			while (rs.next()) {
				map = new HashMap<String, Object>();
				Object obj = null;
				String type;
				if (colNames != null && colNames.length > 0) {
					// 循环取出每一个值
					for (String s : colNames) {
						obj = rs.getObject(s);
						if (obj != null) {
							type = obj.getClass().getName();
							if ("oracle.sql.BLOB".equals(type)) {
								Blob blob = rs.getBlob(s);
								byte[] bt = null;
								InputStream is = blob.getBinaryStream();
								if (is != null) {
									bt = new byte[(int) blob.length()];
									try {
										is.read(bt);
									} catch (IOException e) {
										e.printStackTrace();
									} finally {
										if (is != null) {
											try {
												is.close();
											} catch (IOException e) {
												e.printStackTrace();
											}
										}
									}
									map.put(s, bt);
								} else {
									map.put(s, null);
								}
							} else {
								map.put(s, String.valueOf(obj));
							}
						} else {
							map.put(s, null);
						}
					}
				}
				list.add(map);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 聚合查询
	 * 
	 * @param sql
	 *            　要执行的sql语句
	 * @param params
	 *            　要执行的sql语句中对应的占位符的值 为null则没有占位符
	 * @return
	 */
	public double selectPloymer(String sql, List<Object> params) {
		double result = 0;

		conn = this.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			this.setValue(pstmt, params);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = rs.getDouble(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 聚合查询
	 * 
	 * @param sql
	 *            　要执行的sql语句
	 * @param params
	 *            　要执行的sql语句中对应的占位符的值 为null则没有占位符
	 * @return
	 */
	public List<Double> selectPloymers(String sql, List<Object> params) {
		List<Double> result = new ArrayList<Double>();
		;

		conn = this.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			this.setValue(pstmt, params);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				for (int i = 0; i < rs.getMetaData().getColumnCount(); i++) {
					result.add(rs.getDouble(i + 1));
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	/**
	 * DDL操作
	 * 
	 * @param sql
	 *            要执行的语句
	 * @return
	 */
	public boolean createOp(String sql) {
		boolean bl = false;

		try {
			conn = this.getConnection();
			pstmt = conn.prepareStatement(sql);
			bl = pstmt.execute();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bl;
	}

	// 查询结果 公共的方法，封装对象的查询方法  
	public <T> List<T> find(String sql, List<Object> params, Class c) {
		List<T> list = new ArrayList<T>();

		try {
			// 获取数据库连接对象
			conn = this.getConnection();
			pstmt = conn.prepareStatement(sql);// 获取预处理对象
			this.setValue(pstmt, params);
			rs = pstmt.executeQuery();
			// 获取返回结果集众所有列的列名
			ResultSetMetaData rsmd = rs.getMetaData();// 获取元数据，包含类的名称，类型等信息
			String columnNames[] = new String[rsmd.getColumnCount()];
			for (int i = 0; i < rsmd.getColumnCount(); i++) {// 循环获取列名存储到数组中
				columnNames[i] = rsmd.getColumnName(i + 1);
			}
			// 获取当前给定类中所有公有的方法
			Method[] methods = c.getMethods();
			// set列名与给定的类中的方法忽略大小写循环比较，如果能够匹配上，则激活该方法将当前列的注入到对象对应的属性中

			T t;// 实例化对象
			String methodName = null;// 方法名
			String colName = null;// 列名
			String typeName = null;// 参数类型名
			Object val = null; // 当前循环列的值

			while (rs.next()) {
				t = (T) c.newInstance();// 实例化一个类的对象    (相当于UserinfoBean user=new UserinfoBean())
				for (int i = 0; i < columnNames.length; i++) {
					// 获取当前循环的列名
					colName = columnNames[i];
					// 根据列名获取当前列的值
					val = rs.getObject(colName);
					for (Method m : methods) {// 循环方法与方法名进行比较
						methodName = m.getName();  //setUserid   setuserid
						if (("set" + colName).equalsIgnoreCase(methodName)
								&& null != val) {
							// 获取返回值的类型
							typeName = val.getClass().getName();
							if ("java.math.BigDecimal".equals(typeName)) {
								m.invoke(t, rs.getInt(colName)); // 激活方法并设置
							} else if ("java.lang.String".equals(typeName)) {
								m.invoke(t, rs.getString(colName)); // 激活方法并设置
							} else {
								// 后续自己完成
								m.invoke(t, rs.getString(colName));
							}
						}
					}
				}
				list.add(t);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;

	}
	
}
