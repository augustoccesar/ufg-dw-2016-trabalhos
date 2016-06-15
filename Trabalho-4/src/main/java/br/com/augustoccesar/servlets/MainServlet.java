package br.com.augustoccesar.servlets;

import br.com.augustoccesar.enums.ImcType;
import br.com.augustoccesar.utils.ImcTypeUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by augustoccesar on 6/15/16.
 */
public class MainServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("height") != null && request.getParameter("weight") != null) {
            Float height = Float.parseFloat(request.getParameter("height").replace(",", "."));
            Float weight = Float.parseFloat(request.getParameter("weight"));

            ImcType imcType = ImcTypeUtil.calculateResult(height, weight);
            request.setAttribute("imcTypeText", imcType.text);
        }
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
