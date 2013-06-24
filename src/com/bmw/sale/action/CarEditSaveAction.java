package com.bmw.sale.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Random;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import com.bmw.sale.business.CarImpl;
import com.bmw.sale.value.Car;
import com.opensymphony.xwork2.ActionSupport;

public class CarEditSaveAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	private Car carinfo=new Car();
	private CarImpl<Car> carImpl;
	private File upload;  
	private String uploadFileName;  
	private String uploadContentType;  
	public File getUpload() {  
        return upload;  
    }  
  
    public void setUpload(File upload) {  
        this.upload = upload;  
    }  
  
    public String getUploadFileName() {  
        return uploadFileName;  
    }  
  
    public void setUploadFileName(String uploadFileName) {  
        this.uploadFileName = uploadFileName;  
    }  
  
    public String getUploadContentType() {  
        return uploadContentType;  
    }  
  
    public void setUploadContentType(String uploadContentType) {  
        this.uploadContentType = uploadContentType;  
    }  
	public Car getCarinfo() {
		return carinfo;
	}
	public void setCarinfo(Car carinfo) {
		this.carinfo = carinfo;
	}
	public CarImpl<Car> getCarImpl() {
		return carImpl;
	}
	public void setCarImpl(CarImpl<Car> carImpl) {
		this.carImpl = carImpl;
	}
	
	public String editsave() throws Exception{
		
		if(uploadFileName!=null){
			SimpleDateFormat tempDate = new SimpleDateFormat("yyyyMMddHHmm");		
			String datetime = tempDate.format(new java.util.Date());
			//生成当前日期
			String path = ServletActionContext.getServletContext().getRealPath("/upload");
			//获取路径
			String fileExt = uploadFileName.substring(uploadFileName.lastIndexOf(".") + 1);
			//获取文件扩展名
			String newName=datetime+new Random().nextInt(1000)+"."+fileExt;
			//生成新的文件名
			File target = new File(path, newName);
			FileUtils.copyFile(upload, target);
	        //将新的文件名作用于源文件
	        String filename = path+File.separator+newName;
	        //最终文件上传的路径+文件名
	        System.out.println("文件以保存到："+filename); 
	        
	        FileInputStream in = new FileInputStream(filename);  
	        FileOutputStream out = new FileOutputStream(upload);  
	        byte[]b = new byte[1024];  
	        int len = 0;  
	        while((len=in.read(b))>0){  
	            out.write(b,0,len);  
	        }  
	        out.close(); 
	        //保存文件
	        String pic="../upload/"+newName;//如果上传保存路径到数据库
	        carinfo.setCarpic(pic);		
		}		
		carImpl.modifyCar(carinfo);
		return SUCCESS;
	}

}
