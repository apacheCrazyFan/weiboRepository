package com.yc.weibo.util;   
  
import java.awt.AlphaComposite;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;   
import java.awt.Image;   
import java.awt.RenderingHints;   
import java.awt.image.BufferedImage;   
import java.io.File;   
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;   
  
import javax.imageio.ImageIO;   
import javax.swing.ImageIcon;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;   
  

/**  
 * 图片水印  
 * @blog http://sjsky.iteye.com  
 * @author Michael  
 */  
public class ImageMarkLogoByIcon {   
    /**  
     * 给图片添加水印、可设置水印图片旋转角度  
     * @param iconPath 水印图片路径  
     * @param srcImgPath 源图片路径  
     * @param targerPath 目标图片路径  
     * @param degree 水印图片旋转角度  
     */  
    public static boolean markImageByIcon(String iconPath, String srcImgPath,String targerPath,double x,double y) {   
        OutputStream os = null;   
        try { 
            Image srcImg = ImageIO.read(new File(srcImgPath));  
            BufferedImage buffImg = new BufferedImage(srcImg.getWidth(null),   
                    srcImg.getHeight(null), BufferedImage.TYPE_INT_RGB);   
  
          //获取图片大小
        	int width=srcImg.getWidth(null);
        	int height=srcImg.getHeight(null);
        	
            // 得到画笔对象   
            // Graphics g= buffImg.getGraphics();   
            Graphics2D g = buffImg.createGraphics();   
  
            // 设置对线段的锯齿状边缘处�?  
            g.setRenderingHint(RenderingHints.KEY_INTERPOLATION,   
                    RenderingHints.VALUE_INTERPOLATION_BILINEAR);   
  
            g.drawImage(srcImg.getScaledInstance(srcImg.getWidth(null), 
            		srcImg.getHeight(null), Image.SCALE_SMOOTH), 0, 0, null);    
      
  
            // 水印图象的路�?水印�?��为gif或�?png的，这样可设置�?明度   
            ImageIcon imgIcon = new ImageIcon(iconPath);
            imgIcon.setImage(imgIcon.getImage().getScaledInstance(50,40,Image.SCALE_DEFAULT));
            System.out.println(imgIcon.getIconWidth());
            
            // 得到Image对象�?  
            Image img = imgIcon.getImage();
            
  
            float alpha = 0.2f; // 透明度
            g.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP, alpha));   
  
            // 表示水印图片的位置              
            g.drawImage(img, (int)(width/x), (int)(height/y), null);   
          	
  
            g.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_OVER));   
  
            g.dispose();   
  
            os = new FileOutputStream(targerPath);   
  
            // 生成图片   
            os=new FileOutputStream(targerPath);
            JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(os);  
            encoder.encode(buffImg);    
            return true;
  
        } catch (Exception e) {   
            e.printStackTrace();   
            return false;
        } finally {   
            try {   
                if (null != os)   
                    os.close();   
            } catch (Exception e) {   
                e.printStackTrace();   
            }   
        }   
    } 


    /**
     * 文字水印
     * @param 源图片路径
     * @param 需要添加水印的文字信息
     * @param 添加水印后存储的路径
     */
    public   static   boolean  pressText(File pic,String txt,String realPath,double x,double y) {  
    	   FileOutputStream fos=null;
       	try  {  
           	Image image=ImageIO.read(pic);//读取要添加水印的图片
           	
           	//获取图片大小
           	int width=image.getWidth(null);
           	int height=image.getHeight(null);
           	
           	
           	//1.创建�?��图片缓存对象
               BufferedImage bufferImage = new  BufferedImage(width, height,  
                       BufferedImage.TYPE_INT_RGB); 
               //2.创建java绘图工具
               Graphics2D g = bufferImage.createGraphics(); 
               
               //3.使用绘图工具对象将原图绘制到缓存对象�?
               g.drawImage(image, 0 ,  0 , width, height,  null );  
                 
               
               //4.添加水印
               g.setColor(Color.RED);  
               g.setFont(new  Font("微软雅黑",Font.BOLD,10));  
               
               g.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP,0.3f));
               
               g.rotate(0,0,0);

               
               g.drawString(txt,(float)(width/x),(float)(height/y));
               g.dispose();  
               
               //5.创建图片编码类，对图片进行编码处理
              fos=new FileOutputStream(realPath);
              JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(fos);  
              encoder.encode(bufferImage);  
               return true;
           } catch  (Exception e) {  
               System.out.println(e);  
               return false;
           } finally{
           	if(fos!=null){
           		try {
   					fos.close();
   				} catch (IOException e) {
   					e.printStackTrace();
   				}
           	}
           } 
    }   
    
    
}  