package com.creidtsys.apps.courseManage.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Queue;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.creidtsys.apps.auth.entity.User;
import com.creidtsys.apps.auth.service.UserService;
import com.creidtsys.apps.courseManage.entity.Course;
import com.creidtsys.apps.courseManage.entity.CourseDepend;
import com.creidtsys.apps.courseManage.entity.CourseRelation;
import com.creidtsys.apps.courseManage.entity.HTMLInfo;
import com.creidtsys.apps.courseManage.entity.PlanRelation;
import com.creidtsys.apps.courseManage.entity.ReCondition;
import com.creidtsys.apps.courseManage.service.CourseDependService;
import com.creidtsys.apps.courseManage.service.CourseRelationService;
import com.creidtsys.apps.courseManage.service.CourseService;
import com.creidtsys.apps.courseManage.service.MajorService;
import com.creidtsys.apps.courseManage.service.PlanRelationService;
import com.creidtsys.apps.manage.entity.Relation;
import com.creidtsys.apps.manage.entity.ResultInfo;
import com.creidtsys.apps.manage.service.RelationService;
import com.creidtsys.apps.manage.service.ResultInfoService;
import com.creidtsys.utils.JsonMessage;
import com.creidtsys.utils.UtilTools;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/recommendCourse") 
public class RecommendCourseController {
	@Resource
	private RelationService relationService ;
	@Resource
	private CourseRelationService courseRelationService ;
	@Resource
	private CourseDependService courseDependService ;
	@Resource
	private ResultInfoService resultInfoService ;
	@Resource
	private CourseService courseService ;
	@Resource
	private UserService userService;
	@Resource
	private PlanRelationService planRelationService ;
	@Resource
	private MajorService majorService ;
	private static ObjectMapper mapper = new ObjectMapper();
	private List<String> needList ;
	private String unChoosedStr = "";
	private List<String> allCourseList =null ;
	private List<String> choosedCourseList =null ;
	private String positionNameS = null ;
	private final String CHOOSEINDEX="courseManager/recommendCourse/recommendIndex";
	private final String LISTTREE ="courseManager/recommendCourse/listTree" ;
	private final String INDEX ="/auth/echarsJsp/index";
	private final String PLAN="courseManager/recommendCourse/recommeddByplan";
	@RequestMapping("/toPlan")
	private String toPlan(){
		return PLAN ;
	}
	@RequestMapping("/getIndex")
	public String getIndex(){
		return INDEX ;
	}
	@RequestMapping("/chooseIndex")
	private String choose(){
		return CHOOSEINDEX ;
	}
	@RequestMapping("/listTree")
	private String toList(){
		return LISTTREE ;
	}
	@RequestMapping(value="/getAllPoint",method=RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	private List<Map<String,String>>  allCourse(String relationId){
		
		List<Relation> list = relationService.getAllPoint(relationId);
		List<String> sIdList = new ArrayList<String>();
		Relation relation = relationService.getPosition(relationId);
		String positionName = relation.getRelationRes();
		for(int i=0;i<list.size();i++ ){
			String pointId = list.get(i).getOtherId();
			List<CourseRelation> reList =  courseRelationService.getCourse(pointId); 
			for(int j=0;j<reList.size();j++){
				String sId = reList.get(j).getSrOtherId();
				if(!sIdList.contains(sId)){
					sIdList.add(sId);
				}
			}
		}				
		List<String> newIdParamList = new ArrayList<String>(sIdList) ;
		Queue<String> queue = new LinkedList<String>();
		for(String id :newIdParamList){
			queue.offer(id);
		}
		//获取没个课程的id
		List<String> finalList= getList(newIdParamList,queue);
		
		allCourseList = new ArrayList<String>(finalList);
		
		positionNameS=positionName ;

		List<String> pdRootList = new ArrayList<String>() ;
		List<String> pIdList = new ArrayList<String>();
		for(String s :finalList){
			List<CourseDepend> p = courseDependService.getBySid(s);
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
			List<CourseDepend> tl =  courseDependService.getByPsid(m.get("sId"));
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
	//	}
		return testList ;
	}
	//递归查询所有相关课程
	public List<String> getList(List<String> list,Queue<String> queue){
		List<CourseDepend> listde=  courseDependService.getBySid(queue.poll());
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
	
	public List<Map<String,String>> initData(List<String> list){
		List<Map<String,String>> listMap = new ArrayList<Map<String,String>>();
		for(String sId:list){
			List<CourseDepend> listDep = courseDependService.getBySid(sId);
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
	

	@RequestMapping(value="/getHtmlInfo",method=RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public JsonMessage getHtmlInfo(String relationId){
		//获取当前用户
		//UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication() .getPrincipal();
		//获取用户id以判断是否已经对课程选择，判断条件用户与对应的课程的成绩中是否有数据
		String userId = "" ;//userDetails.getPassword() ;
		ResultInfo resultInfo = new ResultInfo();
		resultInfo.setRiUserId(userId);
		List<ResultInfo> inList = resultInfoService.getChoose(resultInfo);;
		List<String> choosedList = new ArrayList<String>() ;
		if(inList.size()>0){
			// -----------
			/*for(ResultInfo r:inList){
				if(!choosedList.contains(r.getCourseId())){
					choosedList.add(r.getCourseId());
				}
			}*/
		}
		choosedCourseList = new ArrayList<String>(choosedList);
		unChoosedStr="";
		List<Map<String,String>> list = new ArrayList<Map<String,String>>() ;
		for(String s:allCourseList){
			Course course = courseService.getById(s);
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
		return new JsonMessage().success(htmlInfo) ;
	}
	@RequestMapping(value="/initChoosed",method=RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	private List<Map<String,String>>  allCourseUnChoosed(){
		//获取当前用户
	//	UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication() .getPrincipal();
		//获取用户id以判断是否已经对课程选择，判断条件用户与对应的课程的成绩中是否有数据
		String userId ="" ;// userDetails.getPassword() ;
		ResultInfo resultInfo = new ResultInfo();
		resultInfo.setRiUserId(userId);
		List<ResultInfo> inList = resultInfoService.getChoose(resultInfo);;
		List<String> choosedList = new ArrayList<String>() ;
		//----
		if(inList.size()>0){
			for(ResultInfo r:inList){
				/*if(!choosedList.contains(r.getCourseId())){
					choosedList.add(r.getCourseId());
				}*/
			}
		}
		choosedCourseList = new ArrayList<String>(choosedList);
		List<String> listPid = new ArrayList<String>();
		for(String s:choosedCourseList){
			for(CourseDepend c:courseDependService.getBySid(s)){
				if(!listPid.contains(c.getCourseSid())){
					listPid.add(c.getCourseSid());
				}
			}
		}
		List<Map<String,String>> list =new ArrayList<Map<String,String>>();
		if(choosedCourseList.size()!=0){
			Map<String, String> root =new HashMap<String, String>() ;
			root.put("key", positionNameS);
			root.put("color", "#EF9EFA") ;
			list.add(root);
			String arr[] = unChoosedStr.split(",");
			needList = new ArrayList<String>();
			for(String s:arr){
				needList.add(s);
			}
			for(int i=0;i<needList.size();i++){
				List<CourseDepend> lll = courseDependService.getByPsid(needList.get(i));
				Course course= courseService.getById(needList.get(i));
				if(lll.size()==0){
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
				}else{
					//一x为pid的存在，但是不在needList中
					for(int j=0;j<lll.size();j++){	
						Map<String, String> maps =new HashMap<String, String>() ;
						if(needList.contains(lll.get(0).getCourseSid())){
							Course pCourse = courseService.getById(lll.get(j).getCourseSid());
							maps.put("key",course.getCourseName());
							maps.put("parent", pCourse.getCourseName());
							maps.put("dir", "left");
							maps.put("color", "#CDDAF0");
							if(!list.contains(maps)){
								list.add(maps);
							}
						}else {
							maps.put("key",course.getCourseName());
							maps.put("parent", positionNameS);
							maps.put("dir", "left");
							maps.put("color", "#CDDAF0");
							if(!list.contains(maps)){
								list.add(maps);
							}
						}
					}
				}
			}
		}
		return list;
	}
	@RequestMapping(value="/reByPlan" )
    @ResponseBody
	public Map<String,Object> getData(String data) throws Exception{	
		ReCondition re= mapper.readValue(data, new TypeReference<ReCondition>() { 
		 });
		String id = re.getId();
		String relationId = re.getRelationId();
		List<Relation> list_ = relationService.getAllPoint(relationId);
		//职位需要的课程 sIdList
		List<String> sIdList = new ArrayList<String>();
		for(int i=0;i<list_.size();i++ ){
			String pointId = list_.get(i).getOtherId();
			List<CourseRelation> reList =  courseRelationService.getCourse(pointId); 
			for(int j=0;j<reList.size();j++){
				String sId = reList.get(j).getSrOtherId();
				if(!sIdList.contains(sId)){
					sIdList.add(sId);
				}
			}
		}		
		
		
		//通过用户获取专业id
	//	UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication() .getPrincipal();
		String userId ="";// userDetails.getPassword();
		String majorId = majorService.getidByUserId(userId);
		PlanRelation cond = new PlanRelation();
		cond.setMajorId(majorId);
		cond.setPrId(id);
		List<PlanRelation> list= planRelationService.getAllCourse(cond);
		//专业方式所有课程l
		List<String> l =new ArrayList<String>();
		for(PlanRelation p:list){
			l.add(p.getOtherId());
		}
		List<String> unionList =getUnion(l, sIdList);
		
		
		
		List<Map<String,String>> listTerm = new ArrayList<Map<String,String>>();
		Map<String,String> map1 = new HashMap<String, String>();
		map1.put("term", "大一上学期");
		map1.put("index","1");
		listTerm.add(map1);
		Map<String,String> map2 = new HashMap<String, String>();
		map2.put("term", "大一下学期");
		map2.put("index","2");
		listTerm.add(map2);
		Map<String,String> map3 = new HashMap<String, String>();
		map3.put("term", "大二上学期");
		map3.put("index","3");
		listTerm.add(map3);
		Map<String,String> map4 = new HashMap<String, String>();
		map4.put("term", "大二下学期");
		map4.put("index","4");
		listTerm.add(map4);
		Map<String,String> map5 = new HashMap<String, String>();
		map5.put("term", "大三上学期");
		map5.put("index","5");
		listTerm.add(map5);
		Map<String,String> map6 = new HashMap<String, String>();
		map6.put("term", "大三下学期");
		map6.put("index","6");
		listTerm.add(map6);
		Map<String,String> map7 = new HashMap<String, String>();
		map7.put("term", "大四上学期");
		map7.put("index","7");
		listTerm.add(map7);
		Queue<String> queue = new LinkedList<String>();
		for(String ids :unionList){
			queue.offer(ids);
		}
		//所有课程
		List<String> allVourseList = getList(unionList,queue);
		//根据职位推荐的
		
		//过滤已经选修的
		ResultInfo resultInfo = new ResultInfo();
		resultInfo.setRiUserId(userId);
		List<ResultInfo> inList = resultInfoService.getChoose(resultInfo);;
		
		
		List<String> choosedList = new ArrayList<String>() ;
		List<String> allChoosedList = new ArrayList<String>();
		if(inList.size()>0){
			for(ResultInfo r:inList){
				//----
				/*if(!choosedList.contains(r.getCourseId())){
					choosedList.add(r.getCourseId());
				}*/
			}
			Queue<String> queues = new LinkedList<String>();
			for(String i :choosedList){
				queues.offer(i);
			}
			allChoosedList =  getList(choosedList,queues) ;
		}
		
		//移除已选
		
		if(allChoosedList.size()>0){
			for(String s:allChoosedList){
				if(allVourseList.contains(s)){
					allVourseList.remove(s);
				}
			}
		}
		//Collections.reverse(allVourseList);
	//	User user = userService.getById(userId);
		String date ="" ;// user.getUserIp();
		String currentTerm = getInfo(date);
		int index =0 ;
		for(Map<String,String> cm:listTerm){
			if(currentTerm.equals(cm.get("term"))){
				index = Integer.parseInt(cm.get("index"));
			}
		}
	//	int size =allVourseList.size()%(7-index)==0?allVourseList.size()/(7-index):allVourseList.size()/(7-index)+1;
		int size =allVourseList.size()/(7-index);
		List<List<String>> listSp= createList(allVourseList,size,7-index);
		List<Map<String,String>> listdata = new ArrayList<Map<String,String>>();
		int c =0;
		for(int m = index;m<listTerm.size();m++){
			Map<String,String> tmao = new HashMap<String, String>();
			String text = listTerm.get(m).get("term");
			String tid = UtilTools.getNum19();
			for(int k = 0;k<listSp.get(c).size();k++){
				Course course = courseService.getById(listSp.get(c).get(k));
				if(course!=null){
					String name =course.getCourseName();
					Map<String,String> cmao = new HashMap<String, String>();
					cmao.put("id",listSp.get(c).get(k));
					cmao.put("text",name);
					cmao.put("pid",tid);
					listdata.add(cmao);
				}
			}
			tmao.put("id",tid);
			tmao.put("pid","0");
			tmao.put("text",text);
			listdata.add(tmao);
			c++;
		}
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("total", listdata.size());
		map.put("rows", listdata);
		return map;
	}
	
	private String getInfo(String date){
		int year = Integer.parseInt(date.split("\\.")[0]);
		int month = Integer.parseInt(date.split("\\.")[1]);		
		Calendar calendar = Calendar.getInstance();
		int cyera = calendar.get(Calendar.YEAR);
		int cmonth = calendar.get(calendar.MONTH)+1;
		int cxy = cyera-year;
		int xxm = cmonth - month;
		String TeamYear = "";
		String terM ="";	
		if(xxm<=0){
			terM="下学期";
			if(cxy==1){
				TeamYear = "大一";
			}else if(cxy==2){
				TeamYear = "大二";
			}else if(cxy==3){
				TeamYear = "大三";
			}else if(cxy==5){
				TeamYear = "大四";
			}
			
		}else{
			terM="上学期";
			if(cxy==1){
				TeamYear = "大一";
			}else if(cxy==2){
				TeamYear = "大二";
			}else if(cxy==3){
				TeamYear = "大三";
			}else if(cxy==4){
				TeamYear = "大四";
			}
		}
		System.out.println(TeamYear+terM );
		return TeamYear+terM ;
	}
	//等分list
	public static List<List<String>>  createList(List<String> targe,int size,int arrSize) {  
        List<List<String>> listArr = new ArrayList<List<String>>();  
        //获取被拆分的数组个数  
        //int arrSize = targe.size()%size==0?targe.size()/size:targe.size()/size+1;  
        for(int i=0;i<arrSize;i++) {  
            List<String>  sub = new ArrayList<String>();  
            //把指定索引数据放入到list中  
            for(int j=i*size;j<=size*(i+1)-1;j++) {  
                if(j<=targe.size()-1) {  
                    sub.add(targe.get(j));  
                }  
            }  
            listArr.add(sub);  
        }  
        return listArr;  
    }  
	 public static <T> List<List<T>> subList(List<T> list, int num) {  
		 	int blockSize = list.size()/num;
	        List<List<T>> lists = new ArrayList<List<T>>();  
	        if (list != null && blockSize > 0) {  
	            int listSize = list.size();  
	            if(listSize<=blockSize){  
	                lists.add(list);  
	                return lists;  
	            }  
	            int batchSize = listSize / blockSize;  
	            int remain = listSize % blockSize;  
	            for (int i = 0; i < batchSize; i++) {  
	                int fromIndex = i * blockSize;  
	                int toIndex = fromIndex + blockSize;  
	                System.out.println("fromIndex=" + fromIndex + ", toIndex=" + toIndex);  
	                lists.add(list.subList(fromIndex, toIndex));  
	            }  
	            if(remain>0){  
	                System.out.println("fromIndex=" + (listSize-remain) + ", toIndex=" + (listSize));  
	                lists.add(list.subList(listSize-remain, listSize));  
	            }  
	        }  
	        return lists;  
	    }  
	 
	 public List<String> getUnion(List<String> l1, List<String>l2){
			l1.addAll(l2);
			List<String>  list_c=new ArrayList<String>();  
			Set<String> set=new HashSet<String>();  
			for (int i = 0; i < l1.size(); i++) {  
				String str=l1.get(i);  
				set.add(str);             
			}  
			//把set集合遍历添加在list中  
			for (Iterator<String> it = set.iterator(); it.hasNext();){  
				list_c.add(it.next());  
			}  
			return list_c;
			}
}

