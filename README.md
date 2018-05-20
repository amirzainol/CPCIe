# CPCIe - Compression-enabled PCIe

CPCIe is a hardware compressor/decompressor implemented on FPGA, to compress/decompress data between Host PC and FPGA via PCIe interface.

#### Table of Contents

- [Files in the Repository](#files-and-folders-in-the-repository)
- [Resource Utilization](#resource-utilization)
- [Getting Started](#getting-started)
- [Issues](#issues)

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

Getting Started
-----------------------------------

1. Run TCL script from the [/PROJECT_FILES/standalone/](PROJECT_FILES/standalone/) folder.
2. Synthesize the design.
3. Generate the bitstream before testing on an FPGA board (CPCIe supports Xilinx board at the moment).
4. Run SDK.
5. Exercise the system with a dataset.
6. There are two IP Cores which can be extended for further research: scheduler and X-MatchPRO compressor/decompressor engines. These IP Cores can be found in ip_repo.

Issues
-----------------------------------

We are trying our best to ensure this project is accessible to public use for research purposes without any issues. For the time being, CPCIe guarantees the dataset can be compressed and decompressed to its original data without any bit loses. The only thing needs to be carefully taken is to make sure that the clock and reset signals are correctly wired to meet the timing, and thus to avoid any bit errors.
