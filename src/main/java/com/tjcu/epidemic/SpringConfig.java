package com.tjcu.epidemic;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.FilterType;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;

/**
 * spring框架的配置类
 */
@Configuration //表示当前类是配置类0
//让组件扫描器扫描注解是controller的类（让spring不要管理controller）
@ComponentScan(excludeFilters = @ComponentScan.Filter(type = FilterType.ANNOTATION,classes = Controller.class))
@EnableTransactionManagement //默认的事务管理器
public class SpringConfig {
    //PlatformTransactionManager aa=new DataSourceTransactionManager; //多态
    @Bean  //加在方法上，作用是将返回值纳入spring容器的管理
    public PlatformTransactionManager transactionManager(DataSource dataSource){
        DataSourceTransactionManager dstm=new DataSourceTransactionManager();
        dstm.setDataSource(dataSource);
        return dstm;
    }

    /*@Bean
    public DataSource dataSource(){
        DataSource dataSource=new BasicDataSource();
        return dataSource;
    }*/
}
