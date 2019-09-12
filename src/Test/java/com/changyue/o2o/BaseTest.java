package com.changyue.o2o;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @program: shopping
 * @description:
 * @author: ChangYue
 * @create: 2019-03-06 23:23
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml", "classpath:spring/spring-service.xml", "classpath:spring/spring-redis.xml"})
public class BaseTest {
}
