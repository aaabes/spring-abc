package xyz.springabc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.springabc.domin.Field;
import xyz.springabc.domin.Property;
import xyz.springabc.repository.FieldRepo;
import xyz.springabc.repository.PropertyRepo;

import javax.servlet.ServletContext;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Service
public class PropertyServ {

	@Autowired
	private PropertyRepo propertyRepo;

	@Autowired
	private FieldRepo fieldRepo;
	
	private ServletContext application;

	/**
	 * 启动监听设置这个属性
	 * @param application
	 */
	public void setup(ServletContext application){
		this.application=application;
		Map<String,Field> propertyMap = new HashMap<>();
		List<Property> propertyList = propertyRepo.findAll();
		for(Property property:propertyList){
			propertyMap.put(property.getKeyword(),fieldRepo.findOneByProperty(property));//以后要拓展列表参数
		}
		application.setAttribute("app",propertyMap);
	}

	public void update(Map<String, String[]> parames) {
		Set<String> keys = parames.keySet();
		for (String key : keys) {
			String[] values = parames.get(key); //参数值
			Property property = propertyRepo.findOneByKeyword(key);
			if (property != null) {
				Field field = fieldRepo.findOneByProperty(property);//先获取第一个参数值
				field.setContent(values[0]);//以后要拓展列表参数
				fieldRepo.save(field);
			}
		}
		setup(application);
	}

	public void test() {
		System.out.println("233333");
	}
}
