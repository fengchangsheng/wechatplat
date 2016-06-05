package com.fcs.wechat.controller;

import com.fcs.common.util.SerializeXmlUtil;
import com.fcs.common.util.SignUtil;
import com.fcs.wechat.model.ImageMsg;
import com.fcs.wechat.model.InputMsg;
import com.fcs.wechat.enums.MsgType;
import com.fcs.wechat.model.OutputMsg;
import com.fcs.platform.controller.BaseController;
import com.thoughtworks.xstream.XStream;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by Lucare.Feng on 2016/6/2.
 */
@Controller
@RequestMapping("/wechat")
public class ChatController extends BaseController{

    @RequestMapping("index")
    public void index(HttpServletRequest request,HttpServletResponse response){
        System.out.println("**********进来了index************");
        boolean isGet = request.getMethod().toLowerCase().equals("get");
        try {
            if (isGet) {
                String signature = request.getParameter("signature");// 微信加密签名
                String timestamp = request.getParameter("timestamp");// 时间戳
                String nonce = request.getParameter("nonce");// 随机数
                String echostr = request.getParameter("echostr");// 随机字符串
                PrintWriter out = response.getWriter();
                // 通过检验signature对请求进行校验，若校验成功则原样返回echostr，表示接入成功，否则接入失败
                if (SignUtil.checkSignature(signature, timestamp, nonce)) {
                    out.print(echostr);
                }
                out.close();
            }else {
                chat(request, response);
            }
        } catch (Exception e) {
            logger.error(this.getClass().getName() + ":index()", e);
        }
    }

    private void chat(HttpServletRequest request, HttpServletResponse response){
        try {
            ServletInputStream in = request.getInputStream();
            XStream xs = SerializeXmlUtil.createXstream();
            xs.processAnnotations(InputMsg.class);
            xs.processAnnotations(OutputMsg.class);
            // 将流转换为字符串
            StringBuilder xmlMsg = new StringBuilder();
            byte[] b = new byte[4096];
            for (int n; (n = in.read(b)) != -1;) {
                xmlMsg.append(new String(b, 0, n, "UTF-8"));
            }
            // 将xml内容转换为InputMessage对象
            InputMsg inputMsg = (InputMsg) xs.fromXML(xmlMsg.toString());

            String servername = inputMsg.getToUserName();// 服务端
            String custermname = inputMsg.getFromUserName();// 客户端
            long createTime = inputMsg.getCreateTime();// 接收时间
            Long returnTime = Calendar.getInstance().getTimeInMillis() / 1000;// 返回时间

            // 取得消息类型
            String msgType = inputMsg.getMsgType();
            // 根据消息类型获取对应的消息内容
            if (msgType.equals(MsgType.TEXT.getName())) {
                // 文本消息
                System.out.println("开发者微信号：" + inputMsg.getToUserName());
                System.out.println("发送方帐号：" + inputMsg.getFromUserName());
                System.out.println("消息创建时间：" + inputMsg.getCreateTime() + new Date(createTime * 1000l));
                System.out.println("消息内容：" + inputMsg.getContent());
                System.out.println("消息Id：" + inputMsg.getMsgId());

                StringBuffer str = new StringBuffer();
                str.append("<xml>");
                str.append("<ToUserName><![CDATA[" + custermname + "]]></ToUserName>");
                str.append("<FromUserName><![CDATA[" + servername + "]]></FromUserName>");
                str.append("<CreateTime>" + returnTime + "</CreateTime>");
                str.append("<MsgType><![CDATA[" + msgType + "]]></MsgType>");
                str.append("<Content><![CDATA[你说的是：" + inputMsg.getContent() + "，吗？]]></Content>");
                str.append("</xml>");
                System.out.println(str.toString());
                response.getWriter().write(str.toString());
            }
            // 获取并返回多图片消息
            if (msgType.equals(MsgType.IMAGE.getName())) {
                System.out.println("获取多媒体信息");
                System.out.println("多媒体文件id：" + inputMsg.getMediaId());
                System.out.println("图片链接：" + inputMsg.getPicUrl());
                System.out.println("消息id，64位整型：" + inputMsg.getMsgId());

                OutputMsg outputMsg = new OutputMsg();
                outputMsg.setFromUserName(servername);
                outputMsg.setToUserName(custermname);
                outputMsg.setCreateTime(returnTime);
                outputMsg.setMsgType(msgType);
                ImageMsg images = new ImageMsg();
                images.setMediaId(inputMsg.getMediaId());
                outputMsg.setImage(images);
                System.out.println("xml转换：/n" + xs.toXML(outputMsg));
                response.getWriter().write(xs.toXML(outputMsg));
            }

            if (msgType.equals(MsgType.ENENT.getName())) {
                // 事件消息
                System.out.println("开发者微信号：" + inputMsg.getToUserName());
                System.out.println("发送方帐号：" + inputMsg.getFromUserName());
                System.out.println("消息创建时间：" + inputMsg.getCreateTime() + new Date(createTime * 1000l));
                String event = inputMsg.getEvent();
                System.out.println("事件：" + event);

                if("subscribe".equals(event)){//关注
                    StringBuffer str = new StringBuffer();
                    str.append("<xml>");
                    str.append("<ToUserName><![CDATA[" + custermname + "]]></ToUserName>");
                    str.append("<FromUserName><![CDATA[" + servername + "]]></FromUserName>");
                    str.append("<CreateTime>" + returnTime + "</CreateTime>");
                    str.append("<MsgType><![CDATA[text]]></MsgType>");
                    str.append("<Content><![CDATA[谢谢你关注此公众号！\r\n" +
                            "\n请按一下指引操作：" +
                            "\n回复1：免费获取公开课资料 " +
                            "\n回复2：进入报名页面 " +
                            "\n回复3：进入签到页面 " +
                            "\n回复4：获取开发者详细资料\r\n" +
                            "\n郑重声明：以上纯属虚构，用于开发者业余操练，为项目做准备！]]></Content>");
                    str.append("</xml>");
                    System.out.println(str.toString());
                    response.getWriter().write(str.toString());
                }else if("unsubscribe".equals(event)){//取消关注
                    System.out.println("取消了关注");

                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }




}
