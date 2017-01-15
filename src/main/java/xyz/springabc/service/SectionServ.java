package xyz.springabc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.springabc.domin.Section;
import xyz.springabc.repository.SectionRepo;

import java.util.List;

@Service
public class SectionServ {
	
	@Autowired
	private SectionRepo sectionRepo;
	
	/**
	 * 获取所有分类
	 * @return
	 */
	public List<Section> getAll(){
		return sectionRepo.findAll();
	}
	
	public Section getOne(String name){
		return sectionRepo.findOneByName(name);
	}
	
	public Section getOneById(int id){
		return sectionRepo.findOne(id);
	}
	
	public Section save(Section section){
		sectionRepo.save(section);
		return section;
	}
	
	public void deleteById(int id){
		sectionRepo.delete(new Integer(id));
	}
	
}
