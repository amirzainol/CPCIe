library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity axis_to_fifo_wrapper is

  port (
    FIFO_RD_CLK : in STD_LOGIC;
    FIFO_RD_RST : in STD_LOGIC;
    FIFO_RD_empty : out STD_LOGIC;
    FIFO_RD_rd_data : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FIFO_RD_rd_en : in STD_LOGIC;
    FIFO_WR_full : out STD_LOGIC;
    FIFO_WR_wr_data : in STD_LOGIC_VECTOR ( 31 downto 0 );
    FIFO_WR_wr_en : in STD_LOGIC;
    S_AXIS_CLK : in STD_LOGIC
  );
  
end axis_to_fifo_wrapper;

architecture STRUCTURE of axis_to_fifo_wrapper is

  component axis_to_fifo is
  port (
    FIFO_WR_full : out STD_LOGIC;
    FIFO_WR_wr_data : in STD_LOGIC_VECTOR ( 31 downto 0 );
    FIFO_WR_wr_en : in STD_LOGIC;
    FIFO_RD_empty : out STD_LOGIC;
    FIFO_RD_rd_data : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FIFO_RD_rd_en : in STD_LOGIC;
    FIFO_RD_RST : in STD_LOGIC;
    S_AXIS_CLK : in STD_LOGIC;
    FIFO_RD_CLK : in STD_LOGIC
  );
  end component axis_to_fifo;
  
  signal FIFO_WR_out_full : std_logic;
  
begin

  FIFO_WR_full <= not FIFO_WR_out_full;

axis_to_fifo_i: component axis_to_fifo
    port map (
      FIFO_RD_CLK => FIFO_RD_CLK,
      FIFO_RD_RST => FIFO_RD_RST,
      FIFO_RD_empty => FIFO_RD_empty,
      FIFO_RD_rd_data(31 downto 0) => FIFO_RD_rd_data(31 downto 0),
      FIFO_RD_rd_en => FIFO_RD_rd_en,
      FIFO_WR_full => FIFO_WR_out_full,
      FIFO_WR_wr_data(31 downto 0) => FIFO_WR_wr_data(31 downto 0),
      FIFO_WR_wr_en => FIFO_WR_wr_en,
      S_AXIS_CLK => S_AXIS_CLK
    );
    
end STRUCTURE;
