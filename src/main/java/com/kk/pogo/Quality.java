package com.kk.pogo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Quality {
    public Integer  agid;
    public String name;
    public String  grain;
    public String  grease;
    public String fat;
    public String protein;
    public String lipid;
    public String salt;
    public String alkali;
    public String cystine;
    public String methionine;
    public String hard;
    public String soft;
    public String oil;
    public Variety variety;

}
