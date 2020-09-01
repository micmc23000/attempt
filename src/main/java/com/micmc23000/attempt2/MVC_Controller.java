/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.micmc23000.attempt2;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Michael
 */
@Controller
@RequestMapping("login")
@SessionAttributes("login")
public class MVC_Controller {

    @Autowired
    ItemsService service;

    @RequestMapping(value = "")
    public String showProducts(HttpSession sess) {
        sess.setAttribute("name", this.getLoggedInUserName());
        return "/allItems";
    }
    
    @GetMapping("/allItems")
    public ModelAndView getProducts(HttpSession sess)
    {
        sess.setAttribute("name", this.getLoggedInUserName());
        return new ModelAndView("/allItemsPage","itemsList", service.getAllItems());
    }

    @RequestMapping(value = "/allItems")
    public ModelAndView getAllProducts(HttpSession sess, ModelMap model, @Valid Items todo, BindingResult result) {

        if (result.hasErrors()) {
            return new ModelAndView("redirect:/");
        }
        
        sess.setAttribute("name", this.getLoggedInUserName());
        
        return new ModelAndView("/allItems","itemList",service.getAllItems());
    }
    
    @GetMapping(value = "/addItems")
    public ModelAndView getAddItems(HttpSession sess, ModelMap model, @Valid Items todo, BindingResult result) {

        if (result.hasErrors()) {
            return new ModelAndView("redirect:/");
        }
        
        sess.setAttribute("name", this.getLoggedInUserName());
        
        return new ModelAndView("/addItemss","itemsList",service.addAnItem(todo));
    }
    
    @PostMapping(value = "/addItems")
    public ModelAndView postAddProducts(HttpSession sess, ModelMap model, @Valid Items todo, BindingResult result) {

        if (result.hasErrors()) {
            return new ModelAndView("redirect:/login/allItems");
        }
        
        sess.setAttribute("name", this.getLoggedInUserName());
        
        return new ModelAndView("redirect:/login/allItmess");
    }
    
    @GetMapping(value = "/deleteItem/{id}")
    public ModelAndView getDeleteItem(@Valid @ModelAttribute("code") Items id, HttpSession sess, ModelMap model, @Valid Items todo, BindingResult result) {

        if (result.hasErrors()) {
            return new ModelAndView("redirect:/");
        }
        
        sess.setAttribute("name", this.getLoggedInUserName());
        
        return new ModelAndView("/deleteProducts","itemsList",service.addAnItem(todo));
    }
    
    @PostMapping(value = "/deleteProducts/{id}")
    public ModelAndView postDeleteProduct(@Valid @ModelAttribute("code") Items id,HttpSession sess, ModelMap model, @Valid Items todo, BindingResult result) {

        if (result.hasErrors()) {
            return new ModelAndView("redirect:/login/allItems");
        }
        
        sess.setAttribute("name", this.getLoggedInUserName());
        
        return new ModelAndView("redirect:/login/allItems");
    }

    private String getLoggedInUserName() {
        Object principal = SecurityContextHolder.getContext()
                .getAuthentication().getPrincipal();

        if (principal instanceof UserDetails) {
            return ((UserDetails) principal).getUsername();
        }

        return principal.toString();
    }
}
