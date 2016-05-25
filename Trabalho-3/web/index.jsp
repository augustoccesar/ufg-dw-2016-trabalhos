<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  User: augustoccesar
  Date: 5/16/16
  Time: 09:55
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    if(request.getParameter("height") != null && request.getParameter("weight") != null) {
        Float height = Float.parseFloat(request.getParameter("height").replace(",", "."));
        Float weight = Float.parseFloat(request.getParameter("weight"));

        ImcType imcType = calculateResult(height, weight);
        request.setAttribute("imcTypeText", imcType.text);
    }
%>

<%!
    public enum ImcType {
        BAIXO_MUITO_GRAVE("Baixo peso muito grave."),
        BAIXO_GRAVE("Baixo peso grave."),
        BAIXO("Baixo peso."),
        NORMAL("Peso normal."),
        SOBREPESO("Sobrepeso."),
        OBESIDADE_I("Obesidade grau 1."),
        OBESIDADE_II("Obesidade grau 2."),
        OBESIDADE_III("Obesidade grau 3.");

        public String text;
        ImcType(String text){
            this.text = text;
        }
    }

    public ImcType checkResult(float result){
        if(result < 16){
            return ImcType.BAIXO_MUITO_GRAVE;
        }else if(result >= 16 && result <= 16.99){
            return ImcType.BAIXO_GRAVE;
        }else if(result >= 17 && result <= 18.49){
            return ImcType.BAIXO;
        }else if(result >= 18.50 && result <= 24.99){
            return ImcType.NORMAL;
        }else if(result >= 25 && result <= 29.99){
            return ImcType.SOBREPESO;
        }else if(result >= 30 && result <= 34.99){
            return ImcType.OBESIDADE_I;
        }else if(result >= 35 && result <= 39.99){
            return ImcType.OBESIDADE_II;
        }else if(result >= 40){
            return ImcType.OBESIDADE_III;
        }else{
            return null;
        }
    }

    public ImcType calculateResult(float height, float weight) {
        float result = weight / (height * height);
        return checkResult(result);
    }
%>

<html>
<head>
    <meta charset="utf-8">
    <title>IMC</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.min.css" rel="stylesheet">

    <script src="https://code.jquery.com/jquery-2.2.3.min.js" integrity="sha256-a23g1Nt4dtEYOj7bR+vTu7+T8VP13humZFBJNIYoEJo=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.0/jquery.mask.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.min.js"></script>

    <script>
        $(document).ready(function() {
            $(".dropdown").dropdown();
            $("#height").mask("0,00")
        })
    </script>
</head>
<body>
    <div class="ui grid">
        <div class="five wide column"></div>
        <div class="six wide column small-margin-top">
            <div class="ui segment">
                <div class="content">
                    <h2>IMC</h2>
                    <form class="ui form">
                        <div class="field">
                            <label>Peso: </label>
                            <div class="ui right labeled input">
                                <input id="weight" name="weight" type="text">
                                <div class="ui basic label">Kg</div>
                            </div>
                        </div>
                        <div class="field">
                            <label>Altura: </label>
                            <div class="ui right labeled input">
                                <input id="height" name="height" type="text">
                                <div class="ui basic label">m</div>
                            </div>
                        </div>
                        <div class="field">
                            <label>Sexo: </label>
                            <div class="ui selection dropdown">
                                <input type="hidden" name="gender">
                                <i class="dropdown icon"></i>
                                <div class="default text">Sexo</div>
                                <div class="menu">
                                    <div class="item" data-value="1">Masculino</div>
                                    <div class="item" data-value="0">Feminino</div>
                                </div>
                            </div>
                        </div>
                        <button id="resultButton" class="ui blue button" type="submit">Resultado</button>
                    </form>
                </div>
            </div>

            <c:if test="${imcTypeText != null}">
                <div id="resultMessage" class="ui icon message hide">
                    <i class="icon"></i>
                    <div class="content">
                        <div class="header">
                            <c:out value="${imcTypeText}"></c:out>
                        </div>
                    </div>
                </div>
            </c:if>
        </div>
    </div>
</body>
</html>
