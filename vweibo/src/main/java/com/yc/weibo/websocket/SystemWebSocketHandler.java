package com.yc.weibo.websocket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.context.annotation.Bean;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;

import com.yc.weibo.DataDic.DataDic;
import com.yc.weibo.util.Encrypt;

public class SystemWebSocketHandler implements WebSocketHandler {
	private static long fromIndex = 0;

	private static final ArrayList<WebSocketSession> users;

	//private static final List<HashMap<String, HashMap<String, TextMessage>>> unReadList;

	private static final HashMap<String, HashMap<String, TextMessage>> unReadMap_f_t;

	//private static final HashMap<String,TextMessage> unReadMap_t;

	static {
		users = new ArrayList<>();
		//unReadList = new ArrayList<HashMap<String,HashMap<String,TextMessage>>>();  //其实这里可以用到协议来做
		unReadMap_f_t = new HashMap<String, HashMap<String, TextMessage>>();
		//unReadMap_t = new HashMap<String,TextMessage>();
	}



	@Bean
	public Encrypt getEncrypt(){
		return new Encrypt();
	}

	/**
	 * WebSocketSession 调用 HttpSession
	 * @param session
	 * @param config
	 */
	/*@OnOpen
    public void onOpen(Session session,EndpointConfig config) {
    	HttpSession httpSession= (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
    	System.out.println( httpSession.getAttribute("name"));

    	Map<String,String> name_sessionId = new HashMap<String,String>();
        WeiBoUser user = (WeiBoUser)httpSession.getAttribute("user");
        name_sessionId.put(user.getUserName(), user.getuSessionid());
        userNames.add(name_sessionId);

        System.out.println( "我进到了 opOpen（）方法");
    }*/

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		users.add(session);

		session.sendMessage(new TextMessage("德莱联盟欢迎您~~"));

		if(users != null){
			for(WebSocketSession user : users){
				System.out.println( user.getAttributes() +"   "+user.getId());

			}

			System.out.println("unReadMap_f_t    ==   "+unReadMap_f_t);
		}

	}

	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		String txt = (String) message.getPayload();
		System.out.println( txt);
		if(txt.equals(DataDic.S_AITE)){ //如果是@
			session.sendMessage(new TextMessage(""));

		}else if(txt.equals(DataDic.S_ZAN)){ //如果是点赞
			//

		}else if(txt.equals(DataDic.S_PINGLUN)){ //如果是评论
			//
		}else {
			//
			sendMessageStart(txt,session);
		}
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		if(session.isOpen()){
			session.close();
		}
		users.remove(session);

	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) throws Exception {
		users.remove(session);
	}

	@Override
	public boolean supportsPartialMessages() {
		return false;
	}

	/**
	 * 给所有在线用户发送消息
	 *
	 * @param message
	 */
	public void sendMessageToUsers(String toName, TextMessage message) {
		for (WebSocketSession user : users) {
			try {
				if (user.isOpen()) {
					user.sendMessage(message);
					delMessageToUnReadMap(toName);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 给某个用户发送消息
	 *
	 * @param userName 登录当前浏览器的用户sessionid
	 * @param message	信息内容
	 */
	public void sendMessageToUser(String toName, String fromName, TextMessage message) {
		boolean flag = false;
		if(users != null){

			for (WebSocketSession user : users) {
				if (user.getAttributes().containsKey(toName)) {
					try {
						if (user.isOpen()) {
							String message_t = message.getPayload().toString();
							user.sendMessage(new TextMessage(toName+"__"+fromName+"__"+message_t));
							flag = true;
							break;  //这里就决定了你只能发送给一个人，也就是后面会出现在同一个浏览器对用户登录只会推送消息给第一个登录的用户的原因
						}
					} catch (IOException e) {
						e.printStackTrace();
					}
				}else{ //说明改在线用户中没有你要发送消息的对象，下一个
					//
					continue;
				}
			}

			if(!flag){ //说明所有的用户中没有你想要的发送消息的对象
				//将所要发送的消息添加到unReadList中
				putMessageToUnReadMap(toName,fromName,message);
			}
		}else{
			putMessageToUnReadMap(toName,fromName,message);

		}
	}

	/**
	 * 给某组特别的用户发送信息
	 * @param userNames
	 * @param message
	 */
	/*public void sendMessageToSomebodyByArray(String fromName, String[] userNames,TextMessage message){

		int number = 0;
		for (WebSocketSession user : users) {
			for(int i = 0; i < userNames.length; i ++){

				if (user.getAttributes().containsKey(userNames[i])) {
					try {
						if (user.isOpen()) {
							user.sendMessage(message);
							delMessageToUnReadMap(fromName);
							number ++;

						}
					} catch (IOException e) {
						e.printStackTrace();
					}
				}else{
					continue;
				}

				if(number == userNames.length){  //节约时间吧 自己写的 反正都是自己写的
					break;
				}
			}
		}
	}*/


	/**
	 * 向某些人发送信息
	 * @param userNames 
	 * @param message
	 */
	public void sendMessageToSomebodyByToUser(String fromName, String[] userNames,TextMessage message){
		for (WebSocketSession user : users) {
			for(int i = 0; i < userNames.length; i ++){
				String toName = userNames[i];
				if(toName != null){
					if (user.getAttributes().containsKey(toName)) {
						sendMessageToUser(toName,fromName, message);
					}else{
						continue;
					}
				}
			}
		}
	}


	/**
	 * 将要发送的消息添加至  unReadMap_f_t 中
	 * @param fromName
	 * @param toName
	 * @param message
	 */
	private void putMessageToUnReadMap(String toName, String fromName, TextMessage message){
		HashMap<String,TextMessage> to_message = null;

		if(unReadMap_f_t != null && unReadMap_f_t.size() > 0){
			for(Map.Entry<String, HashMap<String,TextMessage>> f_t_m_ : unReadMap_f_t.entrySet()){
				String f_m_temp = f_t_m_.getKey();
				HashMap<String,TextMessage> t_m_temp = f_t_m_.getValue();
				if(f_m_temp.equals(toName)){
					if(t_m_temp != null && t_m_temp.size() > 0){
						boolean flag = false;
						for(Map.Entry<String, TextMessage> t_m_ : t_m_temp.entrySet()){
							String t_temp = t_m_.getKey();
							if(t_temp.indexOf(fromName) != -1){
								flag = true;
								to_message = t_m_temp;
								to_message.put(t_temp+"_"+fromIndex, message);
								fromIndex ++;
								break;
							}else{
								continue;
							}
							
						}
						if(!flag){
							to_message = t_m_temp;
							to_message.put(fromName, message);
						}
						unReadMap_f_t.put(toName,to_message);
					}
				}else{
					to_message = new HashMap<String,TextMessage>();
					to_message.put(fromName, message);
					unReadMap_f_t.put(toName,to_message);
				}
			}
		}else{
			to_message = new HashMap<String,TextMessage>();
			to_message.put(fromName, message);
			unReadMap_f_t.put(toName,to_message);
		}
	}

	/**
	 * 删除 unReadMap_f_t 中 已经发送的消息
	 * @param toName
	 */
	private void delMessageToUnReadMap(String toName){
		for(Map.Entry<String, HashMap<String,TextMessage>> f_t_m_ : unReadMap_f_t.entrySet()){
			String f_m_temp = f_t_m_.getKey();
			if(f_m_temp != null && f_m_temp.equals(toName)){
				unReadMap_f_t.remove(f_m_temp);
			}
		}
	}

	/***
	 * 连接后发送未读消息
	 * @param fromName
	 * @param toName
	 * @param message
	 */
	private void sendMessageStart(String toName, WebSocketSession session){
		for(Map.Entry<String, HashMap<String,TextMessage>> f_t_m_ : unReadMap_f_t.entrySet()){
			String f_temp = f_t_m_.getKey();
			HashMap<String, TextMessage> t_m_temp = f_t_m_.getValue();
			if(f_temp.equals(toName)){
				for(Map.Entry<String, TextMessage> t_m_ : t_m_temp.entrySet()){
					String t_temp = t_m_.getKey();
					TextMessage m_temp = t_m_.getValue();
					String message = m_temp.getPayload().toString();
					try {
						session.sendMessage(new TextMessage(f_temp+"__"+t_temp+"__"+message) );
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				
				delMessageToUnReadMap(toName);
				break;
			}else{
				continue;
			}
		}
	}
}
