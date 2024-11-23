return {
  -- NOTE: Enabled by default, but keep opts here for customization
  -- https://www.lazyvim.org/plugins/coding#miniai
  {
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [']quote
    --  - ci'  - [C]hange [I]nside [']quote
    "echasnovski/mini.ai",
    opts = {
      n_lines = 500,
    },
  },
}
