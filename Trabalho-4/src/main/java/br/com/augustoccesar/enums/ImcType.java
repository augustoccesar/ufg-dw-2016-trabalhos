package br.com.augustoccesar.enums;

/**
 * Created by augustoccesar on 6/15/16.
 */
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
