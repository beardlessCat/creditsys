package com.creidtsys.apps.manage.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.creidtsys.apps.manage.entity.PaperRelation;
import com.creidtsys.apps.manage.service.PaperRelationService;
import com.creidtsys.utils.ResumeWord;


/**
 * 
* @ClassName: BillController
* @Description: TODO 生成word文档controller
* @author liuyj
* @date 2017年11月13日 上午9:41:37
*
 */
@Controller
@RequestMapping("/bill")
public class BillController {
	@Resource
	private PaperRelationService paperRelationService ;
	//生成word文档
	  @RequestMapping("/downResumeDoc")
	  @ResponseBody
	    public String downResumeDoc(HttpServletRequest request,HttpServletResponse response,String paperId) throws Exception{
	        request.setCharacterEncoding("utf-8");
	        Map<String,Object> map = new HashMap<String,Object>();
	        //获得标题
	        List<PaperRelation> listTitle = paperRelationService.getTitleList(paperId) ;
	        //获得大题集合
	        List<Map<String,Object>> bigList = paperRelationService.getBigList(paperId) ;
	        //获得小题集合
	        List<PaperRelation> smallList = paperRelationService.getSmallList(paperId) ;
	        String title = listTitle.get(0).getPrName()+"试卷要点" ;
	        map.put("title", title) ;
	        map.put("bigList",bigList) ;
	        map.put("smallList",smallList) ;
	        //提示：在调用工具类生成Word文档之前应当检查所有字段是否完整
	        //否则Freemarker的模板殷勤在处理时可能会因为找不到值而报错，这里暂时忽略这个步骤
	        File file = null;
	        InputStream fin = null;
	        ServletOutputStream out = null;
	        try{
	            //调用工具类WordGenerator的createDoc方法生成Word文档
	            file = ResumeWord.createDoc(map, "paperDetial");
	            fin = new FileInputStream(file);
	            response.setCharacterEncoding("utf-8");
	            response.setContentType("application/msword");
	            response.addHeader("Content-Disposition", "attachment;filename=paperDetial.doc");
	            out = response.getOutputStream();
	            byte[] buffer = new byte[1024];//缓冲区
	            int bytesToRead = -1;
	            // 通过循环将读入的Word文件的内容输出到浏览器中  
	            while((bytesToRead = fin.read(buffer)) != -1) {  
	                out.write(buffer, 0, bytesToRead);  
	            }
	        }catch(Exception ex){
	            ex.printStackTrace();
	        }
	        finally{
	            if(fin != null) fin.close();  
	            if(out != null) out.close();  
	            if(file != null) file.delete(); // 删除临时文件  
	        }
	        return null;
	    }
}
