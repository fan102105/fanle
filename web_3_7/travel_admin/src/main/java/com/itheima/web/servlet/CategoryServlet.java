package com.itheima.web.servlet;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.itheima.entity.Category;
import com.itheima.entity.Route;
import com.itheima.service.ICategoryService;
import com.itheima.service.impl.CategoryServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/category/*")
public class CategoryServlet extends BaseServlet {
    protected void findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ICategoryService categoryService = new CategoryServiceImpl();
        List<Category> categories = categoryService.findAll();
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        ObjectMapper mapper = new ObjectMapper();
        String s = mapper.writeValueAsString(categories);
        out.write(s);

    }


}
