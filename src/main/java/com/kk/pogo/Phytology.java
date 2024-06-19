package com.kk.pogo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Phytology {
    public Integer  agid;
    public String name;
    public String  flower;
    public String  leaf;
    public String seed;
    public String testa;
    public String hilum;
    public String fuzz;
    public String contyledon;
}
