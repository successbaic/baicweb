package com.macrosoft.icms.gsdbc;

import java.io.*;
import java.sql.*;
import java.util.*;
import java.text.SimpleDateFormat;
import java.util.Date;
//import com.macrosoft.icms.ICMSException;

/**
* 管理类DBConnectionManager支持对一个或多个由属性文件定义的数据库连接
* 池的访问.客户程序可以调用getInstance()方法访问本类的唯一实例.
*/
public class LsDBConnectionManager 
{
	static private LsDBConnectionManager instance; // 唯一实例
	static private int clients;
	SimpleDateFormat formatter=new SimpleDateFormat ("yyyy.MM.dd hh:mm:ss");

	private Vector drivers = new Vector();
	private PrintWriter log;
	private Hashtable pools = new Hashtable();

	public String getPoolsInformation()
	{
		String retStr="<table border=1 cellpadding=0 cellspacing=0 style=border-collapse: collapse bordercolor=#111111 width=100%><TR><TD>PoolName</TD><TD>FreeConnections</TD><TD>UsedConnections</TD><TD>checkOut</TD></TR>";
		Enumeration allPools = pools.elements();
		while (allPools.hasMoreElements()) 
		{
			DBConnectionPool pool = (DBConnectionPool) allPools.nextElement();
			retStr+=pool.getPoolInformation();
		}
		return retStr+"</table>";
	}
	//******************************
	//add by djy 2009-1-5
	//******************************
	public int getUsedConnections()
	{
		int retStr = 100;
		Enumeration allPools = pools.elements();
		while (allPools.hasMoreElements()) 
		{
			DBConnectionPool pool = (DBConnectionPool) allPools.nextElement();
			retStr = pool.getUsedConnections();
		}
		return retStr;
	}

	/**
	* 返回唯一实例.如果是第一次调用此方法,则创建实例
	*
	* @return DBConnectionManager 唯一实例
	*/
	static synchronized public LsDBConnectionManager getInstance() 
	{
		if (instance == null) 
		{
			instance = new LsDBConnectionManager();
		}
		clients++;
		return instance;
	}

	/**
	* 建构函数私有以防止其它对象创建本类实例
	*/
	private LsDBConnectionManager() 
	{
		init();
	}

	/**
	* 将连接对象从由名字指定的连接池中删除
	*
	* @param name 在属性文件中定义的连接池名字
	* @param con 连接对象
	*/
	public void releaseConnection(String name, Connection con) 
	{
		DBConnectionPool pool = (DBConnectionPool) pools.get(name);
		if (pool != null) 
		{
			pool.releaseConnection(con);
		}
	}


	/**
	* 将连接对象返回给由名字指定的连接池
	*
	* @param name 在属性文件中定义的连接池名字
	* @param con 连接对象
	* @param delay 连接可用之前的延迟时间
	*/
	public void freeConnection(String name, Connection con, long delay) 
	{
		DBConnectionPool pool = (DBConnectionPool) pools.get(name);
		if (pool != null) 
		{
			pool.freeConnection(con, delay);
		}
	}

	public void freeConnection(String name, Connection con ) 
	{
		freeConnection( name, con, 0 );
	}

	/**
	* 获得一个可用的(空闲的)连接.如果没有可用连接,且已有连接数小于最大连接数
	* 限制,则创建并返回新连接
	*
	* @param name 在属性文件中定义的连接池名字
	* @return Connection 可用连接或null
	*/
	public Connection getConnection(String name) // throws ICMSException
	{
		DBConnectionPool pool = (DBConnectionPool) pools.get(name);
		if (pool != null) 
		{
			return pool.getConnection();
		}
		//throw new ICMSException("无法创建指定的连接池！","连接池"+name+"无法创建，请检查数据库连接设置！","DbConnectionManager.java","/jjhk/login.jsp");
		return null;
	}

	/**
	* 获得一个可用连接.若没有可用连接,且已有连接数小于最大连接数限制,
	* 则创建并返回新连接.否则,在指定的时间内等待其它线程释放连接.
	*
	* @param name 连接池名字
	* @param time 以毫秒计的等待时间
	* @return Connection 可用连接或null
	*/
	public Connection getConnection(String name, long time) //throws ICMSException
	{
		DBConnectionPool pool = (DBConnectionPool) pools.get(name);
		if (pool != null) 
		{
			return pool.getConnection(time);
		}
		return null;
	}

	/**
	* 关闭所有连接,撤销驱动程序的注册
	*/
	public synchronized void release() 
	{
		// 等待直到最后一个客户程序调用
		if (--clients != -1)		
		{
			return;
		}
		
		Enumeration allPools = pools.elements();
		while (allPools.hasMoreElements()) 
		{
			DBConnectionPool pool = (DBConnectionPool) allPools.nextElement();
			pool.release();
		}
		Enumeration allDrivers = drivers.elements();
		while (allDrivers.hasMoreElements()) 
		{
			Driver driver = (Driver) allDrivers.nextElement();
			try 
			{
				DriverManager.deregisterDriver(driver);
				log("撤销JDBC驱动程序 " + driver.getClass().getName()+"的注册");
			}
			catch (SQLException e) 
			{
				log(e, "无法撤销下列JDBC驱动程序的注册: " + driver.getClass().getName());
			}
		}
	}

	public void destroy()
	{
		log( "clear mem..." );
		release();
	}

	public void finalize()
	{
		System.out.println( formatter.format(new java.util.Date()) + "clear mem ..." );
		release();
	}

	/**
	* 根据指定属性创建连接池实例.
	*
	* @param props 连接池属性
	*/
	private void createPools(Properties props) 
	{
		Enumeration propNames = props.propertyNames();
		while (propNames.hasMoreElements()) 
		{
			String name = (String) propNames.nextElement();
			if (name.endsWith(".url")) 
			{
				String poolName = name.substring(0, name.lastIndexOf("."));
				String url = props.getProperty(poolName + ".url");
				if (url == null) 
				{
					log("没有为连接池" + poolName + "指定URL");
					continue;
				}
				String user = props.getProperty(poolName + ".user");
				String password = props.getProperty(poolName + ".password");				
				String maxconn = props.getProperty(poolName + ".maxconn", "0");
				int max;
				try 
				{
					max = Integer.valueOf(maxconn).intValue();
				}
				catch (NumberFormatException e) 
				{
					log("错误的最大连接数限制: " + maxconn + " .连接池: " + poolName);
					max = 0;
				}
				DBConnectionPool pool =	new DBConnectionPool(poolName, url, user, password, max);
				pools.put(poolName, pool);
				log("成功创建连接池" + poolName);
			}
		}
	}

	/**
	* 读取属性完成初始化
	*/
	private void init() 
	{
		InputStream is = getClass().getResourceAsStream("/lsdb.cfg");
		Properties dbProps = new Properties();
		try 
		{
			dbProps.load(is);
		}
		catch (Exception e) 
		{
			System.err.println( "不能读取属性文件. " + "请确保lsdb.cfg在CLASSPATH指定的路径中");
			return;
		}
		String logFile = dbProps.getProperty("logfile", "lsdb.log");
		try 
		{
			log = new PrintWriter(new FileWriter(logFile, true), true);
		}
		catch (IOException e) 
		{
			System.err.println("无法打开日志文件: " + logFile);
			log = new PrintWriter(System.err);
		}
		loadDrivers(dbProps);
		createPools(dbProps);
	}

	/**
	* 装载和注册所有JDBC驱动程序
	*
	* @param props 属性
	*/
	private void loadDrivers(Properties props) 
	{
		String driverClasses = props.getProperty("drivers");
		StringTokenizer st = new StringTokenizer(driverClasses);
		while (st.hasMoreElements()) 
		{
			String driverClassName = st.nextToken().trim();
			try 
			{
				Driver driver = (Driver)
				Class.forName(driverClassName).newInstance();
				DriverManager.registerDriver(driver);
				drivers.addElement(driver);
				log("成功注册JDBC驱动程序" + driverClassName);
			}
			catch (Exception e) 
			{
				log("无法注册JDBC驱动程序: " + driverClassName + ", 错误: " + e);
			}
		}
	}

	/**
	* 将文本信息写入日志文件
	*/
	public void log(String msg) 
	{
		log.println(new Date() + ": " + msg);
	}

	/**
	* 将文本信息与异常写入日志文件
	*/
	public void log(Throwable e, String msg) 
	{
		log.println(new Date() + ": " + msg);
		e.printStackTrace(log);
	}


	
	
	/**
	* 此内部类定义了一个连接池.它能够根据要求创建新连接,直到预定的最
	* 大连接数为止.在返回连接给客户程序之前,它能够验证连接的有效性.
	*/
	class DBConnectionPool 
	{
		private int checkedOut;
		private Vector freeConnections = new Vector();
		private int maxConn;
		private String name;
		private String password;
		private String URL;
		private String user;
		//Modify At 2002-6-21
		//被使用连接的连接池
		private Vector usedConnections = new Vector();
		private int refreshTime=120000000;	//1200seconds

		SimpleDateFormat formatter=new SimpleDateFormat ("yyyy.MM.dd hh:mm:ss"); 

		public String getPoolInformation()
		{
			return "<TR><TD>"+name 
				+"</TD><TD>" + freeConnections.size() 
				+"</TD><TD>"+usedConnections.size()
				+"</TD><TD>"+checkedOut+"</TD></TR>";
		}
		//******************************
		//add by djy 2009-1-5
		//******************************
		public int getUsedConnections()
		{
			return usedConnections.size();
		}


		/**
		* 创建新的连接池
		*
		* @param name 连接池名字
		* @param URL 数据库的JDBC URL
		* @param user 数据库帐号,或 null
		* @param password 密码,或 null
		* @param maxConn 此连接池允许建立的最大连接数
		*/
		public DBConnectionPool(String name, String URL, String user, String password, int maxConn) 
		{
			this.name = name;
			this.URL = URL;
			this.user = user;
			this.password = password;
			this.maxConn = maxConn;
		}

		/**
		* 释放连接
		* 
		* @param con 连接对象
		*/
		public synchronized void releaseConnection(Connection con) 
		{
			// 将指定连接加入到向量末尾

			int nUsedCount=usedConnections.size();
			for( int i=nUsedCount-1; i>=0; i-- )
			{
				DBConnection dbctemp=(DBConnection)usedConnections.elementAt(i);
				if (dbctemp.getConnection()==con)
				{
					System.out.println( formatter.format(new java.util.Date()) + "取消连接中……" );
					checkedOut--;
					notifyAll();
					usedConnections.removeElementAt(i);
				}
			}
			System.out.println( formatter.format(new java.util.Date()) + "After closed conn["+name+"]：In pool conn：" + freeConnections.size() + "  Used conn：" + checkedOut );
///			System.out.println( formatter.format(new java.util.Date()) + "After closed conn["+name+"]：Used conn：" + usedConnections.size() );
		}

		/**
		* 将不再使用的连接返回给连接池
		*
		* @param con 客户程序释放的连接
		*/
		public synchronized void freeConnection(Connection con, long delay) 
		{
			// 将指定连接加入到向量末尾

			int nUsedCount=usedConnections.size();
			for( int i=nUsedCount-1; i>=0; i-- )
			{
				DBConnection dbctemp=(DBConnection)usedConnections.elementAt(i);
				if (dbctemp.getConnection()==con)
				{
					System.out.println( formatter.format(new java.util.Date()) + "Release conn……" );
					DBConnection dbc=new DBConnection();
					dbc.setConnection( con, delay );
					freeConnections.addElement(dbc);
					checkedOut--;
					notifyAll();
					usedConnections.removeElementAt(i);
				}
			}
			System.out.println( formatter.format(new java.util.Date()) + "After closed conn["+name+"]：In pool conn：" + freeConnections.size() + "  Used conn：" + checkedOut );
	///		System.out.println( formatter.format(new java.util.Date()) + "After closed conn["+name+"]：Used conn：" + usedConnections.size() );
		}

		public synchronized void freeConnection(Connection con) 
		{
			// 将指定连接加入到向量末尾
			int nUsedCount=usedConnections.size();
			for( int i=nUsedCount-1; i>=0; i-- )
			{
				DBConnection dbctemp=(DBConnection)usedConnections.elementAt(i);
				if (dbctemp.getConnection()==con)
				{
					System.out.println( formatter.format(new java.util.Date()) + "Release conn……" );
					DBConnection dbc=new DBConnection();
					dbc.setConnection( con, 0 );
					freeConnections.addElement(dbc);
					checkedOut--;
					notifyAll();
					usedConnections.removeElementAt(i);
				}
			}
			System.out.println( formatter.format(new java.util.Date()) + "After closed conn["+name+"]：In pool conn：" + freeConnections.size() + "  Used conn：" + checkedOut );
	///		System.out.println( formatter.format(new java.util.Date()) + "After closed conn["+name+"]：Used conn：" + usedConnections.size() );
		}

		public synchronized int canUseCount() 
		{
			int size=freeConnections.size();
			int count=0;

			for( int i=0; i<size; i++ )
			{
				DBConnection dbc=(DBConnection)freeConnections.elementAt(i);
				if (dbc.canUse())
				{
					count++;
				}
			}
			return count;
		}
		/**
		* 从连接池获得一个可用连接.如没有空闲的连接且当前连接数小于最大连接
		* 数限制,则创建新连接.如原来登记为可用的连接不再有效,则从向量删除之,
		* 然后递归调用自己以尝试新的可用连接.
		*/
		public synchronized Connection getConnection() // throws ICMSException
		{
			Connection con = null;
			DBConnection dbc=null;
			
			refreshConnection();
			if ( canUseCount() > 0) 
			{
				// 获取向量中第一个可用连接
				dbc=(DBConnection)freeConnections.firstElement();
				con = dbc.conn;
				freeConnections.removeElementAt(0);
				if (dbc.canUse()==false)
				{
					freeConnections.addElement(dbc);
					con=getConnection();
				}
				try 
				{
					if (con.isClosed()) 
					{
						log("从连接池" + name+"删除一个无效连接");
						// 递归调用自己,尝试再次获取可用连接
						con = getConnection();
					}
				}
				catch (SQLException e) 
				{
					log("从连接池" + name+"删除一个无效连接");
					// 递归调用自己,尝试再次获取可用连接
					con = getConnection();
				}
			}
			else if (maxConn == 0 || (freeConnections.size()+checkedOut) < maxConn) 
			{
				con = newConnection();
			}
			if (con != null) 
			{
				checkedOut++;
				//返回连接前，将使用的连接加入被使用连接池
				DBConnection dbctemp=new DBConnection();
				dbctemp.setConnection( con, 0);
				usedConnections.addElement(dbctemp);
			}
			return con;
		}

		/**
		* 从连接池获取可用连接.可以指定客户程序能够等待的最长时间
		* 参见前一个getConnection()方法.
		*
		* @param timeout 以毫秒计的等待时间限制
		*/
		public synchronized Connection getConnection(long timeout)// throws ICMSException
		{
			System.out.println( formatter.format(new java.util.Date()) + "Pool conn["+name+"]：In pool conn：" + freeConnections.size() + "  Used conn：" + checkedOut );
	///		System.out.println( formatter.format(new java.util.Date()) + "Pool conn["+name+"]：Used conn：" + usedConnections.size() );
			long startTime = new Date().getTime();
			Connection con;
			while ((con = getConnection()) == null) 
			{
				try 
				{
					wait(timeout/10);
				}
				catch (InterruptedException e) {}
				if ((new Date().getTime() - startTime) >= timeout) 
				{
					return null;
				}
			}
			return con;
		}

		/**
		* 关闭所有连接
		*/
		public synchronized void release() 
		{
			Enumeration allConnections = freeConnections.elements();
			while (allConnections.hasMoreElements()) 
			{
				DBConnection dbc=(DBConnection)allConnections.nextElement();
				Connection con=dbc.getConnection();
				try 
				{
					con.close();
					log("关闭连接池" + name+"中的一个连接");
				}
				catch (SQLException e) 
				{
					log(e, "无法关闭连接池" + name+"中的连接");
				}
			}
			freeConnections.removeAllElements();
		}

		/**
		*	刷新连接池中被使用的连接
		*/
		private synchronized void refreshConnection()
		{
			int nUsedCount=usedConnections.size();
			long curTime;	//当前时间

			curTime=new java.util.Date().getTime();
			for ( int i=nUsedCount-1; i>=0 ; i-- )
			{
				DBConnection dbctemp=(DBConnection)usedConnections.elementAt(i);
				if ((curTime - dbctemp.getLastAccess())>refreshTime)	//超过规定时间
				{
					//释放该连接，并重新创建，放到freeConections
					System.out.println( formatter.format(new java.util.Date()) + "Release Conn……" );
					usedConnections.removeElementAt(i);
					Connection conntemp=dbctemp.getConnection();
					try
					{
						conntemp.close();					
					}
					catch (SQLException e)
					{
						System.out.println( formatter.format(new java.util.Date()) + "closing conn with error：" + e.getMessage() );
					}
					conntemp=null;
					dbctemp=null;
					checkedOut--;
					Connection conn0=newConnection();
					if (conn0!=null)
					{
						dbctemp=new DBConnection();
						dbctemp.setConnection( conn0, 0 );
						freeConnections.addElement( dbctemp );
					}
				}
			}
			System.out.println( formatter.format(new java.util.Date()) + "Refresh Pool["+name+"]：In pool conn：" + freeConnections.size() + "  Used conn：" + checkedOut );
	///		System.out.println( formatter.format(new java.util.Date()) + "Refresh Pool["+name+"]：Used conn：" + usedConnections.size() );
		}

		/**
		* 创建新的连接
		*/
		private Connection newConnection() //throws ICMSException
		{
			Connection con = null;
			try 
			{
				if (user == null) 
				{
					con = DriverManager.getConnection(URL);
				}
				else 
				{
					con = DriverManager.getConnection(URL, user, password);
				}
				log("连接池" + name+"创建一个新的连接");
			}
			catch (SQLException e) 
			{
				log(e, "无法创建下列URL的连接: " + URL);
				//throw new ICMSException("无法创建指定的连接！","连接池"+name+"无法创建新的连接（连接数目不够或者已经用光），请检查数据库连接设置！","DbConnectionManager.java","/jjhk/login.jsp");
				return null;
			}
			return con;
		}
	}	//end DbConnectionPool


	class DBConnection
	{
		private java.sql.Connection conn;	//连接
		private boolean inUse;				//是否被使用标志 
		private long lastAccess;			//最近一次开始使用时间 
		private int useCount;				//被使用次数
		private long delay;					//需要延迟的使用时间

		public DBConnection()
		{
			conn=null;
			inUse=false;
			lastAccess=0;
			useCount=0;
			delay=0;
		}

		public long getLastAccess()
		{
			return lastAccess;
		}

		public Connection getConnection()
		{
			return this.conn;
		}

		public void setConnection(Connection con, long delay)
		{
			this.conn=con;
			this.inUse=false;
			this.lastAccess=new Date().getTime();
			this.useCount++;
			this.delay=delay;
		}

		public boolean isInUse()
		{
			return this.inUse;
		}

		public boolean canUse()
		{
			return (new Date().getTime()-lastAccess)>=delay;
		}

	};	//end DBConneciton

}	//end DbConnectionManager
