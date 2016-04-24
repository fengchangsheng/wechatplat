import com.fcs.admin.model.MenuTree;
import com.fcs.admin.service.PermissionService;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * Created by Lucare.Feng on 2016/4/23.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring.xml","classpath:spring-mybatis.xml" })
public class TestPermissionService {

    private static final Logger LOGGER = Logger.getLogger(TestPermissionService.class);

    @Autowired
    private PermissionService permissionService;

    @Test
    public void testSelectMenuTreeByUserId(){
        List<MenuTree> list =  permissionService.selectMenuTreeByUserId("1");
        System.out.println(list);
    }

    @Test
    public void testGetPermissionList(){
        List<MenuTree> list =  permissionService.getPermissionList();
        System.out.println(list);
    }
}
