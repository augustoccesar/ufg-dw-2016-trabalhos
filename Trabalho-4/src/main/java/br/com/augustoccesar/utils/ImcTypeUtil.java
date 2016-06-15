package br.com.augustoccesar.utils;

import br.com.augustoccesar.enums.ImcType;

/**
 * Created by augustoccesar on 6/15/16.
 */
public class ImcTypeUtil {
    public static ImcType checkResult(float result){
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

    public static ImcType calculateResult(float height, float weight) {
        float result = weight / (height * height);
        return checkResult(result);
    }
}
