package com.study.study_manager.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

public class UploadFile {
    private static Logger logger = LoggerFactory.getLogger(UploadFile.class);

    /***
     * 上传图片
     * @param uploadImg
     * @return
     */
    public static String uploadImg(MultipartFile uploadImg){
        String contentType = uploadImg.getContentType();
        String fileName = uploadImg.getOriginalFilename();
        logger.info("上传图片:name={"+fileName+"},type={"+contentType+"}");
        String location = SpringBeanTool.getApplicationContext().getEnvironment().getProperty("img.location");
        String filePath = location; // 上传后的路径
        String suffixName = fileName.substring(fileName.lastIndexOf("."));  // 后缀名
        fileName = UUID.randomUUID() + suffixName; // 新文件名
        File newFile = new File(filePath + fileName);
        try {
            uploadImg.transferTo(newFile);//上传文件写到服务器上指定的文件(spring mvc)
        } catch (IOException e) {
            e.printStackTrace();
        }
        return fileName;
    }
}
