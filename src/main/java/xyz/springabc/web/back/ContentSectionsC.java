package xyz.springabc.web.back;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import xyz.springabc.domin.Node;
import xyz.springabc.domin.Section;
import xyz.springabc.service.NodeServ;
import xyz.springabc.service.SectionServ;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/back/content/sections")
public class ContentSectionsC {
	
	@Autowired
	private SectionServ sectionServ;
	
	@Autowired
	private NodeServ nodeServ;
	
	
	@RequestMapping("")
	public String index(@RequestParam(value="p",defaultValue="1") int p,
			Model model){
		Page<Node> nodePage=nodeServ.getNode(p);
		model.addAttribute("nodes",nodePage.getContent());
		model.addAttribute("page",nodePage);
		List<Section> sectlist=sectionServ.getAll();
		model.addAttribute("sections",sectlist);
		
		return "/BACK/content/sections/index";
	}
	
	/*
	 * delete sections
	 * */
	@RequestMapping("/{id}/delete")
	public String deletesection(@PathVariable("id") int id,
			HttpServletRequest request){
		if(sectionServ.getOneById(id).getNodes().size() == 0)
		{
			sectionServ.deleteById(id);
		}
		String redirectUrl=request.getHeader("Referer");
		return "redirect:"+redirectUrl;
	}
	
	@RequestMapping("/nodes/{id}/delete")
	public String deletenode(@PathVariable("id") int id,
			HttpServletRequest request){
		nodeServ.deleteById(id);
		String redirectUrl=request.getHeader("Referer");
		return "redirect:"+redirectUrl;
	}
	
	@RequestMapping("/nodes/{id}/edit")
	public String edit(@PathVariable("id") int id,
			Model model){
		Node node=nodeServ.getOneNode(id);
		List<Section> sections=sectionServ.getAll();
		model.addAttribute("node",node);
		model.addAttribute("sections",sections);
		return "/BACK/content/sections/edit";
	}
	
	
	@RequestMapping("/nodes/new")
	public String newNode(Model model){
		List<Section> sections=sectionServ.getAll();
		model.addAttribute("sections",sections);
		return "/BACK/content/sections/new";
	}
	
	@RequestMapping(value="/nodes/save")
	public String save(Node node,
			String sectionName,
			String newSectionName,
			RedirectAttributes attributes){
		Section section=sectionServ.getOne(newSectionName);
		if(section==null||newSectionName!=""){
			section=new Section();
			section.setName(newSectionName);
			sectionServ.save(section);
		}else{
			section=sectionServ.getOne(sectionName);
		}
		node.setSection(section);
		nodeServ.save(node);
		List<Section> sections=sectionServ.getAll();
		attributes.addFlashAttribute("node",node);
		attributes.addFlashAttribute("sections",sections);
		attributes.addFlashAttribute("msg","已保存");
		return "redirect:/back/content/sections/nodes/"+node.getId()+"/edit";
	}
	
	@RequestMapping(value="/nodes/update")
	public String update(Node node,
			String sectionName,
			String newSectionName,
			RedirectAttributes attributes){
		Section section=sectionServ.getOne(newSectionName);
		if(section==null||newSectionName!=""){
			section=new Section();
			section.setName(newSectionName);
			sectionServ.save(section);
		}else{
			section=sectionServ.getOne(sectionName);
		}
		node.setSection(section);
		nodeServ.update(node);
		List<Section> sections=sectionServ.getAll();
		attributes.addFlashAttribute("node",node);
		attributes.addFlashAttribute("sections",sections);
		attributes.addFlashAttribute("msg","已保存");
		return "redirect:/back/content/sections/nodes/"+node.getId()+"/edit";
	}
}
