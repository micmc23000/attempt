/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.micmc23000.attempt2;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import com.micmc23000.attempt2.Items;
import org.springframework.stereotype.Service;
/**
 *
 * @author Michael
 */
   
   @Service
public class ItemsService {

    static List<Items> itemsList = new ArrayList();

    static {
        itemsList.add(new Items("XG809", "Contemporary Office Desk", "Concentrating on the job is a lot easier when everyone has a place that’s comfortable to work at.", 25.00, 69.00, 18));
        itemsList.add(new Items("BG565", "Bed Frame With Storage", "With the comfort and quality you get from our sturdy single beds, you’ll wake up refreshed and ready to roll. ", 139.00, 175.00, 5));
        itemsList.add(new Items("PO262", "TV Stand", "Our TV stands and TV cabinets are there to cut the clutter and get things organised.", 69.99, 89.99, 120));
        itemsList.add(new Items("MC342", "Kitchen Unit", "They make the most of your wall by giving you extra storage, and the right kitchen shelf can boost the style of your decor too", 23.00, 65.99, 89));
        itemsList.add(new Items("WS341", "Folding Chair", "You can fold the chair, so it takes less space when you're not using it.", 12.00, 35.99, 30));
        itemsList.add(new Items("TF875", "Berkant Kitchen", "Express yourself in the place where all of life’s daily activities take place.in our stylish, yet personalised kitchen..", 8900.00, 12200.99, 4));

    }

    public List<Items> getAllItems() {
        return itemsList;
    }// end getAllItemss

    
    public boolean addAnItem(Items p) {
        return itemsList.add(p);
    }
    
    public void deleteAnItem(String code) {
        
        Iterator<Items> iterator = itemsList.iterator();
        while (iterator.hasNext()) {
            Items product = iterator.next();
            if (product.getCode().equalsIgnoreCase(code)) {
                iterator.remove();
            }
        }
        
        
        
    }//end deleteAItems

}//end class ItemsService
    
