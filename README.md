CarSaleSystem
=======

A Struts2+spring3+hibernate3 project used Mysql.一个使用Mysql数据库的SSH项目。

#### Description 项目说明
A very simple SSH project,Using the MVC development pattern. This is a car sale system, just for practiced ~

简单的SSH项目，练习使用SSH技术。和之前的Java EE版本类似，只不过是换成SSH框架。

#### Runtime Environment 运行环境
JRE7+Mysql5+Tomcat7

#### Database Information 数据库信息 
Using the `carsell.sql` in the `database` directory,directly import into Mysql.

Username:admin,Password:admin

使用`database`目录下的`carsell.sql`直接导入Mysql即可，初始登录账户是admin,密码也是admin

#### Database Connection Pool Configurations 数据连接池配置
Using the `context.xml` in the `META-INF` directory.

使用`META-INF`录中的 `context.xml`配置