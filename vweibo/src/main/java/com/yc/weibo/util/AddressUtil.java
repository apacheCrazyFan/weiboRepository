package com.yc.weibo.util;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.URL;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import com.yc.weibo.DataDic.DataDic;

public class AddressUtil {
	 /** 
     *  
     * @param content 
     *            请求的参数 格式为：name=xxx&pwd=xxx 
     * @param encoding 
     *            服务器端请求编码。如GBK,UTF-8等 
     * @return 
     * @throws UnsupportedEncodingException 
     */  
    public static String getAddresses(String content, String encodingString)  
            throws UnsupportedEncodingException {  
        // 这里调用淘宝API  
        String urlStr = "http://ip.taobao.com/service/getIpInfo.php";  
        // 从http://whois.pconline.com.cn取得IP所在的省市区信息  
        String returnStr = getResult(urlStr, content, encodingString);  
        if (returnStr != null) {  
            // 处理返回的省市区信息  
            System.out.println("(1) unicode转换成中文前的returnStr : " + returnStr);  
            returnStr = decodeUnicode(returnStr);  
            System.out.println("(2) unicode转换成中文后的returnStr : " + returnStr);  
            
            String[] temp = returnStr.split(",");  
            if(temp.length<3){  
                return "0";//无效IP，局域网测试  
            }  
            String userLocation = "";
            userLocation += returnStr.substring(returnStr.indexOf("\"country\":\"")+11,returnStr.indexOf("\",\"country_id\":\""))+",";
            userLocation += returnStr.substring(returnStr.indexOf("\"area\":\"")+8,returnStr.indexOf("\",\"area_id\":\""))+",";
            userLocation += returnStr.substring(returnStr.indexOf("\"region\":\"")+10,returnStr.indexOf("\",\"region_id\":\""))+",";
            userLocation += returnStr.substring(returnStr.indexOf("\"city\":\"")+8,returnStr.indexOf("\",\"city_id\":\""));
            return userLocation;  
        }  
        return null;  
    }  
    /** 
     * @param urlStr 
     *            请求的地址 
     * @param content 
     *            请求的参数 格式为：name=xxx&pwd=xxx 
     * @param encoding 
     *            服务器端请求编码。如GBK,UTF-8等 
     * @return 
     */  
    private static String getResult(String urlStr, String content, String encoding) {  
        URL url = null;  
        HttpURLConnection connection = null;  
        try {  
            url = new URL(urlStr);  
            connection = (HttpURLConnection) url.openConnection();// 新建连接实例  
            connection.setConnectTimeout(2000);// 设置连接超时时间，单位毫秒  
            connection.setReadTimeout(2000);// 设置读取数据超时时间，单位毫秒  
            connection.setDoOutput(true);// 是否打开输出流 true|false  
            connection.setDoInput(true);// 是否打开输入流true|false  
            connection.setRequestMethod("POST");// 提交方法POST|GET  
            connection.setUseCaches(false);// 是否缓存true|false  
            connection.connect();// 打开连接端口  
            DataOutputStream out = new DataOutputStream(connection  
                    .getOutputStream());// 打开输出流往对端服务器写数据  
            out.writeBytes(content);// 写数据,也就是提交你的表单 name=xxx&pwd=xxx  
            out.flush();// 刷新  
            out.close();// 关闭输出流  
            BufferedReader reader = new BufferedReader(new InputStreamReader(  
                    connection.getInputStream(), encoding));// 往对端写完数据对端服务器返回数据  
            // ,以BufferedReader流来读取  
            StringBuffer buffer = new StringBuffer();  
            String line = "";  
            while ((line = reader.readLine()) != null) {  
                buffer.append(line);  
            }  
            reader.close();  
            return buffer.toString();  
        } catch (IOException e) {  
            e.printStackTrace();  
        } finally {  
            if (connection != null) {  
                connection.disconnect();// 关闭连接  
            }  
        }  
        return null;  
    }  
    /** 
     * unicode 转换成 中文 
     *  
     * @author fanhui 2007-3-15 
     * @param theString 
     * @return 
     */  
    public static String decodeUnicode(String theString) {  
        char aChar;  
        int len = theString.length();  
        StringBuffer outBuffer = new StringBuffer(len);  
        for (int x = 0; x < len;) {  
            aChar = theString.charAt(x++);  
            if (aChar == '\\') {  
                aChar = theString.charAt(x++);  
                if (aChar == 'u') {  
                    int value = 0;  
                    for (int i = 0; i < 4; i++) {  
                        aChar = theString.charAt(x++);  
                        switch (aChar) {  
                        case '0':  
                        case '1':  
                        case '2':  
                        case '3':  
                        case '4':  
                        case '5':  
                        case '6':  
                        case '7':  
                        case '8':  
                        case '9':  
                            value = (value << 4) + aChar - '0';  
                            break;  
                        case 'a':  
                        case 'b':  
                        case 'c':  
                        case 'd':  
                        case 'e':  
                        case 'f':  
                            value = (value << 4) + 10 + aChar - 'a';  
                            break;  
                        case 'A':  
                        case 'B':  
                        case 'C':  
                        case 'D':  
                        case 'E':  
                        case 'F':  
                            value = (value << 4) + 10 + aChar - 'A';  
                            break;  
                        default:  
                            throw new IllegalArgumentException(  
                                    "Malformed      encoding.");  
                        }  
                    }  
                    outBuffer.append((char) value);  
                } else {  
                    if (aChar == 't') {  
                        aChar = '\t';  
                    } else if (aChar == 'r') {  
                        aChar = '\r';  
                    } else if (aChar == 'n') {  
                        aChar = '\n';  
                    } else if (aChar == 'f') {  
                        aChar = '\f';  
                    }  
                    outBuffer.append(aChar);  
                }  
            } else {  
                outBuffer.append(aChar);  
            }  
        }  
        return outBuffer.toString();  
    }  
    /**
     * 获取系统属性的方法
     * @return
     */
    private static Map<String,String> getSystemProperties(){
    	Map<String,String> systemPropertiesMap = new HashMap<String,String>(); 
    	String[] prosArr = DataDic.PROPERTIES.split(",");
    	
    	for(String pros : prosArr){
    		systemPropertiesMap.put(pros.replace(".", ""), System.getProperty(pros));
    	}
    	
    	return systemPropertiesMap;
    	
    }
    
    public static String getRealIp() throws SocketException {
        String localip = null;// 本地IP，如果没有配置外网IP则返回它
        String netip = null;// 外网IP
 
        Enumeration<NetworkInterface> netInterfaces =
            NetworkInterface.getNetworkInterfaces();
        InetAddress ip = null;
        boolean finded = false;// 是否找到外网IP
        while (netInterfaces.hasMoreElements() && !finded) {
            NetworkInterface ni = netInterfaces.nextElement();
            Enumeration<InetAddress> address = ni.getInetAddresses();
            while (address.hasMoreElements()) {
                ip = address.nextElement();
                if (!ip.isSiteLocalAddress()
                        && !ip.isLoopbackAddress()
                        && ip.getHostAddress().indexOf(":") == -1) {// 外网IP
                    netip = ip.getHostAddress();
                    finded = true;
                    break;
                } else if (ip.isSiteLocalAddress()
                        && !ip.isLoopbackAddress()
                        && ip.getHostAddress().indexOf(":") == -1) {// 内网IP
                    localip = ip.getHostAddress();
                }
            }
        }
     
        if (netip != null && !"".equals(netip)) {
            return netip;
        } else {
            return localip;
        }
    }
    // 
    public static String getLocation() {  
    	String address = "";  
    	try {
			String ipaddress = getRealIp();

			if(null != ipaddress && !ipaddress.equals("")){
				address = AddressUtil.getAddresses("ip="+ipaddress, "utf-8");
				if((null != address && address.contains("IP")) || null == address){
					address = getSystemProperties().get("username");
				}
				
			}else{
				address = getSystemProperties().get("username");
			}
		} catch (SocketException e) {
            e.printStackTrace();  
        } catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} 
    	
    	return address;
    }
}
