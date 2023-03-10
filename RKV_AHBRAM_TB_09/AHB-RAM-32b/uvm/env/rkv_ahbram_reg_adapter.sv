`ifndef RKV_AHBRAM_REG_ADAPTER_SV 
`define RKV_AHBRAM_REG_ADAPTER_SV 

class rkv_ahbram_reg_adapter extends uvm_reg_adapter;
  `uvm_object_utils(rkv_ahbram_reg_adapter)
  function new(string name = "rkv_ahbram_reg_adapter");
    super.new(name);
    provides_responses = 1;
  endfunction
  function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);
    
  endfunction
  function void bus2reg(uvm_sequence_item bus_item, ref uvm_reg_bus_op rw);
    
  endfunction
endclass

`endif // RKV_AHBRAM_REG_ADAPTER_SV 
