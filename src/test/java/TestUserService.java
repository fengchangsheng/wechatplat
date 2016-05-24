import com.alibaba.fastjson.JSON;
import com.fcs.admin.model.User;
import com.fcs.admin.service.UserService;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * Created by Lucare.Feng on 2016/1/24.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring.xml","classpath:spring-mybatis.xml" })
public class TestUserService {

    private static final Logger LOGGER = Logger.getLogger(TestUserService.class);

    @Autowired
    private UserService userService;

    @Test
    public void testQueryById1() {
        User user = userService.selectById("1");
        LOGGER.info(JSON.toJSON(user));
    }

    @Test
    public void testQueryAll() {
        List<User> users = userService.selectList();
        LOGGER.info(JSON.toJSON(users));
    }

    @Test
    public void testInsert() {
        User user = new User();
        user.setUsername("xiaoming");
//        userInfo.setUnumber(4);
        int result = userService.insert(user);
        System.out.println(result);
    }
}
