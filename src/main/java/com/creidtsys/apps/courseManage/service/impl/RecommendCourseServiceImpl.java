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

import com.creidtsys.apps.courseManage.dao.CourseDao;
import com.creidtsys.apps.courseManage.dao.CourseDependDao;
import com.creidtsys.apps.courseManage.dao.CourseRelationDao;
import com.creidtsys.apps.courseManage.entity.Course;
import com.creidtsys.apps.courseManage.entity.CourseDepend;
import com.creidtsys.apps.courseManage.entity.CourseRelation;
import com.creidtsys.apps.courseManage.entity.HTMLInfo;
import com.creidtsys.apps.courseManage.service.CourseRelationService;
import com.creidtsys.apps.courseManage.service.RecommendCourseService;
import com.creidtsys.apps.manage.dao.RelationDao;
import com.creidtsys.apps.manage.dao.ResultInfoDao;
import com.creidtsys.apps.manage.entity.Relation;
import com.creidtsys.apps.manage.entity.ResultInfo;
@Service("recommendCourseService")
public class RecommendCourseServiceImpl implements RecommendCourseService{
	@Resource
	private RelationDao relationDao ; 
	@Resource
	private CourseRelationDao courseRelationDao ;
	@Autowired
	private CourseRelationService courseRelationService ;
	@Resource
	private CourseDao courseDao ;
	@Resource
	private ResultInfoDao  resultInfoDao ;
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
	@Override
	public List<String> getAllNeedCourse(Relation relation) {
		// TODO Auto-generated method stub
		//根据职位获得对应的全部知识点
		List<Relation> list = relationDao.getAllPoint(relation.getRelationId());
		//定义存放所有知识点对应的课程id的集合
		List<String> sIdList = new ArrayList<String>();
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
		return getList(newIdParamList,queue);
	}
	public List<Map<String,String>> getTreeDate(List<String> finalList , String positionName){
		List<String> pdRootList = new ArrayList<String>() ;
		//获取每个的pid
		List<Map<String,String>> listMaps = initDataNoPid(finalList);		
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
	private List<Map<String, String>> initDataNoPid(List<String> list) {
		// TODO Auto-generated method stub
		List<Map<String,String>> listMap = new ArrayList<Map<String,String>>();
		for(String sId:list){
			List<CourseDepend> listDep = courseDependDao.getBySid(sId);
			for(CourseDepend cd:listDep){
				if(!list.contains(cd)){
					break ;
				}
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
	@Override
	public List<Map<String, String>> getChoosedList(String userId,String relationId) {
		// TODO Auto-generated method stub
		//所有的		
		Relation relation = new Relation() ;
		relation.setRelationId(relationId);
        List<String> allCourseList = getAllNeedCourse(relation) ;
		//已经选的
        ResultInfo resultInfo = new ResultInfo();
		resultInfo.setRiUserId(userId);
		List<ResultInfo> inList = resultInfoDao.getChoosedCourse(resultInfo);
		//获得已经选的所有相关的
		List<String> choosedList = new ArrayList<String>() ;
		List<String> allChoosedList = new ArrayList<String>();
		if(inList.size()>0){
			for(ResultInfo r:inList){
				if(!choosedList.contains(r.getCourseId())){
					choosedList.add(r.getCourseId());
				}
			}
			Queue<String> queues = new LinkedList<String>();
			for(String i :choosedList){
				queues.offer(i);
			}
			allChoosedList =  getList(choosedList,queues) ;
		}
		//去除已经选的及其相关的
		for(String s :allChoosedList ){
			allCourseList.remove(s) ;
		}
		String positionNameS = "java工程师" ;
		List<Map<String,String>> list = new ArrayList<Map<String,String>>() ;
		if(allCourseList.size()!=0){
			Map<String, String> root =new HashMap<String, String>() ;
			root.put("key", positionNameS);
			root.put("color", "#EF9EFA") ;
			list.add(root);
			//遍历集合
			for(int i=0;i<allCourseList.size();i++){				
				//查询以该节点为依赖课程的课程集合
				List<CourseDepend> lll = courseDependDao.getByPsid(allCourseList.get(i));
				Course course= courseDao.getById(allCourseList.get(i));
				//没有任何课程以他为依赖课程，则指向根节点,且全部位于集合内
				boolean flag = false  ;
				for(CourseDepend tC : lll){
					if(allCourseList.contains(tC.getCourseSid())){
						flag = true ;
					}
					if(flag){
						continue ;
					}
				}
				if(lll.size()>0 && flag){
					//查找以该节点为pid的节点，在allCourseList中时，便指向，否则，抛弃
					List<CourseDepend> idList = courseDependDao.getByPsid(allCourseList.get(i));
					for(int k =0;k<idList.size();k++){
						//包含 ----指向该节点
						if(allCourseList.contains(idList.get(k).getCourseSid())){
							Course pCour = courseDao.getById(idList.get(k).getCourseSid()) ;
							Map<String,String> map = new HashMap<String,String>() ;
							map.put("key",course.getCourseName());
							map.put("parent", pCour.getCourseName());
							map.put("dir", "left");
							map.put("color", "#CDDAF0");
							if(!list.contains(map)){
								list.add(map);
							}
						}
					}
				}else{	
					Map<String, String> map =new HashMap<String, String>() ;
					if(course!=null){
						map.put("key",course.getCourseName());
						map.put("parent", positionNameS);
						map.put("dir", "left");                  
						map.put("color", "#CDDAF0");
						if(!list.contains(map)){
							list.add(map);
						}
					}
				}
			}
		}
		return list;
	}
	@Override
	public HTMLInfo getRecInfo(String userId, String relationId) {
		// TODO Auto-generated method stub
		//获取用户id以判断是否已经对课程选择，判断条件用户与对应的课程的成绩中是否有数据
		String unChoosedStr="";
		String positionNameS = "" ;
		ResultInfo resultInfo = new ResultInfo();
		resultInfo.setRiUserId(userId);
		List<ResultInfo> inList = resultInfoDao.getChoosedCourse(resultInfo);;
		List<String> choosedList = new ArrayList<String>() ;
		if(inList.size()>0){
			for(ResultInfo r:inList){
				if(!choosedList.contains(r.getCourseId())){
					choosedList.add(r.getCourseId());
				}
			}
		}
		Relation relation = new Relation() ;
		relation.setRelationId(relationId);
		//所有的
        List<String> allCourseList = getAllNeedCourse(relation) ;
		List<String> choosedCourseList = new ArrayList<String>(choosedList);
		List<Map<String,String>> list = new ArrayList<Map<String,String>>() ;
		for(String s:allCourseList){
			Course course = courseDao.getById(s);
			if(course!=null){
				Map<String,String> map = new HashMap<String,String>();
				map.put("id", s);
				map.put("name", course.getCourseName());
				list.add(map);
			}
		}
		String allCourse="";
		String choosed ="";
		String unChoosed ="" ;
		if(choosedCourseList.size()>0){
			Queue<String> queue = new LinkedList<String>();
			for(String id :choosedCourseList){
				queue.offer(id);
			}
			//获得已选以及已选的依赖课程
			List<String> allChoosedList = getList(choosedCourseList,queue);
			for(Map<String,String> inMap: list){
				if(allChoosedList.contains(inMap.get("id"))){
					if("".equals(choosed)){
						choosed+=inMap.get("name");
					}else{
						choosed+=","+inMap.get("name");
					}
				}else{
					if("".equals(unChoosed)){
						unChoosed+=inMap.get("name");
						unChoosedStr+=inMap.get("id");
					}else{
						unChoosed+=","+inMap.get("name");
						unChoosedStr+=","+inMap.get("id");
					}
				}
				if("".equals(allCourse)){
					allCourse+=inMap.get("name");
				}else{
					allCourse+=","+inMap.get("name");
				}
			}
		}
		HTMLInfo htmlInfo = new HTMLInfo() ;
		htmlInfo.setAllCourse(allCourse);
		htmlInfo.setChoosed(choosed);
		htmlInfo.setUnChoosed(unChoosed);
		htmlInfo.setPositionName(positionNameS);
		return htmlInfo;
	}
}
