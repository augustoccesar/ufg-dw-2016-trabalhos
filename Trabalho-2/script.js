$(document).ready(function() {
    // Componets initialization

    $(".dropdown").dropdown();
    $("#height").mask("0,00");

    // Helpers

    var IMC_TYPE = {
        BAIXO_MUITO_GRAVE: "Baixo peso muito grave",
        BAIXO_GRAVE: "Baixo peso grave",
        BAIXO: "Baixo peso",
        NORMAL: "Peso normal",
        SOBREPESO: "Sobrepeso",
        OBESIDADE_I: "Obesidade grau 1",
        OBESIDADE_II: "Obesidade grau 2",
        OBESIDADE_III: "Obesidade grau 3"
    }

    // Methods declaration

    function calculateResult() {
        var height = $("#height").val().replace(",", ".");
        var weight = $("#weight").val();

        if(height && weight){
            result = weight / (height * height);
            checkResult(result);
        }else{
            alert("Preencha todos os campos.");
        }
    }

    function checkResult(result) {
        resultMessage = $("#resultMessage");

        resultMessage.removeClass('hide').addClass('show');
        if(result < 16){
            resultMessage.removeClass('negative warning positive')
            resultMessage.addClass('negative')
            resultMessage.children('.icon').removeClass('checkmark')
            resultMessage.children('.icon').addClass('warning')
            resultMessage.children('.content').children('.header').html(IMC_TYPE.BAIXO_MUITO_GRAVE)
            return IMC_TYPE.BAIXO_MUITO_GRAVE;
        }else if(result >= 16 && result <= 16.99){
            resultMessage.removeClass('negative warning positive')
            resultMessage.addClass('negative')
            resultMessage.children('.icon').removeClass('checkmark')
            resultMessage.children('.icon').addClass('warning')
            resultMessage.children('.content').children('.header').html(IMC_TYPE.BAIXO_GRAVE)
            return IMC_TYPE.BAIXO_GRAVE;
        }else if(result >= 17 && result <= 18.49){
            resultMessage.removeClass('negative warning positive')
            resultMessage.addClass('warning')
            resultMessage.children('.icon').removeClass('checkmark')
            resultMessage.children('.icon').addClass('warning')
            resultMessage.children('.content').children('.header').html(IMC_TYPE.BAIXO)
            return IMC_TYPE.BAIXO;
        }else if(result >= 18.50 && result <= 24.99){
            resultMessage.removeClass('negative warning positive')
            resultMessage.addClass('positive')
            resultMessage.children('.icon').removeClass('warning')
            resultMessage.children('.icon').addClass('checkmark')
            resultMessage.children('.content').children('.header').html(IMC_TYPE.NORMAL)
            return IMC_TYPE.NORMAL;
        }else if(result >= 25 && result <= 29.99){
            resultMessage.removeClass('negative warning positive')
            resultMessage.addClass('warning')
            resultMessage.children('.icon').removeClass('checkmark')
            resultMessage.children('.icon').addClass('warning')
            resultMessage.children('.content').children('.header').html(IMC_TYPE.SOBREPESO)
            return IMC_TYPE.SOBREPESO;
        }else if(result >= 30 && result <= 34.99){
            resultMessage.removeClass('negative warning positive')
            resultMessage.addClass('negative')
            resultMessage.children('.icon').removeClass('checkmark')
            resultMessage.children('.icon').addClass('warning')
            resultMessage.children('.content').children('.header').html(IMC_TYPE.OBESIDADE_I)
            return IMC_TYPE.OBESIDADE_I;
        }else if(result >= 35 && result <= 39.99){
            resultMessage.removeClass('negative warning positive')
            resultMessage.addClass('negative')
            resultMessage.children('.icon').removeClass('checkmark')
            resultMessage.children('.icon').addClass('warning')
            resultMessage.children('.content').children('.header').html(IMC_TYPE.OBESIDADE_II)
            return IMC_TYPE.OBESIDADE_II;
        }else if(result >= 40){
            resultMessage.removeClass('negative warning positive')
            resultMessage.addClass('negative')
            resultMessage.children('.icon').removeClass('checkmark')
            resultMessage.children('.icon').addClass('warning')
            resultMessage.children('.content').children('.header').html(IMC_TYPE.OBESIDADE_III)
            return IMC_TYPE.OBESIDADE_III;
        }
    }

    // Assigning actions

    $("#resultButton").on("click", calculateResult);
});
