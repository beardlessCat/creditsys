package com.creidtsys.apps.courseManage.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Queue;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creidtsys.apps.courseManage.dao.CourseDependDao;
import com.creidtsys.apps.courseManage.dao.CourseRelationDao;
import com.creidtsys.apps.courseManage.entity.CourseDepend;
import com.creidtsys.apps.courseManage.entity.CourseRelation;
import com.creidtsys.apps.courseManage.service.CourseRelationService;
import com.creidtsys.apps.courseManage.service.RecommendCourseService;
import com.creidtsys.apps.manage.dao.RelationDao;
import com.creidtsys.apps.manage.entity.Relation;
@Service("recommendCourseService")
public class RecommendCourseServiceImpl implements RecommendCourseService{
	@Resource
	private RelationDao relationDao ; 
	@Resource
	private CourseRelationDao courseRelationDao ;
	@Autowired
	private CourseRelationService courseRelationService ;
	
	//=====================================================换成dao
	@Resource
	private CourseDependDao courseDependDao ;
	@Override
	public List<Map<String, String>> getCourseGra(Relation relation) {
		// TODO Auto-generated method stub
		//根据职位获得对应的全部知识点
				List<Relation> list = relationDao.getAllPoint(relation.getRelationId());
				//定义存放所有知识点对应的课程id的集合
				List<String> sIdList = new ArrayList<String>();
				//获得选中的职位名称
				String positionName = relation.getRelationRes();
			//	positionNameS=positionName ;
				//循环获得知识点对应的课程id
				for(int i=0;i<list.size();i++ ){
					String pointId = list.get(i).getOtherId();
					//根据知识点查询课程id
					List<CourseRelation> reList =  courseRelationService.getCourse(pointId); 
					for(int j=0;j<reList.size();j++){
						String sId = reList.get(j).getSrOtherId();
						if(!sIdList.contains(sId)){
							sIdList.add(sId);
						}
					}
				}		
				//新建newIdParamList 内容为课程id的集合
				List<String> newIdParamList = new ArrayList<String>(sIdList) ;
				Queue<String> queue = new LinkedList<String>();
				for(String id :newIdParamList){
					queue.offer(id);
				}
				//递归查询所有的相关课程
				List<String> finalList= getList(newIdParamList,queue);
				
			//	allCourseList = new ArrayList<String>(finalList);
				
				

				List<String> pdRootList = new ArrayList<String>() ;
				List<String> pIdList = new ArrayList<String>();
				/**
				 * 获得所有id的依赖id
				 */
				
				for(String s :finalList){
					List<CourseDepend> p = courseDependDao.getBySid(s);
					for(CourseDepend c:p){
						String str = c.getCoursePid();
						if(!pIdList.contains(str)){
							pIdList.add(str);
					}
				}
			}
				//pdRootList  根节点
				for(String rootId:finalList){
					if(!pIdList.contains(rootId)){
						pdRootList.add(rootId) ;
					}
				}
				//获取每个的pid
				List<Map<String,String>> listMaps = initData(finalList);		
				List<Map<String,String>> testList = new ArrayList<Map<String,String>>();
				Map<String,String> root = new HashMap<String, String>();
				root.put("key", positionName);
				root.put("color", "#EF9EFA") ;
				testList.add(root);
				for(Map<String,String> m:listMaps){
					//if(!choosedList.contains(m.get("sId"))&&!choosedList.contains(m.get("pSid"))){
					Map<String,String> lmap = new HashMap<String, String>() ;
					//判断是否有依赖，没有的话指向根节点
					List<CourseDepend> tl =  courseDependDao.getByPsid(m.get("sId"));
					String color = "#CDDAF0";
					if(tl.size()>0){
						for(int l=0;l<tl.size();l++){
							//判断叶子节点（根节点）
							if(pdRootList.contains(tl.get(l).getCoursePid())){
									lmap.put("parent", m.get("name"));
									lmap.put("key", m.get("pname"));
									lmap.put("dir", "left");
									lmap.put("color", color);
									if(!testList.contains(lmap)){
										if(!lmap.get("key").equals("0")){
											testList.add(lmap);
										}
									}
									Map<String,String> mMap = new HashMap<String, String>() ;
									mMap.put("parent", positionName);
									mMap.put("key", m.get("name"));
									mMap.put("dir", "left");
									mMap.put("color", color);
									if(!testList.contains(mMap)){
										testList.add(mMap);
									}
							}else{
								//不需指向职位节点
								lmap.put("parent", m.get("name"));
								lmap.put("key", m.get("pname"));
								lmap.put("dir", "left");
								lmap.put("color", color);
								if(!testList.contains(lmap)){
									if(!lmap.get("key").equals("0")){
										testList.add(lmap);
									}
								}
							}
						}
					}else{
						//不需指向职位节点
						//指向根节点
						lmap.put("parent", m.get("name"));
						lmap.put("key", m.get("pname"));
						lmap.put("dir", "left");
						lmap.put("color", color);
						if(!testList.contains(lmap)){
							if(!lmap.get("key").equals("0")){
								testList.add(lmap);
							}
						}
						Map<String,String> mMap = new HashMap<String, String>() ;
						mMap.put("parent", positionName);
						mMap.put("key", m.get("name"));
						mMap.put("dir", "left");
						mMap.put("color", color);
						if(!testList.contains(mMap)){
							testList.add(mMap);
						}
					}
				}
			return testList ;
	}
	@Override
	public List<String> getList(List<String> list, Queue<String> queue) {
		// TODO Auto-generated method stub
		List<CourseDepend> listde=  courseDependDao.getBySid(queue.poll());
		for(int n=0;n<listde.size();n++){
			String pid = listde.get(n).getCoursePid() ;
			if((!list.contains(pid))&&(pid!="0")){
					list.add(pid);
					queue.offer(pid);
				}		
			}
		if(queue.size()>0){
			getList(list, queue);
		}
		return list ;
	}
	@Override
	public List<Map<String, String>> initData(List<String> list) {
		// TODO Auto-generated method stub
		List<Map<String,String>> listMap = new ArrayList<Map<String,String>>();
		for(String sId:list){
			List<CourseDepend> listDep = courseDependDao.getBySid(sId);
			for(CourseDepend cd:listDep){
				Map<String,String> map = new HashMap<String, String>() ;
				map.put("name", cd.getCourseName());
				map.put("pname", cd.getCoursePname());
				map.put("checked", cd.getIsNes()) ;
				map.put("sId", cd.getCourseSid());
				map.put("pSid", cd.getCoursePid());
				listMap.add(map);
			}
		}
		return listMap ;
	}

}
