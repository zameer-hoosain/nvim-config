local telescope_status_ok, telescope = pcall(require, "telescope")
if not telescope_status_ok then
  return
end

local telescope_actions_status_ok, telescope_actions = pcall(require, "telescope.actions")
if not telescope_actions_status_ok then
  return
end

telescope.setup({
    defaults = {
        mappings = {
            i = { ["<Esc>"] = telescope_actions.close },
        },
    },
})
