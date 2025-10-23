return {
    "sindrets/diffview.nvim",
    config = function()
        -- Function to toggle Diffview
        local function toggle_diffview()
            local lib = require("diffview.lib")
            local view = lib.get_current_view()
            if view then
                vim.cmd("DiffviewClose")
            else
                vim.cmd("DiffviewOpen")
            end
        end

        -- Function to choose a branch and compare it with current branch
        local function diff_against_branch()
            -- Get list of local branches
            local handle = io.popen("git branch --format='%(refname:short)' 2>/dev/null")
            if not handle then
                vim.notify("Failed to get git branches", vim.log.levels.ERROR)
                return
            end
            local branches = {}
            for line in handle:lines() do
                table.insert(branches, line)
            end
            handle:close()

            if #branches == 0 then
                vim.notify("No git branches found", vim.log.levels.WARN)
                return
            end

            -- Ask user to pick one
            vim.ui.select(branches, { prompt = "Compare current branch with:" }, function(choice)
                if choice then
                    vim.cmd("DiffviewOpen " .. choice)
                end
            end)
        end

        -- Keymaps
        vim.keymap.set("n", "<leader>dv", toggle_diffview, { desc = "Toggle Diffview" })
        vim.keymap.set("n", "<leader>dV", diff_against_branch, { desc = "Diffview: Compare with branch" })
    end,
}

