// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2013.3
// Copyright (C) 2013 Xilinx Inc. All rights reserved.
// 
// ==============================================================

/***************************** Include Files *********************************/
#include "xmatrixmul_accel_core.h"

/************************** Function Implementation *************************/
int XMatrixmul_accel_core_Initialize(XMatrixmul_accel_core *InstancePtr, XMatrixmul_accel_core_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_bus_BaseAddress = ConfigPtr->Control_bus_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}

void XMatrixmul_accel_core_Start(XMatrixmul_accel_core *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMatrixmul_accel_core_ReadReg(InstancePtr->Control_bus_BaseAddress, XMATRIXMUL_ACCEL_CORE_CONTROL_BUS_ADDR_AP_CTRL) & 0x80;
    XMatrixmul_accel_core_WriteReg(InstancePtr->Control_bus_BaseAddress, XMATRIXMUL_ACCEL_CORE_CONTROL_BUS_ADDR_AP_CTRL, Data | 0x01);
}

u32 XMatrixmul_accel_core_IsDone(XMatrixmul_accel_core *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMatrixmul_accel_core_ReadReg(InstancePtr->Control_bus_BaseAddress, XMATRIXMUL_ACCEL_CORE_CONTROL_BUS_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XMatrixmul_accel_core_IsIdle(XMatrixmul_accel_core *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMatrixmul_accel_core_ReadReg(InstancePtr->Control_bus_BaseAddress, XMATRIXMUL_ACCEL_CORE_CONTROL_BUS_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XMatrixmul_accel_core_IsReady(XMatrixmul_accel_core *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMatrixmul_accel_core_ReadReg(InstancePtr->Control_bus_BaseAddress, XMATRIXMUL_ACCEL_CORE_CONTROL_BUS_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XMatrixmul_accel_core_EnableAutoRestart(XMatrixmul_accel_core *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMatrixmul_accel_core_WriteReg(InstancePtr->Control_bus_BaseAddress, XMATRIXMUL_ACCEL_CORE_CONTROL_BUS_ADDR_AP_CTRL, 0x80);
}

void XMatrixmul_accel_core_DisableAutoRestart(XMatrixmul_accel_core *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMatrixmul_accel_core_WriteReg(InstancePtr->Control_bus_BaseAddress, XMATRIXMUL_ACCEL_CORE_CONTROL_BUS_ADDR_AP_CTRL, 0);
}

void XMatrixmul_accel_core_InterruptGlobalEnable(XMatrixmul_accel_core *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMatrixmul_accel_core_WriteReg(InstancePtr->Control_bus_BaseAddress, XMATRIXMUL_ACCEL_CORE_CONTROL_BUS_ADDR_GIE, 1);
}

void XMatrixmul_accel_core_InterruptGlobalDisable(XMatrixmul_accel_core *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMatrixmul_accel_core_WriteReg(InstancePtr->Control_bus_BaseAddress, XMATRIXMUL_ACCEL_CORE_CONTROL_BUS_ADDR_GIE, 0);
}

void XMatrixmul_accel_core_InterruptEnable(XMatrixmul_accel_core *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XMatrixmul_accel_core_ReadReg(InstancePtr->Control_bus_BaseAddress, XMATRIXMUL_ACCEL_CORE_CONTROL_BUS_ADDR_IER);
    XMatrixmul_accel_core_WriteReg(InstancePtr->Control_bus_BaseAddress, XMATRIXMUL_ACCEL_CORE_CONTROL_BUS_ADDR_IER, Register | Mask);
}

void XMatrixmul_accel_core_InterruptDisable(XMatrixmul_accel_core *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XMatrixmul_accel_core_ReadReg(InstancePtr->Control_bus_BaseAddress, XMATRIXMUL_ACCEL_CORE_CONTROL_BUS_ADDR_IER);
    XMatrixmul_accel_core_WriteReg(InstancePtr->Control_bus_BaseAddress, XMATRIXMUL_ACCEL_CORE_CONTROL_BUS_ADDR_IER, Register & (~Mask));
}

void XMatrixmul_accel_core_InterruptClear(XMatrixmul_accel_core *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMatrixmul_accel_core_WriteReg(InstancePtr->Control_bus_BaseAddress, XMATRIXMUL_ACCEL_CORE_CONTROL_BUS_ADDR_ISR, Mask);
}

u32 XMatrixmul_accel_core_InterruptGetEnabled(XMatrixmul_accel_core *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XMatrixmul_accel_core_ReadReg(InstancePtr->Control_bus_BaseAddress, XMATRIXMUL_ACCEL_CORE_CONTROL_BUS_ADDR_IER);
}

u32 XMatrixmul_accel_core_InterruptGetStatus(XMatrixmul_accel_core *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XMatrixmul_accel_core_ReadReg(InstancePtr->Control_bus_BaseAddress, XMATRIXMUL_ACCEL_CORE_CONTROL_BUS_ADDR_ISR);
}

