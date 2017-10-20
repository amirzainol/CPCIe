###Naming Convention

The filename to compress/decompress use the following convention:

`<filename>_<filesize>_<mode>_<blocksize>_<filetype>_<process>`

filename: is the filename used

filesize: the size of the file

mode: three different modes which are U, C, or D; for Uncompressed, Compressed, or Decompressed, respectively

blocksize: the blocksize to compress

filetype: two different filetype either bin (binary) or hex (hexadecimal)

process: from either two different process; sim (simulation) or imp (implementationon FPGA)

####Example

`alice_4096_C_1024_bin_sim`

####Notes

However, for Uncompressed file use this convention:

`<filename>_<filesize>_<mode>_<filetype>`
