
`ifndef RKV_AHBRAM_ENV_SV
`define RKV_AHBRAM_ENV_SV

class rkv_ahbram_env extends uvm_env;

  lvc_ahb_master_agent ahb_mst;
  rkv_ahbram_config cfg;
  rkv_ahbram_virtual_sequencer virt_sqr;
  rkv_ahbram_rgm rgm;
  rkv_ahbram_reg_adapter adapter;
  uvm_reg_predictor #(lvc_ahb_transaction) predictor;
  rkv_ahbram_cov cov;
  rkv_ahbram_scoreboard scb;

  `uvm_component_utils(rkv_ahbram_env)

  function new (string name = "rkv_ahbram_env", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    // Get configuration from test layer
    if(!uvm_config_db#(rkv_ahbram_config)::get(this,"","cfg", cfg)) begin
      `uvm_fatal("GETCFG","cannot get config object from config DB")
    end
    uvm_config_db#(rkv_ahbram_config)::set(this, "virt_sqr", "cfg", cfg);
    uvm_config_db#(rkv_ahbram_config)::set(this, "cov", "cfg", cfg);
    uvm_config_db#(rkv_ahbram_config)::set(this, "scb", "cfg", cfg);
    uvm_config_db#(lvc_ahb_agent_configuration)::set(this, "ahb_mst", "cfg", cfg.ahb_cfg);
    ahb_mst = lvc_ahb_master_agent::type_id::create("ahb_mst", this);
    virt_sqr = rkv_ahbram_virtual_sequencer::type_id::create("virt_sqr", this);
    if(!uvm_config_db#(rkv_ahbram_rgm)::get(this,"","rgm", rgm)) begin
      rgm = rkv_ahbram_rgm::type_id::create("rgm", this);
      rgm.build();
    end
    uvm_config_db#(rkv_ahbram_rgm)::set(this,"*","rgm", rgm);
    adapter = rkv_ahbram_reg_adapter::type_id::create("adapter", this);
    predictor = uvm_reg_predictor#(lvc_ahb_transaction)::type_id::create("predictor", this);
    cov = rkv_ahbram_cov::type_id::create("cov", this);
    scb = rkv_ahbram_scoreboard::type_id::create("scb", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    virt_sqr.ahb_mst_sqr = ahb_mst.sequencer;
    rgm.map.set_sequencer(ahb_mst.sequencer, adapter);
    ahb_mst.monitor.item_observed_port.connect(predictor.bus_in);
    predictor.map = rgm.map;
    predictor.adapter = adapter;
    ahb_mst.monitor.item_observed_port.connect(cov.ahb_trans_observed_imp);
    ahb_mst.monitor.item_observed_port.connect(scb.ahb_trans_observed_imp);
  endfunction

  function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
  endfunction

  function void report_phase(uvm_phase phase);
    string reports = "\n";
    super.report_phase(phase);
    reports = {reports, $sformatf("=============================================== \n")};
    reports = {reports, $sformatf("CURRENT TEST SUMMARY \n")};
    reports = {reports, $sformatf("SEQUENCE CHECK COUNT : %0d \n", cfg.seq_check_count)};
    reports = {reports, $sformatf("SEQUENCE CHECK ERROR : %0d \n", cfg.seq_check_error)};
    reports = {reports, $sformatf("SCOREBOARD CHECK COUNT : %0d \n", cfg.scb_check_count)};
    reports = {reports, $sformatf("SCOREBOARD CHECK ERROR : %0d \n", cfg.scb_check_error)};
    reports = {reports, $sformatf("=============================================== \n")};
    `uvm_info("TEST_SUMMARY", reports, UVM_LOW)
  endfunction

endclass



`endif // RKV_AHBRAM_ENV_SV
