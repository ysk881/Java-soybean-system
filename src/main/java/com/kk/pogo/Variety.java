package com.kk.pogo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Variety {
    public Integer id;
    public String name;
    public String source;
    public String yield;
    public String month;
    public String rate;
    public String protect;
    public String area;
    public String illness;
    public String image;
    public Phytology phytology;
    public Biology biology;
    public Quality quality;
}
