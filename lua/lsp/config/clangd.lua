local common = require("lsp.common-config")
local opts = {
	settings = {
		cpp = { 'clangd' },
	},

	on_attach = function(client, bufnr)
		common.disableFormat(client)
		common.keyAttach(bufnr) -- 禁用格式化功能，交给专门插件插件处理
		-- client.server_capabilities.document_formatting = false
		-- client.server_capabilities.document_range_formatting = false

		-- local function buf_set_keymap(...)
		--     vim.api.nvim_buf_set_keymap(bufnr, ...)
		-- end
		--
		-- -- 绑定快捷键
		-- require('keybindings').mapLSP(buf_set_keymap)
	end,
}

return {
	on_setup = function(server)
		server.setup(opts)
	end,
}
