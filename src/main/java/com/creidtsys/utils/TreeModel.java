package com.creidtsys.utils;

import java.util.ArrayList;
import java.util.List;

/**
 * 
* @ClassName: TreeModel
* @Description: TODO(这里用一句话描述这个类的作用)
* @author liuyj
* @date 2017年9月9日 上午8:42:14
*
 */
public class TreeModel {  
  
    private String id;  
    private String text;// 名称  
    private String iconCls;// 图标  
    private String linkUrl;// 链接地址  
      
    private List<TreeModel> children;// 孩子节点集合  
  
    public TreeModel() {  
        this.children = new ArrayList<TreeModel>();  
    }  
  
    public String getId() {  
        return id;  
    }  
  
    public void setId(String id) {  
        this.id = id;  
    }  
  
    public String getText() {  
        return text;  
    }  
  
    public void setText(String text) {  
        this.text = text;  
    }  
  
    public String getLinkUrl() {  
        return linkUrl;  
    }  
  
    public void setLinkUrl(String linkUrl) {  
        this.linkUrl = linkUrl;  
    }  
  
    public String getIconCls() {  
        return iconCls;  
    }  
  
    public void setIconCls(String iconCls) {  
        this.iconCls = iconCls;  
    }  
  
    public List<TreeModel> getChildren() {  
        return children;  
    }  
  
    public void setChildren(List<TreeModel> children) {  
        this.children = children;  
    }  
      
}  