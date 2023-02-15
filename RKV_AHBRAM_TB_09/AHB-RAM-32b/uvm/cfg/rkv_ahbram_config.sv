`ifndef RKV_AHBRAM_CONFIG_SV
`define RKV_AHBRAM_CONFIG_SV

class rkv_ahbram_config extends uvm_object;

  int seq_check_count;
  int seq_check_error;

  int scb_check_count;
  int scb_check_error;

  bit enable_cov = 1;
  bit enable_scb = 1;

  bit [31:0] addr_start;
  bit [31:0] addr_end;
  int data_width;
  // memory reset content {0, X}
  logic init_logic = 1'bx;

  lvc_ahb_agent_configuration ahb_cfg;
  virtual rkv_ahbram_if vif;
  rkv_ahbram_rgm rgm;

  `uvm_object_utils(rkv_ahbram_config)

  // USER to specify the config items
  
  function new (string name = "rkv_ahbram_config");
    super.new(name);
    ahb_cfg = lvc_ahb_agent_configuration::type_id::create("ahb_cfg");
  endfunction : new

endclass

`endif // RKV_AHBRAM_CONFIG_SV
