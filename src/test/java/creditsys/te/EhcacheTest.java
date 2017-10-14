package creditsys.te;

import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class EhcacheTest {
	 public static void main(String[] args) {
         Resource res = new ClassPathResource("/config/application.xml");
         BeanFactory factory = new XmlBeanFactory(res);

         CacheManager cacheManager = (CacheManager) factory.getBean("ehCacheManager");
         Cache levelOneCache = cacheManager.getCache("myCache");
         for (int i = 0; i < 10; i++) {
             Element element = levelOneCache.get("key");
             if (element == null) {
                 element = new Element("key", "我是刚刚放进去的缓存！！！");
                 levelOneCache.put(element);
                 System.out.println("cacheObject["+ "]" + ",无法从缓存中取到");
             } else {
                 String cacheObject = (String) element.getValue();
                 System.out.println("cacheObject[" + cacheObject + "]" + ",从缓存中取到");
             }
         }
     }
}
