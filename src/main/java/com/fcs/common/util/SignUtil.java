package com.fcs.common.util;

import com.fcs.common.GlobalStatic;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;

/**
 *@ClassName: SignUtil
 *@Description: 微信验证签名地址有效性
 */
public class SignUtil {
	/**
	 * 
	 *@Title: checkSignature
	 *@Description: 验证签名
	 *@param signature: 微信加密签名
	 *@param timestamp: 时间戳
	 *@param nonce: 随机数
	 *@return: boolean
	 *@author Teli.Cao
	 *@date 2016年1月8日 上午11:34:08
	 */
	public static boolean checkSignature(String signature, String timestamp, String nonce){
		String token = GlobalStatic.TECENT_TOKEN; //接口配置token
		String[] arr = new String[]{token, timestamp, nonce};
		//将token, timestamp, nonce 三个参数进行字典排序
		Arrays.sort(arr);
		StringBuilder content = new StringBuilder();
		for(int i = 0; i < arr.length; i++){
			content.append(arr[i]);//拼成一个字符串
		}
		MessageDigest md = null;
		String tmpStr = null;
		try {
			//拼接后的字符串进行shal加密
			md = MessageDigest.getInstance("SHA-1");
			byte[] digest = md.digest(content.toString().getBytes());
			tmpStr = byteToStr(digest);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		//将加密后的字符串可与signature对比, 标识该请求来源与微信
		return tmpStr != null ? tmpStr.equalsIgnoreCase(signature) : false;
	}
	/**
	 * 
	 *@Title: byteToStr
	 *@Description: 字节数组转换成字符串
	 *@return: String
	 *@author Teli.Cao
	 *@date 2016年1月8日 上午11:55:10
	 */
	private static String byteToStr(byte[] digest){
		StringBuilder strDigest = new StringBuilder();
		for(int i = 0; i < digest.length; i++){
			strDigest.append(byteToHexStr(digest[i]));
		}
		return strDigest.toString();
	}
	/**
	 * 将字节转换为十六进制字符串
	 */
	private static String byteToHexStr(byte b){
		char[] Digit = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};
        char[] tempArr = new char[2];
        tempArr[0] = Digit[(b >>> 4) & 0X0F];
        tempArr[1] = Digit[b & 0X0F];
         
        String s = new String(tempArr);
        return s;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
