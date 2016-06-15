import com.fcs.wechat.common.*;

import java.io.IOException;

/**
 * Created by Lucare.Feng on 2016/6/14.
 */
public class AccessTokenApiTest {

    public static String AppID = "wx9803d1188fa5fbda";
    public static String AppSecret = "db859c968763c582794e7c3d003c3d87";

    public static void init(){
        ApiConfig ac = new ApiConfig();
        ac.setAppId(AppID);
        ac.setAppSecret(AppSecret);
        ApiConfigKit.setThreadLocalApiConfig(ac);
    }

    public static void main(String[] args) throws IOException {
        init();
//        useMap();
        test();
    }

    public static void useMap() {
        ApiConfigKit.setAccessTokenCache(new DefaultAccessTokenCache());
    }

    public static void test() {
        AccessToken at = WeChatBaseController.getAccessToken();
        if (at.isAvailable())
            System.out.println("access_token : " + at.getAccess_token());
        else
            System.out.println(at.getErrorCode() + " : " + at.getErrorMsg());

        at = WeChatBaseController.getAccessToken();
        if (at.isAvailable())
            System.out.println("access_token : " + at.getAccess_token());
        else
            System.out.println(at.getErrorCode() + " : " + at.getErrorMsg());

        at = WeChatBaseController.getAccessToken();
        if (at.isAvailable())
            System.out.println("access_token : " + at.getAccess_token());
        else
            System.out.println(at.getErrorCode() + " : " + at.getErrorMsg());
    }

}
