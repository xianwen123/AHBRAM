`ifndef RKV_AHBRAM_RESET_W2R_TEST_SV
`define RKV_AHBRAM_RESET_W2R_TEST_SV

class rkv_ahbram_reset_w2r_test extends rkv_ahbram_base_test;

  `uvm_component_utils(rkv_ahbram_reset_w2r_test)

  function new (string name = "rkv_ahbram_reset_w2r_test", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction

  task run_phase(uvm_phase phase);
    rkv_ahbram_reset_w2r_virt_seq seq = rkv_ahbram_reset_w2r_virt_seq::type_id::create("this");
    super.run_phase(phase);
    phase.raise_objection(this);
    seq.start(env.virt_sqr);
    phase.drop_objection(this);
  endtask

endclass

`endif
