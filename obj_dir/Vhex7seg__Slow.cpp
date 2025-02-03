// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vhex7seg.h for the primary calling header

#include "Vhex7seg.h"
#include "Vhex7seg__Syms.h"

//==========
CData/*6:0*/ Vhex7seg::__Vtable1_y[16];

VL_CTOR_IMP(Vhex7seg) {
    Vhex7seg__Syms* __restrict vlSymsp = __VlSymsp = new Vhex7seg__Syms(this, name());
    Vhex7seg* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Reset internal values
    
    // Reset structure values
    _ctor_var_reset();
}

void Vhex7seg::__Vconfigure(Vhex7seg__Syms* vlSymsp, bool first) {
    if (false && first) {}  // Prevent unused
    this->__VlSymsp = vlSymsp;
    if (false && this->__VlSymsp) {}  // Prevent unused
    Verilated::timeunit(-12);
    Verilated::timeprecision(-12);
}

Vhex7seg::~Vhex7seg() {
    VL_DO_CLEAR(delete __VlSymsp, __VlSymsp = NULL);
}

void Vhex7seg::_eval_initial(Vhex7seg__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vhex7seg::_eval_initial\n"); );
    Vhex7seg* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
}

void Vhex7seg::final() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vhex7seg::final\n"); );
    // Variables
    Vhex7seg__Syms* __restrict vlSymsp = this->__VlSymsp;
    Vhex7seg* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
}

void Vhex7seg::_eval_settle(Vhex7seg__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vhex7seg::_eval_settle\n"); );
    Vhex7seg* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->_combo__TOP__1(vlSymsp);
}

void Vhex7seg::_ctor_var_reset() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vhex7seg::_ctor_var_reset\n"); );
    // Body
    a = VL_RAND_RESET_I(4);
    y = VL_RAND_RESET_I(7);
    __Vtableidx1 = 0;
    __Vtable1_y[0] = 0x40U;
    __Vtable1_y[1] = 0x79U;
    __Vtable1_y[2] = 0x24U;
    __Vtable1_y[3] = 0x30U;
    __Vtable1_y[4] = 0x19U;
    __Vtable1_y[5] = 0x12U;
    __Vtable1_y[6] = 2U;
    __Vtable1_y[7] = 0x78U;
    __Vtable1_y[8] = 0U;
    __Vtable1_y[9] = 0x10U;
    __Vtable1_y[10] = 8U;
    __Vtable1_y[11] = 3U;
    __Vtable1_y[12] = 0x46U;
    __Vtable1_y[13] = 0x21U;
    __Vtable1_y[14] = 6U;
    __Vtable1_y[15] = 0xeU;
}
