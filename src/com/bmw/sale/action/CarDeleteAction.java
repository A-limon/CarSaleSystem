package com.bmw.sale.action;

import java.io.File;

import org.apache.struts2.ServletActionContext;
import com.bmw.sale.business.CarImpl;
import com.bmw.sale.value.Car;
import com.opensymphony.xwork2.ActionSupport;

public class CarDeleteAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	private Car carinfo=new Car();
	private CarImpl<Car> carImpl;
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
	
	protected String getParam(String key){
		return ServletActionContext.getRequest().getParameter(key);
	}
	
	public static boolean deleteFile(String fileName){     
        File file = new File(fileName);     
        if(file.isFile() && file.exists()){     
            file.delete();     
            System.out.println("删除文件"+fileName+"成功！");     
            return true;     
        }else{     
            System.out.println("删除文件"+fileName+"失败！");     
            return false;     
        }     
    } 
	
	public String delete() throws Exception{
		Integer id = Integer.parseInt(getParam("param"));
		carinfo=carImpl.getCar(Car.class, id);
		
		String filename=carinfo.getCarpic().substring(2);//从数据库读出路径去掉"../"
		String newurl = ServletActionContext.getServletContext().getRealPath(filename);//获取真实物理地址
		deleteFile(newurl);//删除物理文件
		
		carImpl.deleteCar(id, Car.class);
		return SUCCESS;
	}
}
