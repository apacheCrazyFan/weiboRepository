/*package com.yc.weibo.util;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartException;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;



public class CustomCommonsMultipartResolver extends CommonsMultipartResolver{
	 @Override  
    protected MultipartParsingResult parseRequest(HttpServletRequest request)  
            throws MultipartException {  
        String encoding = determineEncoding(request);  
        FileUpload fileUpload = prepareFileUpload(encoding);  
  
        // 加入文件进度监听器 (原Source上添加) start  
        FileProcessListener processListener = new FileProcessListener(  
                request.getSession());  
        fileUpload.setProgressListener(processListener);  
        // 加入文件进度监听器 (原Source上添加) end  
  
        try {  
            List<FileItem> fileItems = ((ServletFileUpload) fileUpload)  
                    .parseRequest(request);  
            return parseFileItems(fileItems, encoding);  
        } catch (FileUploadBase.SizeLimitExceededException ex) {  
            throw new MaxUploadSizeExceededException(fileUpload.getSizeMax(),  
                    ex);  
        } catch (FileUploadException ex) {  
            throw new MultipartException(  
                    "Could not parse multipart servlet request", ex);  
        }  
    }
}
*/