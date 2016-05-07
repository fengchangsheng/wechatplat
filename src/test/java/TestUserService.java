import com.alibaba.fastjson.JSON;
import com.fcs.admin.model.UserInfo;
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
        UserInfo userInfo = userService.getUserById("1");
        LOGGER.info(JSON.toJSON(userInfo));
    }

    @Test
    public void testQueryAll() {
        List<UserInfo> userInfos = userService.getUsers();
        LOGGER.info(JSON.toJSON(userInfos));
    }

    @Test
    public void testInsert() {
        UserInfo userInfo = new UserInfo();
        userInfo.setUsername("xiaoming");
//        userInfo.setUnumber(4);
        int result = userService.insert(userInfo);
        System.out.println(result);
    }
}
