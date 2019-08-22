package com.ycy.shopping.service;

import com.ycy.shopping.BaseTest;
import com.ycy.shopping.dto.ShopExecution;
import com.ycy.shopping.entity.Shop;
import com.ycy.shopping.entity.ShopCategory;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @program: shopping
 * @description:
 * @author: ChangYue
 * @create: 2019-03-17 19:25
 */

public class ShopServiceTest extends BaseTest {

    @Autowired
    private ShopService shopService;


    @Test
    public void testGetShopList() {
        Shop shop = new Shop();
        ShopCategory shopCategory = new ShopCategory();
        shopCategory.setShopCategoryId(1L);
        shop.setShopCategory(shopCategory);
        ShopExecution shopList = shopService.getShopList(shop, 1, 2);

        System.out.println(shopList.getShopList().size());
        System.out.println(shopList.getCount());


    }

 /*   @Test
    public void modify() throws FileNotFoundException {
        Shop shop = new Shop();
        shop.setShopId(1L);
        shop.setShopName("modify shop");
        File file = new File("C:/Users/Administrator/Desktop/xing.png");
        InputStream inputStream = new FileInputStream(file);
        ShopExecution shopExecution = shopService.modifyShop(shop, inputStream, "xing.png");
        System.out.println(shopExecution.getShop().getShopImg());
    }

    @Test
    public void testAddShop() throws FileNotFoundException {
        Shop shop = new Shop();
        PersonInfo personInfo = new PersonInfo();
        Area area = new Area();
        ShopCategory shopCategory = new ShopCategory();

        personInfo.setUserId(1L);
        area.setAreaId(2);
        shopCategory.setShopCategoryId(1L);

        shop.setArea(area);
        shop.setShopCategory(shopCategory);
        shop.setOwner(personInfo);

        shop.setShopName("测试332");
        shop.setShopAddr("test");
        shop.setShopDesc("test");
        shop.setPhone("123123123");
        shop.setCreateTime(new Date());
        shop.setLastEditTime(null);
        shop.setEnableStatus(ShopStateEnum.CHECK.getState());
        shop.setAdvice("审核中");

        File file = new File("D:\\wallpaper\\samuel.jpg");
        FileInputStream fileInputStream = new FileInputStream(file);
        ShopExecution shopExecution = shopService.addShop(shop, fileInputStream, file.getName());
        Assert.assertEquals(ShopStateEnum.CHECK.getState(), shopExecution.getState());
    }*/


}
