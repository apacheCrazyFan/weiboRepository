package com.yc.weibo.handler;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.yc.weibo.DataDic.DataDic;
import com.yc.weibo.entity.MessageResp;
import com.yc.weibo.entity.Theme;
import com.yc.weibo.entity.WeiBoUser;
import com.yc.weibo.service.ThemeService;
import com.yc.weibo.service.UserService;
import com.yc.weibo.util.ImageMarkLogoByIcon;

import Decoder.BASE64Decoder;



@Controller
@RequestMapping("/user")
@SessionAttributes(value={"user","Themes","groupnumber"},types={String.class})
public class UserHandler {
	@Autowired
	private ServletContext servletContext;
	@Autowired
	private UserService userService;
	@Autowired
	private ThemeService themeService;

	StringBuffer randomCode = new StringBuffer();

	//登录
	@ModelAttribute
	public void getModel(ModelMap map){ //使用map/modelMap进行数据传参，作用范围是？还是会话
		map.put("user", new WeiBoUser());
		map.put("Themes", new ArrayList<Theme>()); //话题信息
		map.put("groupnumber", new HashMap<String,Integer>()); //关注，粉丝。微博，未分组，好友圈等
	}

	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(String UphoneOrUemail,String Upassword,ModelMap map){
		WeiBoUser user = null;
		String format = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$";

		if(UphoneOrUemail.matches(format)){ //说明是邮箱
			//System.out.println( "我进了邮箱");
			user = new WeiBoUser(Upassword,UphoneOrUemail,0);
		}else{
			//System.out.println( "我进了手机");
			user = new WeiBoUser(Upassword,UphoneOrUemail);
		}


		user=userService.login(user);
		if(user==null){
			map.put("errorMsg","用户名或密码错误");
			return "/front/page/login.jsp";
		}
		//到这里说明登录成功了。那么我们作为服务器一端     应该要给它准备一些数据 ，还是它自己再做请求去申请数据？？
		Theme params=new Theme();
		params.setPage(1);
		params.setRows(10);
		List<Theme> Themes = themeService.findThemeByPage(params);

		List<Map<String, Integer>> groupnumber = themeService.findeGroupNumber(user.getWBUid());
		map.put("user", user);		//用户信息
		map.put("Themes", Themes); //话题信息
		map.put("groupnumber", groupnumber.get(0)); //关注，粉丝。微博，未分组，好友圈等

		return "forward:/front/page/afterlogin.jsp";	
	}





	//注册
	@RequestMapping(value="/register")
	public String register(@ModelAttribute("user")WeiBoUser user,ModelMap map,HttpServletRequest request){
		WeiBoUser wuser=new WeiBoUser(user.getWBUid(),user.getUname(),user.getUpassword(),user.getUphone(),user.getUemail(),
				user.getUsex().substring(0,1),user.getUage(),user.getUimgPath(),user.getUregisterDate(),user.getYZcode(),
				user.getYZcodeInput(),user.getWcount(),user.getTcount());
		System.out.println(wuser);
		if (randomCode.toString().equalsIgnoreCase(user.getYZcodeInput())) {
			userService.register(wuser);
			return "/front/page/login.jsp";
		} else {
			map.put("YZcodeErr", "验证码错误,请重新获取");
			return "/front/page/register.jsp";
		} 

	}
	//邮件发送
	@RequestMapping("/sendEMail")
	private void sendEMail(String email,PrintWriter out){
		Random random=new Random();
		// 设置默认生成4个验证码
		int length = 4;
		// 设置备选验证码:包括"a-z"和数字"0-9"
		String base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		int size = base.length();
		// 随机产生4位数字的验证码。
		for (int i = 0; i < length; i++) {
			// 得到随机产生的验证码数字。
			int start = random.nextInt(size);
			String strRand = base.substring(start, start + 1);
			// 将产生的四个随机数组合在一起
			randomCode.append(strRand);
		}
		boolean isSendEmail=activeAccountMail("用户验证","您的验证码为:"+randomCode.toString(),
				"13237344042@163.com",email);
		if(isSendEmail){
			out.println("验证码发送成功");
		}else{
			out.print("验证码发送失败,请重新获取");
		}
		out.flush();
		out.close();
	}
	@Autowired
	private JavaMailSender mailSender;
	private boolean activeAccountMail(String subject,String content,String from,String to){
		try {
			MimeMessage mm = mailSender.createMimeMessage();
			MimeMessageHelper mmh = new MimeMessageHelper(mm,true);
			mmh.setTo(to);  //设置邮件接收者
			mmh.setFrom(from); //
			mmh.setSubject(subject);   //设置主题
			mmh.setText(content);    //设置内容
			mailSender.send(mm);   //设置邮件
			return true;
		} catch (MessagingException e) {
			e.printStackTrace();
			return false;
		}
	}

	//上传头像
	@RequestMapping("/setphoto")
	public void setPhoto(@RequestParam("photodata") String file,@RequestParam("WBUid")String WBUid,PrintWriter out){
		BASE64Decoder decoder = new BASE64Decoder();
		byte[] bytes;
		try {
			bytes = decoder.decodeBuffer(file);
			for (int i = 0; i < bytes.length; ++i) {
				if (bytes[i] < 0) {
					bytes[i] += 256;
				}
			}
			String filename=new Date().getTime()+""+new Random().nextInt(100000)+".jpg";
			String rootDir = DataDic.IMAGES;
			String uploadPicPath = servletContext.getRealPath(rootDir).
					substring(0, servletContext.getRealPath(rootDir).lastIndexOf(DataDic.PROJECTNAME)-1)+rootDir; 
			
			FileOutputStream photopath = new FileOutputStream(uploadPicPath+filename);
			photopath.write(bytes); 
			photopath.flush();
			photopath.close();
			
			Map<String,String> paramMap=new HashMap<>();
			paramMap.put("UimgPath", filename);
			paramMap.put("WBUid", WBUid);
			userService.updataUserPhoto(paramMap);
			out.println("头像上传成功");
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
			out.println("头像上传失败");
			out.flush();
			out.close();
		}
	}


	@RequestMapping("/userset")
	public String userSet(@RequestParam("WBUid")String WBUid,ModelMap map){
		WeiBoUser weiboUser=userService.findInfoByWbuid(Integer.parseInt(WBUid));
		map.addAttribute("user",weiboUser);
		return "front/page/UserSet.jsp";

	}

	//修改昵称
	@ResponseBody
	@RequestMapping(value="/saveChangeUserName")
	public String saveChangeUserName(String newName,String WBUid,PrintWriter out){
		Map<String, String> paramMap=new HashMap<>();
		paramMap.put("Uname",newName);
		paramMap.put("WBUid",WBUid);
		userService.saveChangeUserName(paramMap);
		out.println("修改成功");
		out.flush();
		out.close();
		return "front/page/UserSet.jsp";
	}

	//修改密码
	@ResponseBody
	@RequestMapping(value="/changePassWord")
	public String changePassWord(String Upassword,String WBUid,PrintWriter out){
		System.out.println(Upassword);
		Map<String, String> paramMap=new HashMap<>();
		paramMap.put("Upassword",Upassword);
		paramMap.put("WBUid",WBUid);
		userService.changePassWord(paramMap);
		out.println("密码修改成功");
		out.flush();
		out.close();
		return "front/page/UserSet.jsp";
	}

	//修改个人信息
	@ResponseBody
	@RequestMapping(value="/savePersonInfo")
	public void savePersonInfo(String sex,String userIntroduce,String userEmail,String WBUid,PrintWriter out){
		Map<String, String> paramMap=new HashMap<>();
		paramMap.put("userIntroduce",userIntroduce);
		paramMap.put("userEmail",userEmail);
		paramMap.put("sex",sex);
		paramMap.put("WBUid",WBUid);
		System.out.println(paramMap);
		userService.savePersonInfo(paramMap);
		out.print("个人信息修改成功");
		out.flush();
		out.close();
	}

	//添加个人标签
	@ResponseBody
	@RequestMapping(value="/saveUserTag")
	public void saveUserTag(String Utag,String WBUid,PrintWriter out){
		Map<String, String> paramMap=new HashMap<>();
		paramMap.put("Utag",Utag);
		paramMap.put("WBUid",WBUid);
		System.out.println(Utag+"---"+WBUid);
		userService.saveUserTag(paramMap);
		out.println("标签添加成功");
		out.flush();
		out.close();
	}

	//何种方式找到我
	@ResponseBody
	@RequestMapping(value="/saveFindMe")
	public void saveFindMe(String phoneStatus,String emailStatus,String WBUid,PrintWriter out){
		Map<String, String> paramMap=new HashMap<>();
		paramMap.put("phoneStatus", phoneStatus);
		paramMap.put("emailStatus",emailStatus);
		paramMap.put("WBUid",WBUid);
		System.out.println(paramMap);
		userService.saveFindMe(paramMap);
		out.println("修改成功");
		out.flush();
		out.close();
	}

	//图片水印
	@ResponseBody
	@RequestMapping(value="/addWaterMark")
	public void addWaterMark(String waterContent,String waterLocation,String WBUid,PrintWriter out){
		System.out.println(waterContent+"---"+waterLocation+"----"+WBUid);
		String rootDir = DataDic.PICPATH;
		String waterMarkPicPath = servletContext.getRealPath(rootDir).
				substring(0, servletContext.getRealPath(rootDir).lastIndexOf(DataDic.PROJECTNAME)-1)+rootDir; 
		File file=new File(waterMarkPicPath+"test_pic.jpg");
		String txt=waterContent;
		String realPath=waterMarkPicPath+"test_pic1.jpg";
		double x,y;
		if(waterContent!=null || waterContent!=""){
			if(!waterContent.contains("Logo")){//文字水印
				if(waterLocation.equals("bottomRight")){//底部居右
					x=1.7;
					y=1.1;
				}else if(waterLocation.equals("centerCenter")){//图片中心
					x=2.8;
					y=2.0;
				}else{//底部居中
					x=2.8;
					y=1.1;
				}
				ImageMarkLogoByIcon.pressText(file, txt, realPath, x, y);
				System.out.println("------------转换成功");
			}else{//logo水印
				String iconPath=waterMarkPicPath+"head_logo_sh_mini.png";
				if(waterLocation.equals("bottomRight")){//底部居右
					x=1.3;
					y=1.4;
				}else if(waterLocation.equals("centerCenter")){//图片中心
					x=2.2;
					y=3.7;
				}else{//底部居中
					x=2.2;
					y=1.4;
				}
				ImageMarkLogoByIcon.markImageByIcon(iconPath, waterMarkPicPath+"test_pic.jpg", realPath, x, y);
				System.out.println("------------转换成功");
			}
			out.println("设置成功");
			
		}
		out.flush();
		out.close();
	}
	
	//获取网络IP
	@ResponseBody
	@RequestMapping(value="/getIpAddress")
	public String getIpAddress() throws SocketException{
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
	
	
	//电脑端点击确认登录
	boolean flag=false;
	@RequestMapping(value="/quickLogin",method=RequestMethod.POST)
	public String quickLogin(String userName,ModelMap map){
		System.out.println(userName+"-------");
		System.out.println(flag);
		if(flag){
			System.out.println("电脑端跳转了");
			WeiBoUser user;
			if(userName.contains("@")){
				user=userService.quickLoginByEmail(userName);
			}else{
				user=userService.quickLoginByPhone(userName);
			}
			map.addAttribute("user",user);
			flag=false;
			return "/front/page/afterlogin.jsp";	
		}
		map.put("errorMsgg","请在手机确认登录");
		return "/front/page/quickLogin.jsp";
	}
	
	//手机端登录
	@ResponseBody
	@RequestMapping("/quickLoginYes")
	public String quickLoginYes(String userName,ModelMap map){
		System.out.println("手机连接了....");
		System.out.println("用户名为:"+userName);
		WeiBoUser user;
		if(userName.contains("@")){
			user=userService.quickLoginByEmail(userName);
		}else{
			user=userService.quickLoginByPhone(userName);
		}
		map.put("user",user);
		System.out.println(user);
		if(user!=null){
			flag=true;
			return "登录成功";
		}else{
			flag=false;
			return "请核对用户名";
		}
	}
	@RequestMapping("/findMingRen")
	public void findMingRen(PrintWriter out){
		Gson gson=new Gson();
		List<WeiBoUser> mingRens=userService.findMingRen();
		System.out.print(mingRens);
		out.print(gson.toJson(mingRens));
		out.flush();
		out.close();
	}
	@RequestMapping("/guanzhu")
	public void guanzhu(String WBUid,String MWBUid, PrintWriter out){
		System.out.println(WBUid+"----------"+MWBUid);
		Map<String, Object> params=new HashMap<>();
		params.put("FUid",WBUid);
		params.put("FUedid",MWBUid);
		List<WeiBoUser> mingRens=userService.findMingRen();
		for(int i=0;i<mingRens.size();i++){
			if(MWBUid.equals(mingRens.get(i).getWBUid()+"")){
				out.print("您已经关注过此人");
				break;
			}else{
				userService.guanzhu(params);
				out.println("关注成功");
				break;
			}
		}
	}
	
	@RequestMapping("delUser")
	@ResponseBody
	public MessageResp delUser(String wbuids) {
		int result =0;
		MessageResp mes = new MessageResp();
		try {
			result= userService.delUser(wbuids);
		} catch (Exception e) {
			mes.setCode(0);
			mes.setDesc("有关联，不能删除 ");
			return mes;
		}//会一直把错误抛到这里，
		if (result > 0) {
			mes.setCode(1);
			mes.setDesc("删除成功");
			return mes;
		} else {
			mes.setCode(0);
			mes.setDesc("删除失败");
			return mes;
		}
	}
	
	@ResponseBody//这个可以直接返回一个对象作为json，我们返回一个map就可以了，这就是和easyui的交互规定，你想用就要照着他的规定来
	@RequestMapping("findAllUser")//自动注入的参数，这里的param就已经包含了easyui封装过来的分页的参数了
	public Map<String,Object> findAllUser(WeiBoUser param,HttpServletRequest request,HttpServletResponse response){
		//需要准备好 ，   theme的总数，，，和list的内容，  一个给easy的数据信息，一个是用来计算分页的，
		List<WeiBoUser> list=userService.findAllUser(param);
		int total=userService.countAllUser(param);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("rows", list);
		map.put("total", total);
		return map;
	}
}
