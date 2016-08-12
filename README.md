# CPCIe - Compression-enabled PCIe

CPCIe is a hardware compressor/decompressor implemented on FPGA, to compress/decompress data between Host PC and FPGA via PCIe interface.

#### Table of Contents

- [Files in the Repository](#files-and-folders-in-the-repository)
- [Resource Utilization](#resource-utilization)

Files and Folders in the Repository
-----------------------------------

#### README.md

This file.

#### EDK/

This is the Xilinx EDK (Embedded Development Kit) using Xilinx XPS (Xilinx Platform Studio). The version used is EDK 14.7.

#### MyRepository/

All the developed IP cores in `MyRepository/` are in the public domain. 

#### SDK/

This is the Xilinx SDK (Software Development Kit).

#### datasets/

Datasets used for testing purposes.

#### hostpc/

The communication on Host PC's side is located in this folder. We use Xillybus for PCIe communication and developed our own software to communicate/control the FPGA.

#### hw_acc/

This folder is the collection of Hardware Accelerator used in our test platform.

#### pcie_xillybus/

The hardware, implemented on Xilinx FPGA, used by Xillybus.

Resource Utilization
-----------------------------------

Table below shows the utilization of each component used in CPCIe, synthesized using Xilinx XST version 14.7. Most of them are located in the [/MyRepository/pcores/](/MyRepository/pcores/) folder.

| Component               | LUTs       | Registers      | BRAMs           |
|:------------------------| ----------:| --------------:| ---------------:|
| Xillybus                |       4418 |             5515 |             9 |
| CPCIe Custom Interface  |        228 |             315  |             3 |
| AXI-4 Stream Switch     |        720 |             81   |             0 |
| X-MatchPRO Engine       |       8013 |             3187 |            14 |
| MicroBlaze Processor    |        657 |             1002 |             2 |
| AXI4-Lite Interface     |        364 |             154  |             0 |
