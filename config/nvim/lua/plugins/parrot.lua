return {
  "frankroeder/parrot.nvim",
  dependencies = { "ibhagwan/fzf-lua", "nvim-lua/plenary.nvim" },
  opts = {
    providers = {
      mistral = {
        api_key = os.getenv "MISTRAL_API_KEY",
        endpoint = "https://api.mistral.ai/v1/chat/completions",
        topic_prompt = "You only respond with 3 to 4 words to summarize the past conversation.",
        topic = {
          model = "codestral-latest",
          params = { max_tokens = 32 },
        },
        -- default parameters for the actual model
        params = {
          chat = { max_tokens = 4096 },
          command = { max_tokens = 4096 },
        },
      },
      anthropic = {
        api_key = os.getenv "CLAUDE_API_KEY",
        endpoint = "https://api.anthropic.com/v1/messages",
        topic_prompt = "You only respond with 3 to 4 words to summarize the past conversation.",
        topic = {
          model = "claude-3-7-sonnet-20250219",
          params = { max_tokens = 32 },
        },
        -- default parameters for the actual model
        params = {
          chat = { max_tokens = 4096 },
          command = { max_tokens = 4096 },
        },
      },
    },
    hooks = {
      Debug = function(prt, params)
        local template = [[
        I want you to act as {{filetype}} expert.
        Review the following code, carefully examine it, and report potential
        bugs and edge cases alongside solutions to resolve them.
        Keep your explanation short and to the point:

        ```{{filetype}}
        {{selection}}
        ```
        ]]
        local model_obj = prt.get_model "command"
        prt.logger.info("Debugging selection with model: " .. model_obj.name)
        prt.Prompt(params, prt.ui.Target.enew, model_obj, nil, template)
      end,
    },
  },
  config = function(_, opts) require("parrot").setup(opts) end,
  keys = {
    { "<Leader>ac", "<cmd>PrtChatNew<cr>", mode = { "n", "i" }, desc = "New Chat" },
    { "<Leader>ac", ":<C-u>'<,'>PrtChatNew<cr>", mode = { "v" }, desc = "Visual Chat New" },
    { "<Leader>ar", "<cmd>PrtChatRespond<cr>", mode = { "n", "i" }, desc = "New Chat" },
    { "<Leader>at", "<cmd>PrtChatToggle<cr>", mode = { "n", "i" }, desc = "Toggle Popup Chat" },
    { "<Leader>af", "<cmd>PrtChatFinder<cr>", mode = { "n", "i" }, desc = "Chat Finder" },
    { "<Leader>aR", "<cmd>PrtRewrite<cr>", mode = { "n", "i" }, desc = "Inline Rewrite" },
    { "<Leader>aR", ":<C-u>'<,'>PrtRewrite<cr>", mode = { "v" }, desc = "Visual Rewrite" },
    {
      "<Leader>aj",
      "<cmd>PrtRetry<cr>",
      mode = { "n" },
      desc = "Retry rewrite/append/prepend command",
    },
    { "<Leader>aa", "<cmd>PrtAppend<cr>", mode = { "n", "i" }, desc = "Append" },
    { "<Leader>aa", ":<C-u>'<,'>PrtAppend<cr>", mode = { "v" }, desc = "Visual Append" },
    { "<Leader>ao", "<cmd>PrtPrepend<cr>", mode = { "n", "i" }, desc = "Prepend" },
    { "<Leader>ao", ":<C-u>'<,'>PrtPrepend<cr>", mode = { "v" }, desc = "Visual Prepend" },
    { "<Leader>ae", ":<C-u>'<,'>PrtEnew<cr>", mode = { "v" }, desc = "Visual Enew" },
    { "<Leader>as", "<cmd>PrtStop<cr>", mode = { "n", "i", "v", "x" }, desc = "Stop" },
    {
      "<Leader>ai",
      ":<C-u>'<,'>PrtImplement<cr>",
      mode = { "n", "i", "v", "x" },
      desc = "Complete visual selection",
    },
    { "<Leader>ax", "<cmd>PrtContext<cr>", mode = { "n" }, desc = "Open context file" },
    { "<Leader>an", "<cmd>PrtModel<cr>", mode = { "n" }, desc = "Select model" },
    { "<Leader>ap", "<cmd>PrtProvider<cr>", mode = { "n" }, desc = "Select provider" },
    { "<Leader>aq", "<cmd>PrtAsk<cr>", mode = { "n" }, desc = "Ask a question" },
  },
}
