<%--
  User: augustoccesar
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>IMC</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.min.css" rel="stylesheet">

    <script src="https://code.jquery.com/jquery-2.2.3.min.js" integrity="sha256-a23g1Nt4dtEYOj7bR+vTu7+T8VP13humZFBJNIYoEJo=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.0/jquery.mask.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.min.js"></script>

    <style>
        .hide {
            display: none !important;
        }
    </style>

    <script>
        $(document).ready(function() {
            $(".dropdown").dropdown();
            $("#height").mask("0,00");

            var imcTypeText = "<%=request.getAttribute("imcTypeText")%>";
            console.log(imcTypeText.length)
            if(imcTypeText != null && imcTypeText != '' && imcTypeText != 'null'){
                $("#resultMessage").removeClass("hide");
                $("#resultMessageContent").html(imcTypeText);
            }
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
                <form action="/imc" method="POST" class="ui form">
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

        <div id="resultMessage" class="ui icon message hide">
            <i class="icon"></i>
            <div class="content">
                <div id="resultMessageContent" class="header">
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
